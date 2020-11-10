import Combine
import Foundation
import SwiftUI
import UIKit

public final class Icon: Decodable, AnyBodyProducing {
    public let src: String
    public let id = UUID()
    
    public var size: CGFloat?

    enum CodingKeys: CodingKey {
        case src
    }
    
    func body() -> AnyView {
        if let validIcon = self.src.validIcon() {
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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.src = try container.decode(String.self, forKey: .src)
    }
}

extension Icon: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> Icon {
        let _src = self.src.replacingPlaceholders(withValuesIn: object).validDirectory()
        return Icon(src: _src)
    }
}

extension Icon: Hashable {
    public static func == (lhs: Icon, rhs: Icon) -> Bool {
        lhs.src == rhs.src
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.src)
    }
}
