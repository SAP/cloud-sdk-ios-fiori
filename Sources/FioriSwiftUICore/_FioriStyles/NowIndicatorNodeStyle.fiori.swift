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

// Default nss styles
public struct NowIndicatorNodeNSSStyle: NowIndicatorNodeStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: NowIndicatorNodeConfiguration) -> some View {
        NowIndicatorNode(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.nowIndicatorNodeIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}
