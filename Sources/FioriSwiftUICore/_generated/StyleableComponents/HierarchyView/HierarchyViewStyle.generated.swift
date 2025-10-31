// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol HierarchyViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: HierarchyViewConfiguration) -> Body
}

struct AnyHierarchyViewStyle: HierarchyViewStyle {
    let content: (HierarchyViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (HierarchyViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: HierarchyViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct HierarchyViewConfiguration {
    public var componentIdentifier: String = "fiori_hierarchyview_component"
    public let dataSource: any HierarchyViewDataSource
    public let header: Header
    public let hierarchyItem: (String) -> any View
    @Binding public var activeChildItem: String?
    @Binding public var selectedItems: [String]?

    public typealias Header = ConfigurationViewWrapper
}

extension HierarchyViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct HierarchyViewFioriStyle: HierarchyViewStyle {
    public func makeBody(_ configuration: HierarchyViewConfiguration) -> some View {
        HierarchyView(configuration)
    }
}
