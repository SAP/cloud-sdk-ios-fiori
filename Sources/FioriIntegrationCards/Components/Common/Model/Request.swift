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
    
    func send() {
        
        // TODO: build URLRequest from the request configurations parsed and retrieved from App.dataSources
        let url = URL(string: self.url)!
        
        subscription = URLSession.shared
        .dataTaskPublisher(for: url)
            .print("C")
            .map(\.data)
        .print("D")
        .sink(receiveCompletion: { completion in
            if case .failure(let err) = completion {
              print("Retrieving data failed with error \(err)")
            }
          }, receiveValue: { object in
            print("Retrieved object \(object)")
            self.fetchedData.send(object)
//            self.result.send(completion: .finished)
        })
    }
    
    public let fetchedData = PassthroughSubject<Data, Never>()
    private var subscription: AnyCancellable? = nil
}
