import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct StatusBaseStyle: StatusStyle {
    public func makeBody(_ configuration: StatusConfiguration) -> some View {
        configuration.status
    }
}

// Default fiori styles
public struct StatusFioriStyle: StatusStyle {
    public func makeBody(_ configuration: StatusConfiguration) -> some View {
        Status(configuration)
            .foregroundStyle(Color.preferredColor(.tertiaryLabel))
            .font(.fiori(forTextStyle: .subheadline))
    }
}

// A convenient `StatusStyle` to set a foreground color for `Status`
public struct StatusColorStyleStyle: StatusStyle {
    let style: ColorStyle
    public func makeBody(_ configuration: StatusConfiguration) -> some View {
        Status(configuration)
            .foregroundStyle(Color.preferredColor(self.style))
            .font(.fiori(forTextStyle: .subheadline))
    }
}

public extension StatusStyle where Self == StatusColorStyleStyle {
    // `.negativeLabel` color style for `Status`
    static var negativeLabel: Self {
        StatusColorStyleStyle(style: .negativeLabel)
    }
    
    // `.positiveLabel` color style for `Status`
    static var positiveLabel: Self {
        StatusColorStyleStyle(style: .positiveLabel)
    }
    
    // `.criticalLabel` color style for `Status`
    static var criticalLabel: Self {
        StatusColorStyleStyle(style: .criticalLabel)
    }
    
    // `.informativeLabel` color style for `Status`
    static var informativeLabel: Self {
        StatusColorStyleStyle(style: .informativeLabel)
    }
}
