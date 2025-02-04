// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol FilterFeedbackBarButtonStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: FilterFeedbackBarButtonConfiguration) -> Body
}

struct AnyFilterFeedbackBarButtonStyle: FilterFeedbackBarButtonStyle {
    let content: (FilterFeedbackBarButtonConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (FilterFeedbackBarButtonConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: FilterFeedbackBarButtonConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct FilterFeedbackBarButtonConfiguration {
    public var componentIdentifier: String = "fiori_filterfeedbackbarbutton_component"
    public let icon: Icon
    public let title: Title
    public let isSelected: Bool
    public let spacing: CGFloat

    public typealias Icon = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
}

extension FilterFeedbackBarButtonConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct FilterFeedbackBarButtonFioriStyle: FilterFeedbackBarButtonStyle {
    public func makeBody(_ configuration: FilterFeedbackBarButtonConfiguration) -> some View {
        FilterFeedbackBarButton(configuration)
            .iconStyle(IconFioriStyle(filterFeedbackBarButtonConfiguration: configuration))
            .titleStyle(TitleFioriStyle(filterFeedbackBarButtonConfiguration: configuration))
    }
}
