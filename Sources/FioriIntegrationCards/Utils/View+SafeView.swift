import Foundation
import SwiftUI

extension View {
    func SafeView(_ value: AnyBodyProducing?) -> AnyView {
        switch value {
        case .none:
            return AnyView(EmptyView())
        case .some(let value):
            return value.body()
        }
    }
    
    func SafeText(_ string: String?) -> AnyView {
        Self.SafeText(string)
    }

    static func SafeText(_ string: String?) -> AnyView {
        switch string {
        case .none:
            return AnyView(EmptyView())
        case .some(let value):
            return AnyView(Text(value))
        }
    }
}
