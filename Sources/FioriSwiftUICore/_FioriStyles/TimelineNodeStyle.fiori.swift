import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelineNodeBaseStyle: TimelineNodeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
        configuration.timelineNode
    }
}

// Default fiori styles
public struct TimelineNodeFioriStyle: TimelineNodeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
        TimelineNode(configuration)
    }
}
