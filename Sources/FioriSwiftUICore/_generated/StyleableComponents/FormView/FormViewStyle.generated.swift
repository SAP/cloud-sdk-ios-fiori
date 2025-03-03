// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol FormViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: FormViewConfiguration) -> Body
}

struct AnyFormViewStyle: FormViewStyle {
    let content: (FormViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (FormViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: FormViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct FormViewConfiguration {
    public var componentIdentifier: String = "fiori_formview_component"
    public let controlState: ControlState
    public let errorMessage: AttributedString?
}

extension FormViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct FormViewFioriStyle: FormViewStyle {
    public func makeBody(_ configuration: FormViewConfiguration) -> some View {
        FormView(configuration)
    }
}
