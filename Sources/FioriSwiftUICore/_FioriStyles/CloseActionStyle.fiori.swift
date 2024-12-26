import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct CloseActionBaseStyle: CloseActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CloseActionConfiguration) -> some View {
        configuration.closeAction
    }
}

// Default fiori styles
public struct CloseActionFioriStyle: CloseActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CloseActionConfiguration) -> some View {
        CloseAction(configuration)
            .fioriButtonStyle(CloseActionStyle())
    }
    
    struct CloseActionStyle: FioriButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
        }
    }
}

// Default nss styles
public struct CloseActionNSSStyle: CloseActionStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: CloseActionConfiguration) -> some View {
        CloseAction(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.closeActionIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}
