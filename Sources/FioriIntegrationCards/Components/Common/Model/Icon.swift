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


final public class Icon: Decodable, AnyBodyProducing {

    public let src: String
    public let id: UUID = UUID()
    
    public var size: CGFloat?

    enum CodingKeys: CodingKey {
        case src
    }
    
    func body() -> AnyView {
        if let validIcon = self.src.validIcon()  {
            return AnyView(
                Text(validIcon)
                .foregroundColor(Color.darkGray)
                .font(.custom("SAP-icons", size: self.size ?? 30))
            )
        }

        return AnyView(AsyncImageView(url: self.src).clipShape(Circle()))
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
    public func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> Icon {
        let _src = src.replacingPlaceholders(withValuesIn: dictionary).validDirectory()
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
