// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol FilterFormViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: FilterFormViewConfiguration) -> Body
}

struct AnyFilterFormViewStyle: FilterFormViewStyle {
    let content: (FilterFormViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (FilterFormViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: FilterFormViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct FilterFormViewConfiguration {
    public var componentIdentifier: String = "fiori_filterformview_component"
    public let title: Title
    public let options: [AttributedString]
    public let controlState: ControlState
    public let errorMessage: AttributedString?
    public let isEnabled: Bool
    public let allowsMultipleSelection: Bool
    public let allowsEmptySelection: Bool
    @Binding public var value: [Int]
    public let buttonSize: FilterButtonSize
    public let isSingleLine: Bool
    public let onValueChange: (([Int]) -> Void)?

    public typealias Title = ConfigurationViewWrapper
}

extension FilterFormViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct FilterFormViewFioriStyle: FilterFormViewStyle {
    public func makeBody(_ configuration: FilterFormViewConfiguration) -> some View {
        FilterFormView(configuration)
            .titleStyle(TitleFioriStyle(filterFormViewConfiguration: configuration))
            .optionsStyle(OptionsFioriStyle(filterFormViewConfiguration: configuration))
            .formViewStyle(FormViewFioriStyle(filterFormViewConfiguration: configuration))
    }
}
