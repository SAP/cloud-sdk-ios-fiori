import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelineNodeBaseStyle: TimelineNodeStyle {
    public func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
        VStack(alignment: .center, spacing: 0) {
            configuration.upperVerticalLine
            configuration.nodeImage
            configuration.lowerVerticalLine
        }
    }
}

// Default fiori styles
extension TimelineNodeFioriStyle {
    struct ContentFioriStyle: TimelineNodeStyle {
        func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
            TimelineNode(configuration)
        }
    }

    struct UpperVerticalLineFioriStyle: UpperVerticalLineStyle {
        let timelineNodeConfiguration: TimelineNodeConfiguration
    
        func makeBody(_ configuration: UpperVerticalLineConfiguration) -> some View {
            UpperVerticalLine(configuration)
        }
    }

    struct NodeImageFioriStyle: NodeImageStyle {
        let timelineNodeConfiguration: TimelineNodeConfiguration

        func makeBody(_ configuration: NodeImageConfiguration) -> some View {
            NodeImage(configuration)
        }
    }
    
    struct LowerVerticalLineFioriStyle: LowerVerticalLineStyle {
        let timelineNodeConfiguration: TimelineNodeConfiguration
    
        func makeBody(_ configuration: LowerVerticalLineConfiguration) -> some View {
            LowerVerticalLine(configuration)
        }
    }
}
