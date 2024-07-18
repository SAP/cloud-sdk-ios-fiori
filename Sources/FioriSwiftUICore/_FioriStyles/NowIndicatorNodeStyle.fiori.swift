import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct NowIndicatorNodeBaseStyle: NowIndicatorNodeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: NowIndicatorNodeConfiguration) -> some View {
        configuration.nowIndicatorNode
    }
}

// Default fiori styles
public struct NowIndicatorNodeFioriStyle: NowIndicatorNodeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: NowIndicatorNodeConfiguration) -> some View {
        NowIndicatorNode(configuration)
    }
}
