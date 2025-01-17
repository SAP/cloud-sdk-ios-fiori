import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct NodeBaseStyle: NodeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: NodeConfiguration) -> some View {
        // Add default layout here
        configuration.node
    }
}

// Default fiori styles
public struct NodeFioriStyle: NodeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: NodeConfiguration) -> some View {
        Node(configuration)
    }
}

// Default nss styles
public struct NodeNSSStyle: NodeStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: NodeConfiguration) -> some View {
        Node(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.nodeIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}
