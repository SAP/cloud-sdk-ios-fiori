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
public struct KeyValueFormViewBaseStyle: KeyValueFormViewStyle {
    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        VStack(alignment: .leading) {
            configuration.title
                .padding(.bottom, -4)
                .padding(.top, 11)

            configuration._noteFormView
                .padding(.top, -7)
                .padding(.bottom, 0)
        }
    }
}
    
// Default fiori styles
extension KeyValueFormViewFioriStyle {
    struct ContentFioriStyle: KeyValueFormViewStyle {
        @FocusState var isFocused: Bool
        
        func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
            KeyValueFormView(configuration)
                .titleStyle { titleConf in
                    Title(titleConf)
                        .foregroundStyle(getTitleColor(configuration))
                        .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                }
                .noteFormViewStyle(FioriSwiftUICore.NoteFormViewFioriStyle.ContentFioriStyle())
        }
        
        func isDisabled(_ configuration: KeyValueFormViewConfiguration) -> Bool {
            configuration.controlState == .disabled
        }

        func getTitleColor(_ configuration: KeyValueFormViewConfiguration) -> Color {
            self.isDisabled(configuration) ? .preferredColor(.separator) : .preferredColor(.primaryLabel)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
        }
    }

    struct TextViewFioriStyle: TextViewStyle {
        func makeBody(_ configuration: TextViewConfiguration) -> some View {
            TextView(configuration)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
        }
    }

    struct NoteFormViewFioriStyle: NoteFormViewStyle {
        func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
            NoteFormView(configuration)
        }
    }
}
