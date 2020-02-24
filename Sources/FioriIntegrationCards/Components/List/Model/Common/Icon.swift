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


final public class Icon: Decodable, ObservableObject {
    
    public let src: String
    public let id: UUID = UUID()
    
    enum CodingKeys: CodingKey {
        case src
    }
    
    init(src: String) {
        self.src = src
    }
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        src = try container.decode(String.self, forKey: .src)
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

struct AsyncImageView: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    
    init(url: String?) {
        self.imageLoader.load(imageName: url)
    }
    
    var body: some View {
        makeBody()
    }
    
    func makeBody() -> AnyView {
        guard let image = self.imageLoader.image else {
            return AnyView(EmptyView())
        }
        return AnyView(
            Image(uiImage: image)
                .resizable()
        )
    }
}

final class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    func load(imageName: String?) {
        guard let name = imageName else {
            return
        }
        
        NetworkService.shared.getIcon(iconName: name) { (succeed, image, err) in
            guard succeed else {
                print(err!)
                DispatchQueue.main.async {
                    self.image = nil
                }
                return
            }
            
            print("got an image")
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
