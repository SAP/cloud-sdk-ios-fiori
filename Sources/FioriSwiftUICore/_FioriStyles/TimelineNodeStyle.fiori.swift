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

// Default nss styles
public struct TimelineNodeNSSStyle: TimelineNodeStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
        TimelineNode(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.timelineNodeIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}
