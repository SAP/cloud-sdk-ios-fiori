import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct NodeImageBaseStyle: NodeImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: NodeImageConfiguration) -> some View {
        configuration.nodeImage
    }
}

// Default fiori styles
public struct NodeImageFioriStyle: NodeImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: NodeImageConfiguration) -> some View {
        NodeImage(configuration)
    }
}
