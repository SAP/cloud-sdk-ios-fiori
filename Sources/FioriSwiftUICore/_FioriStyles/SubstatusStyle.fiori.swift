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
public struct SubstatusBaseStyle: SubstatusStyle {
    public func makeBody(_ configuration: SubstatusConfiguration) -> some View {
        configuration.substatus
    }
}

// Default fiori styles
public struct SubstatusFioriStyle: SubstatusStyle {
    public func makeBody(_ configuration: SubstatusConfiguration) -> some View {
        Substatus(configuration)
            .foregroundStyle(Color.preferredColor(.tertiaryLabel))
            .font(.fiori(forTextStyle: .subheadline))
    }
}

// A convenient `SubstatusStyle` to set a foreground color for `Substatus`
public struct SubstatusColorStyle: SubstatusStyle {
    let style: ColorStyle
    public func makeBody(_ configuration: SubstatusConfiguration) -> some View {
        Substatus(configuration)
            .foregroundStyle(Color.preferredColor(self.style))
            .font(.fiori(forTextStyle: .subheadline))
    }
}

public extension SubstatusStyle where Self == SubstatusColorStyle {
    // `.negativeLabel` color style for `Substatus`
    static var negativeLabel: Self {
        SubstatusColorStyle(style: .negativeLabel)
    }
    
    // `.positiveLabel` color style for `Substatus`
    static var positiveLabel: Self {
        SubstatusColorStyle(style: .positiveLabel)
    }
    
    // `.criticalLabel` color style for `Substatus`
    static var criticalLabel: Self {
        SubstatusColorStyle(style: .criticalLabel)
    }
    
    // `.informativeLabel` color style for `Substatus`
    static var informativeLabel: Self {
        SubstatusColorStyle(style: .informativeLabel)
    }
}
