// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol HierarchyItemViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: HierarchyItemViewConfiguration) -> Body
}

struct AnyHierarchyItemViewStyle: HierarchyItemViewStyle {
    let content: (HierarchyItemViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (HierarchyItemViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: HierarchyItemViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct HierarchyItemViewConfiguration {
    public var componentIdentifier: String = "fiori_hierarchyitemview_component"
    public let title: Title
    public let subtitle: Subtitle
    public let footnote: Footnote
    public let icons: Icons
    public let detailImage: DetailImage
    public let status: Status
    public let accessoryType: AccessoryType
    public let hierarchyIndicator: HierarchyIndicator

    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Footnote = ConfigurationViewWrapper
    public typealias Icons = ConfigurationViewWrapper
    public typealias DetailImage = ConfigurationViewWrapper
    public typealias Status = ConfigurationViewWrapper
    public typealias HierarchyIndicator = ConfigurationViewWrapper
}

extension HierarchyItemViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct HierarchyItemViewFioriStyle: HierarchyItemViewStyle {
    public func makeBody(_ configuration: HierarchyItemViewConfiguration) -> some View {
        HierarchyItemView(configuration)
            .titleStyle(TitleFioriStyle(hierarchyItemViewConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(hierarchyItemViewConfiguration: configuration))
            .footnoteStyle(FootnoteFioriStyle(hierarchyItemViewConfiguration: configuration))
            .iconsStyle(IconsFioriStyle(hierarchyItemViewConfiguration: configuration))
            .detailImageStyle(DetailImageFioriStyle(hierarchyItemViewConfiguration: configuration))
            .statusStyle(StatusFioriStyle(hierarchyItemViewConfiguration: configuration))
            .accessoryViewStyle(AccessoryViewFioriStyle(hierarchyItemViewConfiguration: configuration))
    }
}
