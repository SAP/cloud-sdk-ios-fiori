// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol HierarchyViewHeaderStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: HierarchyViewHeaderConfiguration) -> Body
}

struct AnyHierarchyViewHeaderStyle: HierarchyViewHeaderStyle {
    let content: (HierarchyViewHeaderConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (HierarchyViewHeaderConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: HierarchyViewHeaderConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct HierarchyViewHeaderConfiguration {
    public var componentIdentifier: String = "fiori_hierarchyviewheader_component"
    public let title: Title
    public let leadingAccessory: LeadingAccessory
    public let trailingAccessory: TrailingAccessory

    public typealias Title = ConfigurationViewWrapper
    public typealias LeadingAccessory = ConfigurationViewWrapper
    public typealias TrailingAccessory = ConfigurationViewWrapper
}

extension HierarchyViewHeaderConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct HierarchyViewHeaderFioriStyle: HierarchyViewHeaderStyle {
    public func makeBody(_ configuration: HierarchyViewHeaderConfiguration) -> some View {
        HierarchyViewHeader(configuration)
            .titleStyle(TitleFioriStyle(hierarchyViewHeaderConfiguration: configuration))
            .leadingAccessoryStyle(LeadingAccessoryFioriStyle(hierarchyViewHeaderConfiguration: configuration))
            .trailingAccessoryStyle(TrailingAccessoryFioriStyle(hierarchyViewHeaderConfiguration: configuration))
    }
}
