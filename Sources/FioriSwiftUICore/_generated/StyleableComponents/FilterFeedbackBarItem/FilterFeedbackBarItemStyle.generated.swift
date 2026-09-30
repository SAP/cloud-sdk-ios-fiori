// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol FilterFeedbackBarItemStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: FilterFeedbackBarItemConfiguration) -> Body
}

struct AnyFilterFeedbackBarItemStyle: FilterFeedbackBarItemStyle {
    let content: (FilterFeedbackBarItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (FilterFeedbackBarItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: FilterFeedbackBarItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct FilterFeedbackBarItemConfiguration {
    public var componentIdentifier: String = "fiori_filterfeedbackbaritem_component"
    public let icon: Icon
    public let title: Title
    public let accessoryIcon: AccessoryIcon
    public let isSelected: Bool
    public let spacing: CGFloat

    public typealias Icon = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias AccessoryIcon = ConfigurationViewWrapper
}

extension FilterFeedbackBarItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct FilterFeedbackBarItemFioriStyle: FilterFeedbackBarItemStyle {
    public func makeBody(_ configuration: FilterFeedbackBarItemConfiguration) -> some View {
        FilterFeedbackBarItem(configuration)
            .iconStyle(IconFioriStyle(filterFeedbackBarItemConfiguration: configuration))
            .titleStyle(TitleFioriStyle(filterFeedbackBarItemConfiguration: configuration))
            .accessoryIconStyle(AccessoryIconFioriStyle(filterFeedbackBarItemConfiguration: configuration))
    }
}

struct FilterFeedbackBarItemDefaultStyle: FilterFeedbackBarItemStyle {
    nonisolated init() {}

    func makeBody(_ configuration: FilterFeedbackBarItemConfiguration) -> some View {
        FilterFeedbackBarItem(configuration)
            .filterFeedbackBarItemStyle(FilterFeedbackBarItemFioriStyle())
            .modifier(FilterFeedbackBarItemStyleModifier(style: FilterFeedbackBarItemBaseStyle()))
    }
}
