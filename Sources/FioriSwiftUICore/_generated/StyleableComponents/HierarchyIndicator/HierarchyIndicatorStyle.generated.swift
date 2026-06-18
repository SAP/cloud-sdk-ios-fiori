// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol HierarchyIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: HierarchyIndicatorConfiguration) -> Body
}

struct AnyHierarchyIndicatorStyle: HierarchyIndicatorStyle {
    let content: (HierarchyIndicatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (HierarchyIndicatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: HierarchyIndicatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct HierarchyIndicatorConfiguration {
    public var componentIdentifier: String = "fiori_hierarchyindicator_component"
    public let title: Title
    public let icon: Icon
    public let isMultiline: Bool
    public let isSelected: Bool
    public let isClickable: Bool
    public let onClick: (() -> String?)?

    public typealias Title = ConfigurationViewWrapper
    public typealias Icon = ConfigurationViewWrapper
}

extension HierarchyIndicatorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct HierarchyIndicatorFioriStyle: HierarchyIndicatorStyle {
    public func makeBody(_ configuration: HierarchyIndicatorConfiguration) -> some View {
        HierarchyIndicator(configuration)
            .titleStyle(TitleFioriStyle(hierarchyIndicatorConfiguration: configuration))
            .iconStyle(IconFioriStyle(hierarchyIndicatorConfiguration: configuration))
    }
}

struct HierarchyIndicatorDefaultStyle: HierarchyIndicatorStyle {
    nonisolated init() {}

    func makeBody(_ configuration: HierarchyIndicatorConfiguration) -> some View {
        HierarchyIndicator(configuration)
            .hierarchyIndicatorStyle(HierarchyIndicatorFioriStyle())
            .modifier(HierarchyIndicatorStyleModifier(style: HierarchyIndicatorBaseStyle()))
    }
}
