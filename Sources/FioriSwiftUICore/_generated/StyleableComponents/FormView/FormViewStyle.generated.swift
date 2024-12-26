// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let contentIdentifier = "FioriFormView_content"

    public let controlState: ControlState
    public let errorMessage: AttributedString?
}

public struct FormViewFioriStyle: FormViewStyle {
    public func makeBody(_ configuration: FormViewConfiguration) -> some View {
        FormView(configuration)
    }
}

public struct FormViewNSSStyle: FormViewStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: FormViewConfiguration) -> some View {
        FormView(configuration)
             
            .formViewStyle(ContentNSSStyle(formViewConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
