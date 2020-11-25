import AnyCodable
import Combine
import Foundation

extension ListCard: Hashable {
    public static func == (lhs: ListCard, rhs: ListCard) -> Bool {
        lhs.header == rhs.header &&
            lhs.content == rhs.content
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(header)
        hasher.combine(content)
    }
}

public class ListCard: OneManyCard<ListCardItem> {}

public struct ListCardItem: Decodable, Identifiable, Hashable {
    public let title: String?
    public let description: String?
    public let info: Info?
    public let highlight: Highlight?
    public let icon: Icon?
    public let actions: [Action]?
    public let id: String = UUID().uuidString
}

extension ListCardItem: Placeholding {
    public func replacingPlaceholders(withValuesIn objects: Any...) -> ListCardItem {
        let _title: String? = self.title?.replacingPlaceholders(withValuesIn: objects)
        let _description: String? = self.description?.replacingPlaceholders(withValuesIn: objects)
        let _info = self.info?.replacingPlaceholders(withValuesIn: objects)
        let _highlight = self.highlight?.replacingPlaceholders(withValuesIn: objects)
        let _icon = self.icon?.replacingPlaceholders(withValuesIn: objects)
        let _actions = self.actions?.replacingPlaceholders(withValuesIn: objects)
        return ListCardItem(title: _title, description: _description, info: _info, highlight: _highlight, icon: _icon, actions: _actions)
    }
}

extension Array where Element == String {
    func replacingPlaceholders(withValuesIn objects: Any...) -> [String] {
        map { $0.replacingPlaceholders(withValuesIn: objects) }
    }
}

/*
 public class ListCard_DEP: Decodable, ObservableObject {
    
     public var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    
     struct Item: Decodable, Identifiable, Hashable {
         let title: String?
         let description: String?
         let info: [String]?
         let highlight: Highlight?
         let icon: Icon?
         let actions: [Action]?
         let id: String = UUID().uuidString
     }
    
     let header: Header
     let bindingPlaceholders: Item
    
     let items = CurrentValueSubject<[Item], Never>([])
    
     required public init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: HavingHeader.CodingKeys.self)
        
         header = try container.decode(Header.self, forKey: .header)
         let value = try HavingContent<HavingItem>(from: decoder)
         bindingPlaceholders = value.content.item
        
         items.receive(on: RunLoop.main)
             .sink(receiveValue: { _ in self.objectWillChange.send() })
             .store(in: &subscribers)
        
         let data = try HavingContent<HavingData<CardData>>(from: decoder)
        
         CurrentValueSubject<Item, Never>(bindingPlaceholders)
             .combineLatest(data.content.data.jsonObject) { (item, jsonArray) -> [Item] in
                 return jsonArray.map {
                     let _icon = item.icon?.replacingPlaceholders(withValuesIn: $0)
                     let _title = item.title?.replacingPlaceholders(withValuesIn: $0)
                     let _description = item.description?.replacingPlaceholders(withValuesIn: $0)
                     let _highlight = item.highlight?.replacingPlaceholders(withValuesIn: $0)
                     return Item(title: _title, description: _description, info: nil, highlight: _highlight, icon: _icon, actions: nil)
                 }
         }
         .sink(receiveValue: { [weak self] in
             self?.items.send($0)
         })
         .store(in: &subscribers)
     }
    
     private var subscribers = Set<AnyCancellable>()
    
     private struct HavingItem: Decodable {
         let item: Item
     }
    
     private struct HavingData<Model: Decodable>: Decodable {
         let data: Model
     }
    
 //    func transformedData() -> [Item] {
 //        guard let json = data.json else { return [] }
 //        return json.map {
 ////            let data = $0.compactMapValues( { $0.value })
 //            let data = $0
 //            let _icon = item.icon?.replacingPlaceholders(withValuesIn: data)
 //            let _title = item.title?.replacingPlaceholders(withValuesIn: data)
 //            let _description = item.description?.replacingPlaceholders(withValuesIn: data)
 //            let _highlight = item.highlight?.replacingPlaceholders(withValuesIn: data)
 //            return Item(title: _title, description: _description, info: nil, highlight: _highlight, icon: _icon, actions: nil)
 //        }
 //    }
 }
 */

// MARK: - Binding structs: will contain placeholder strings

// private protocol HavingCardData {
//    associatedtype JSONModel: Decodable
//    associatedtype Item: Decodable
//    var data: CardData<JSONModel> { get }
//    var item: Item { get }
// }

enum ParseError: Error {
    case convert
}

/*
 do {
     let parsed = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
     switch parsed {
     case is NSDictionary:
         let jsonDict = parsed as! JSONDictionary
         if let root: JSONArray = resolve(jsonDict, keyPath: path, separator: "/") {
             print("set async")
             DispatchQueue.main.async {
                 self.data = root.map { Data.init(data: $0, binding: self.item) }
             }
         }
     case is NSArray:
         let jsonArray = parsed as! JSONArray
         print("jsonArray: \(jsonArray)")
     default:
         break
     }
 } catch {
     print(error)
 }
 */
