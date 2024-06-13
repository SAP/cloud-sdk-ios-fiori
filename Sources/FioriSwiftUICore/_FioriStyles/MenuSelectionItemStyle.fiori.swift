import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
public struct MenuSelectionItemBaseStyle: MenuSelectionItemStyle {
    public func makeBody(_ configuration: MenuSelectionItemConfiguration) -> some View {
        Button(action: configuration.action ?? {}, label: {
            HStack {
                configuration.icon
                configuration.title
                Spacer()
            }
        })
    }
}

// Default fiori styles
extension MenuSelectionItemFioriStyle {
    struct ContentFioriStyle: MenuSelectionItemStyle {
        func makeBody(_ configuration: MenuSelectionItemConfiguration) -> some View {
            MenuSelectionItem(configuration)
                // Add default style for its content
                .buttonStyle(_ItemStyle())
        }
        
        private struct _ItemStyle: ButtonStyle {
            func makeBody(configuration: Configuration) -> some View {
                configuration.label
                    .padding(.init(top: 12, leading: 16, bottom: 12, trailing: 16))
                    .frame(minWidth: 44, minHeight: 44)
                    .background(Color.preferredColor(configuration.isPressed ? .secondaryFill : .secondaryGroupedBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.preferredColor(.separator), lineWidth: 0.33)
                    }
            }
        }
    }
    
    struct IconFioriStyle: IconStyle {
        let menuSelectionItemConfiguration: MenuSelectionItemConfiguration
        @ScaledMetric var width: CGFloat = 14
        
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                // Add default style for Icon
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .frame(width: self.width, height: self.width)
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let menuSelectionItemConfiguration: MenuSelectionItemConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                // Add default style for Title
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .headline))
        }
    }
}

#Preview(body: {
    MenuSelectionItem(icon: FioriIcon.documents.attachmentTextFile, title: "1099 Form")
})
