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
    
    public var size: CGFloat?
    
    public var name: String? {
        get {
            return src.iconName()
        }
    }
    
    enum CodingKeys: CodingKey {
        case src
    }
    
    func body() -> AnyView {
        guard let validIcon = self.src.validIcon() else {
            return AnyView(EmptyView())
        }
        
        return AnyView(
            Text(validIcon)
                .font(.custom("SAP-icons", size: self.size ?? 30))
        )
    }
//
//    func getFont() -> Font {
//        guard let sapFont = UIFont(name: "SAP-icons", size: UIFont.labelFontSize) else {
//            fatalError("""
//               Failed to load the "SAP-Icons" font.
//               Make sure the font file is included in the project and the font name is spelled correctly.
//               """
//            )
//        }
//        return Font(UIFontMetrics.default.scaledFont(for: sapFont))
//    }
    
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
