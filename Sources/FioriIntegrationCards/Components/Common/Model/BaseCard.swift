import AnyCodable
import Combine
import Foundation
import ObservableArray

/// JSON data must be in `array` form
open class OneOneCard<Template: Decodable & Placeholding>: BaseCard<Template> {
    @Published var content: Template? {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        contentPublisher
            .compactMap { $0?.value }
            .tryMap { (try JSONSerialization.jsonObject(with: $0.0, options: .mutableContainers), $0.1) }
            .compactMap { o -> Any? in `Any`.resolve(o.0, keyPath: o.1, separator: "/") }
            .sink(receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("FINISHED")
                }
            }, receiveValue: { [unowned self] object in
                self.content = self.template.replacingPlaceholders(withValuesIn: object, self.configuration?.parameters)
            })
            .store(in: &subscribers)
    }
}

/// JSON data must be in `array` form
open class OneManyCard<Template: Decodable & Placeholding>: BaseCard<Template> {
    @Published var content: [Template] = [] {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        contentPublisher
            .compactMap { $0?.value }
            .tryMap { (try JSONSerialization.jsonObject(with: $0.0, options: .mutableContainers), $0.1) }
            .compactMap { o -> Any? in `Any`.resolve(o.0, keyPath: o.1, separator: "/") }
            .sink(receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("FINISHED")
                }
            }, receiveValue: { [unowned self] object in
                if let array = object as? JSONArray {
                    self.content = array.map { self.template.replacingPlaceholders(withValuesIn: $0, self.configuration?.parameters as Any) }
                } else if let dict = object as? JSONDictionary {
                    self.content = [self.template.replacingPlaceholders(withValuesIn: dict, self.configuration?.parameters as Any)]
                }
            })
            .store(in: &subscribers)
    }
}

open class ManyManyCard<Template: Decodable & Placeholding & Sequence>: BaseCard<Template> where Template.Element: Placeholding {
    @Published var content: Template? = nil {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        contentPublisher
            .compactMap { $0?.value }
            .tryMap { (try JSONSerialization.jsonObject(with: $0.0, options: .mutableContainers), $0.1) }
            .compactMap { o -> Any? in `Any`.resolve(o.0, keyPath: o.1, separator: "/") }
            .sink(receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("FINISHED")
                }
            }, receiveValue: { [unowned self] object in
                if let array = object as? JSONArray {
                    self.content = zip(self.template, array).map { $0.0.replacingPlaceholders(withValuesIn: $0.1, self.configuration?.parameters as Any) } as? Template
                } else if let dict = object as? JSONDictionary {
                    self.content = self.template.replacingPlaceholders(withValuesIn: dict, self.configuration?.parameters as Any)
                }
            })
            .store(in: &subscribers)
    }
}

open class BaseCard<Template: Decodable & Placeholding>: BackingCard {
    var template: Template!
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        // MARK: - Decode `header`, `content`, `template`, and 3 data fetchers
        
        let container = try decoder.container(keyedBy: BaseCardCodingKeys.self)
        let contentContainer = try container.nestedContainer(keyedBy: BaseCardCodingKeys.self, forKey: .content)
        
        // MARK: get nested Template from content node

        for k in BaseCardCodingKeys.contentKeys {
            if let t = try? contentContainer.decodeIfPresent(Template.self, forKey: k) {
                self.template = t
                break
            }
        }
        
        precondition(self.template != nil, "Unable to load template from card: \(self)")
    }
}

// MARK: - union of all content-related keys across the cards

internal enum BaseCardCodingKeys: CodingKey, CaseIterable {
    case header, data, content, item, groups, row, configuration, maxItems
    
    static let contentKeys: [BaseCardCodingKeys] = [.item, .groups, .row, .maxItems, .data]
}

open class BackingCard: Decodable, ObservableObject, Identifiable {
    open var id: String = UUID().uuidString
    
    @Published var header: Header
    @Published var configuration: Configuration?
    @Published var maxItems: Int? = nil

    internal let _headerData: DataFetcher?
    internal let _configurationData: DataFetcher?
    internal let _cardData: DataFetcher?
    internal let _contentData: DataFetcher?

    public let headerPublisher = CurrentValueSubject<CurrentValueSubject<(Data, String?)?, Never>?, Never>(nil)
    public let configurationPublisher = CurrentValueSubject<CurrentValueSubject<(Data, String?)?, Never>?, Never>(nil)
    public let contentPublisher = CurrentValueSubject<CurrentValueSubject<(Data, String?)?, Never>?, Never>(nil)
    public let baseURL = CurrentValueSubject<URL?, Never>(nil)
    public required init(from decoder: Decoder) throws {
        // MARK: - Decode `header`, `configuration`, `content`, `template`, and 3 data fetchers
        
        let container = try decoder.container(keyedBy: BaseCardCodingKeys.self)

        let tempConfig = try container.decodeIfPresent(Configuration.self, forKey: .configuration)
        _configuration = Published(initialValue: tempConfig)

        var tempHeader: Header!
        if tempConfig == nil {
            tempHeader = try container.decode(Header.self, forKey: .header)
        } else {
            tempHeader = try container.decode(Header.self, forKey: .header).replacingPlaceholders(withValuesIn: tempConfig?.parameters as Any)
        }
        _header = Published(initialValue: tempHeader)

        if let context = decoder.userInfo[.cardContext] as? CardDecodingContext {
            context.configuration = tempConfig
        } else {
            fatalError("Incorrect decoder. Use FioriIntegrationCards.CardDecoder")
        }

        // MARK: get nested data from configuration node

        if tempConfig != nil {
            let configurationContainer = try container.nestedContainer(keyedBy: BaseCardCodingKeys.self, forKey: .configuration)
            self._configurationData = try configurationContainer.decodeIfPresent(DataFetcher.self, forKey: .data)
        } else {
            self._configurationData = nil
        }

        // MARK: get nested data from header node

        let headerContainer = try container.nestedContainer(keyedBy: BaseCardCodingKeys.self, forKey: .header)
        self._headerData = try headerContainer.decodeIfPresent(DataFetcher.self, forKey: .data)
        
        // MARK: get card data

        self._cardData = try container.decodeIfPresent(DataFetcher.self, forKey: .data)
        
        // MARK: get nested data from content node

        let contentContainer = try container.nestedContainer(keyedBy: BaseCardCodingKeys.self, forKey: .content)
        self._contentData = try contentContainer.decodeIfPresent(DataFetcher.self, forKey: .data)

        self.decodeContentMaxItems(contentContainer, tempConfig)
        
        self.headerPublisher
            .compactMap { $0?.value }
            .tryMap { (try JSONSerialization.jsonObject(with: $0.0, options: .mutableContainers), $0.1) }
            .map { `Any`.resolve($0.0, keyPath: $0.1, separator: "/") }
            .sink(receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    print(error)
                case .finished:
                    return
                }
            }, receiveValue: { [unowned self] in
                
                self.header = self.header.replacingPlaceholders(withValuesIn: $0, self.configuration?.parameters)
            })
            .store(in: &self.subscribers)

        self.configurationPublisher
            .compactMap { $0?.value }
            .tryMap { (try JSONSerialization.jsonObject(with: $0.0, options: .mutableContainers), $0.1) }
            .map { `Any`.resolve($0.0, keyPath: $0.1, separator: "/") }
            .sink(receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    print(error)
                case .finished:
                    return
                }
            }, receiveValue: { [unowned self] in

                self.configuration = self.configuration
            })
            .store(in: &self.subscribers)
        
        self.baseURL
            .sink { [unowned self] url in
                guard url != nil else {
                    return
                }
                self._contentData?.load(baseURL: url)
                self._cardData?.load(baseURL: url)
                self._headerData?.load(baseURL: url)
            }
            .store(in: &self.subscribers)
        
        if let headerData = combinedData(cardData: _cardData, headerOrContentData: _headerData) {
            headerData.json.sink { [unowned self] _ in
                self.headerPublisher.send(headerData.json)
            }
            .store(in: &self.subscribers)
        }

        if let configurationData = combinedData(cardData: _cardData, headerOrContentData: _configurationData) {
            configurationData.json.sink { [unowned self] _ in
                self.configurationPublisher.send(configurationData.json)
            }
            .store(in: &self.subscribers)
        }
        
        if let contentData = combinedData(cardData: _cardData, headerOrContentData: _contentData) {
            contentData.json.sink { [unowned self] _ in
                self.contentPublisher.send(contentData.json)
            }
            .store(in: &self.subscribers)
        }
    }

    fileprivate func decodeContentMaxItems(_ contentContainer: KeyedDecodingContainer<BaseCardCodingKeys>, _ tempConfig: Configuration?) {
        do {
            if let maxItemsIntValue = try contentContainer.decodeIfPresent(Int.self, forKey: .maxItems) {
                self.maxItems = maxItemsIntValue
            }
        } catch {
            if let maxItemsStringValue = try? contentContainer.decodeIfPresent(String.self, forKey: .maxItems) {
                let maxItemsIntValue = Int(maxItemsStringValue.replacingPlaceholders(withValuesInSingle: tempConfig?.parameters as Any))
                self.maxItems = maxItemsIntValue ?? 99
            }
        }
    }

    public var objectWillChange = ObservableObjectPublisher()
    internal var subscribers = Set<AnyCancellable>()
    
    func combinedData(cardData: DataFetcher?, headerOrContentData: DataFetcher?) -> DataFetcher? {
        // prioritize the data in header or content
        guard let outputDataWithPath = headerOrContentData else {
            return cardData
        }
        
        // if data exists in the card level, combine it with the path from header or content level
        if let actualData = cardData?.json.value?.0 {
            outputDataWithPath.json.send((actualData, outputDataWithPath.path))
        }
        
        return outputDataWithPath
    }
}
