import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelineMarkerNodeBaseStyle: TimelineMarkerNodeStyle {
    public func makeBody(_ configuration: TimelineMarkerNodeConfiguration) -> some View {
        VStack(alignment: .center, spacing: 0) {
            configuration.upperVerticalLine.opacity(configuration.showUpperVerticalLine ? 1 : 0)
            configuration.nodeImage
            configuration.lowerVerticalLine.opacity(configuration.showLowerVerticalLine ? 1 : 0)
        }
    }
}

// Default fiori styles
extension TimelineMarkerNodeFioriStyle {
    struct ContentFioriStyle: TimelineMarkerNodeStyle {
        func makeBody(_ configuration: TimelineMarkerNodeConfiguration) -> some View {
            TimelineMarkerNode(configuration)
        }
    }

    struct UpperVerticalLineFioriStyle: UpperVerticalLineStyle {
        let timelineMarkerNodeConfiguration: TimelineMarkerNodeConfiguration
    
        func makeBody(_ configuration: UpperVerticalLineConfiguration) -> some View {
            UpperVerticalLine(configuration)
        }
    }
    
    struct NodeImageFioriStyle: NodeImageStyle {
        let timelineMarkerNodeConfiguration: TimelineMarkerNodeConfiguration

        func makeBody(_ configuration: NodeImageConfiguration) -> some View {
            NodeImage(configuration)
        }
    }
    
    struct LowerVerticalLineFioriStyle: LowerVerticalLineStyle {
        let timelineMarkerNodeConfiguration: TimelineMarkerNodeConfiguration
    
        func makeBody(_ configuration: LowerVerticalLineConfiguration) -> some View {
            LowerVerticalLine(configuration)
        }
    }
}
