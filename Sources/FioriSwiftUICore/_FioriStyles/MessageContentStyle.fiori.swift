import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.

 1. Uncomment the following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct MessageContentBaseStyle: MessageContentStyle {
    @ViewBuilder
    public func makeBody(_ configuration: MessageContentConfiguration) -> some View {
        // Add default layout here
        configuration.messageContent
    }
}

// Default fiori styles
public struct MessageContentFioriStyle: MessageContentStyle {
    @ViewBuilder
    public func makeBody(_ configuration: MessageContentConfiguration) -> some View {
        MessageContent(configuration)
        // Add default style here
    }
}

// Default nss styles
public struct MessageContentNSSStyle: MessageContentStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: MessageContentConfiguration) -> some View {
        MessageContent(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.messageContentIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}
