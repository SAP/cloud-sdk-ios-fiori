import Foundation
import SwiftUI

public struct Status: Decodable, AnyBodyProducing {
    public let text: String?
    
    func body() -> AnyView {
        switch self.text?.trimmed() {
        case .none:
            return AnyView(EmptyView())
        case .some(let value):
            return AnyView(Text(value))
        }
    }
}

extension Status: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> Status {
        guard let value = text else { return self }
        return Status(text: value.replacingPlaceholders(withValuesIn: object))
    }
}

extension Status: Hashable {}
