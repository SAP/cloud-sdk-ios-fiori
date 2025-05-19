// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SortCriterionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SortCriterionConfiguration) -> Body
}

struct AnySortCriterionStyle: SortCriterionStyle {
    let content: (SortCriterionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SortCriterionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SortCriterionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SortCriterionConfiguration {
    public var componentIdentifier: String = "fiori_sortcriterion_component"
    public let checkmark: Checkmark
    public let title: Title
    public let subtitle: Subtitle
    public let accessoryIcon: AccessoryIcon
    @Binding public var data: OrderPickerItemModel

    public typealias Checkmark = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias AccessoryIcon = ConfigurationViewWrapper
}

extension SortCriterionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct SortCriterionFioriStyle: SortCriterionStyle {
    public func makeBody(_ configuration: SortCriterionConfiguration) -> some View {
        SortCriterion(configuration)
            .checkmarkStyle(CheckmarkFioriStyle(sortCriterionConfiguration: configuration))
            .titleStyle(TitleFioriStyle(sortCriterionConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(sortCriterionConfiguration: configuration))
            .accessoryIconStyle(AccessoryIconFioriStyle(sortCriterionConfiguration: configuration))
    }
}
