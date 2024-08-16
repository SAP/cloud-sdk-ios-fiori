import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

//
/// **
// This file provides default fiori style for the component.
//
// 1. Uncomment fhe following code.
// 2. Implement layout and style in corresponding places.
// 3. Delete `.generated` from file name.
// 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
// */
//
// Base Layout style
public struct SwitchViewBaseStyle: SwitchViewStyle {
    public func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
        // Add default layout here
        HStack {
            configuration.title
            Spacer()
            configuration._switch
        }
    }
}

// Default fiori styles
extension SwitchViewFioriStyle {
    struct ContentFioriStyle: SwitchViewStyle {
        func makeBody(_ configuration: SwitchViewConfiguration) -> some View {
            SwitchView(configuration)
                .padding(EdgeInsets(top: 9, leading: 20, bottom: 9, trailing: 20))
            // Add default style for its content
            // .background()
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let switchViewConfiguration: SwitchViewConfiguration
        @Environment(\.isEnabled) var isEnabled

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                // Add default style for Title
                .foregroundStyle(Color.preferredColor(self.isEnabled ? .primaryLabel : .quaternaryLabel))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        }
    }

    struct SwitchFioriStyle: SwitchStyle {
        let switchViewConfiguration: SwitchViewConfiguration
        @Environment(\.isEnabled) var isEnabled
        
        func makeBody(_ configuration: SwitchConfiguration) -> some View {
            Switch(configuration)
                // Add default style for Switch
                .tint(Color.preferredColor(.tintColor))
                .frame(width: 50, height: 30, alignment: .trailing)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.preferredColor(configuration.isOn ? .separatorOpaque : .separator), lineWidth: 1)
                )
        }
    }
}
