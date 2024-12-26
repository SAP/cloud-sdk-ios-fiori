import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `TextView`.
public struct TextViewBaseStyle: TextViewStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TextViewConfiguration) -> some View {
        TextEditor(text: configuration.$text)
    }
}

// Default fiori styles
public struct TextViewFioriStyle: TextViewStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TextViewConfiguration) -> some View {
        TextView(configuration)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.fiori(forTextStyle: .body))
    }
}

// Default nss styles
public struct TextViewNSSStyle: TextViewStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: TextViewConfiguration) -> some View {
        TextView(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.textViewIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}
