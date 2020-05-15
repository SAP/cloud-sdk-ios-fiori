//
//  NetworkService.swift
//  AnyCodable
//
//  Created by Ma, Xiao on 2/17/20.
//

import Foundation
import UIKit

enum NetworkRouter: String {
    typealias RawValue = String
    
    static let baseURLString = "https://openui5.hana.ondemand.com/1.77.2/test-resources/sap/ui/integration/demokit/cardExplorer/webapp/samples"
    
    case image      = "image/"
    
    static func getIconURL(name: String) throws -> URLRequest {
        let url = try baseURLString.asURL()
        let finalURL = url.appendingPathComponent(name)
        let urlRequest = URLRequest(url: finalURL)
        
        return urlRequest
    }
}

public class NetworkService {
    
    public static let shared: NetworkService = NetworkService()
    
    private init() {}
            
    private func makeRequest(_ urlRequest: URLRequest, _ callback: @escaping (Result<Data, NetworkError>) -> Void) {
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if error != nil {
                callback(.failure(.badAccess))
            }
            guard let _data = data else {
                callback(.failure(.noData))
                return
            }
            callback(.success(_data))
        }
        task.resume()
    }
}

extension NetworkService {
    
    func getIcon(iconName: String, _ callback: @escaping (_ succeed: Bool, _ icon: UIImage?, _ errMessage: String?) -> Void) {
        let urlRequest = try! NetworkRouter.getIconURL(name: iconName)
        self.makeRequest(urlRequest) { (result) in
            switch result {
            case .failure(let error):
                callback(false, nil, error.localizedDescription)
            case .success(let data):
                let image = UIImage(data: data)
                callback(true, image, nil)
            }
        }
    }
}
