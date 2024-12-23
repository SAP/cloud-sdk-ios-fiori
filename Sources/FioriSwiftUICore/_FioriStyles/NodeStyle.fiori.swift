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
