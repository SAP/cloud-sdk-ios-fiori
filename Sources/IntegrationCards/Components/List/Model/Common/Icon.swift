//
//  Icon.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/20/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine


final public class Icon: Decodable, AnyBodyProducing, ObservableObject {
    public let src: String
    public let id: UUID = UUID()
    
    @Published var imageData: UIImage? {
        willSet {
            print("image data coming in: \(self.id.uuidString)")
        }
    }
    
    func body() -> AnyView {
        
        guard let url = URL(string: src)?.standardized else { return AnyView(EmptyView()) }
        
        switch url.scheme {
        case .none:
            let imageURL = Bundle.main.bundleURL.appendingPathComponent(url.absoluteString)
            do {
                let data = try Data(contentsOf: imageURL)
                guard let uiImage = UIImage(data: data) else { return AnyView(EmptyView()) }
                return AnyView(
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 45, height: 45, alignment: .center)
                )
            } catch {
                print(error)
            }
        case .some(let value) where value.contains("http"):
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                
                guard error == nil else { print(String(describing: error!)); return }
                
                guard let data = data else { print((String(describing: response!))); return }
                
                self.imageData = UIImage(data: data)
            }
            task.resume()
        default:
            break
        }

        return AnyView(EmptyView())
    }
    
    enum CodingKeys: CodingKey {
        case src, imageData
    }
    
    init(src: String) {
        self.src = src
        imageData = nil
    }
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        src = try container.decode(String.self, forKey: .src)
        imageData = nil
    }
}

extension Icon: Placeholding {
    func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> Icon {
        let _src = src.replacingPlaceholders(withValuesIn: dictionary)
        return Icon(src: _src)
    }
    
    
}

extension Icon: Hashable {
    public static func == (lhs: Icon, rhs: Icon) -> Bool {
        return lhs.src == rhs.src
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(src)
    }
}
