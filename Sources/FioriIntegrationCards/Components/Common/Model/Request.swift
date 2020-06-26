//
//  Request.swift
//  AnyCodable
//
//  Created by Stan Stadelman on 3/21/20.
//

import Foundation
import Combine

class Request: Decodable {

    /// The URL of the request. If the URL is relative, it is going to be resolved based on the page instead of the manifest base path.
    let url: String
    
    /// The mode of the request. Possible values are `"cors"`, `"no-cors"`, `"same-origin"`. Default value is `"cors"`.
    let mode: String
    
    /// The HTTP method. Possible values are `"GET"`,`"POST"`. Default value is `"GET"`.
    let method: String
    
    /// The HTTP headers of the request.
    let headers: [String: String]
    
    /// The request parameters. If the method is `"POST"` the parameters will be put as key/value pairs into the body of the request.
    let parameters: [String: String]
    
    /// Indicates whether cross-site requests should be made using credentials.
    // TODO:  unsupported
    let withCredentials: Bool
    
    private enum CodingKeys: String, CodingKey {
        case url, mode, method, headers, parameters, withCredentials
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decode(String.self, forKey: .url)
        mode = try container.decodeIfPresent(String.self, forKey: .mode) ?? "cors"
        method = try container.decodeIfPresent(String.self, forKey: .mode) ?? "GET"
        headers = try container.decodeIfPresent([String: String].self, forKey: .headers) ?? [:]
        parameters = try container.decodeIfPresent([String: String].self, forKey: .parameters) ?? [:]
        withCredentials = try container.decodeIfPresent(Bool.self, forKey: .withCredentials) ?? false
    }
    
    func send(baseURL: String?) {
        if let url = URL(string: self.url), self.url.isValidURL {
            if let data = getDataFromBundle(bundleURL: url) {
                self.fetchedData.send(data)
            } else {
                loadDataFromNetwork(baseURL: baseURL)
            }
        } else {
            if let baseURL = baseURL {
                if let finalURL = URL(string: self.url, relativeTo: URL(string: baseURL)) {
                    if let data = getDataFromBundle(bundleURL: finalURL) {
                        self.fetchedData.send(data)
                    } else {
                        loadDataFromNetwork(baseURL: baseURL)
                    }
                }
            }
        }
    }
    
    func getDataFromBundle(bundleURL: URL) -> Data? {
        guard bundleURL.isFileURL else {
            return nil
        }
        do {
            let data = try Data(contentsOf: bundleURL)
            return data
        } catch {
            print(error)
            return nil
        }
    }
    
    func loadDataFromNetwork(baseURL: String?) {
        var urlRequest: URLRequest!
        do {
            if let _baseURL = baseURL {
                urlRequest = try NetworkRouter.getURLRequest(with: self, baseURL: URL(string: _baseURL))
            } else {
                urlRequest = try NetworkRouter.getURLRequest(with: self)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        subscription = URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Retrieving data failed with error \(error)")
                case .finished:
                    self.fetchedData.send(completion: .finished)
                }
            }, receiveValue: { object in
                self.fetchedData.send(object)
            })
    }
    
    public let fetchedData = PassthroughSubject<Data, Never>()
    private var subscription: AnyCancellable? = nil
}

extension Request: Equatable {
    static func == (lhs: Request, rhs: Request) -> Bool {
        return lhs.url == rhs.url &&
            lhs.mode == rhs.mode &&
            lhs.method == rhs.method &&
            lhs.headers == rhs.headers &&
            lhs.parameters == rhs.parameters &&
            lhs.withCredentials == rhs.withCredentials
    }
}

extension Request: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(url)
        hasher.combine(mode)
        hasher.combine(method)
        hasher.combine(headers)
        hasher.combine(parameters)
        hasher.combine(withCredentials)
    }
}
