import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AvatarsTitleBaseStyle: AvatarsTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AvatarsTitleConfiguration) -> some View {
        // Add default layout here
        configuration.avatarsTitle
    }
}

// Default fiori styles
public struct AvatarsTitleFioriStyle: AvatarsTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AvatarsTitleConfiguration) -> some View {
        AvatarsTitle(configuration)
    }
}

// Default nss styles
public struct AvatarsTitleNSSStyle: AvatarsTitleStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: AvatarsTitleConfiguration) -> some View {
        AvatarsTitle(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.avatarsTitleIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}
