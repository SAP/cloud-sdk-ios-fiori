import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `KeyValueFormView`.
public struct KeyValueFormViewBaseStyle: KeyValueFormViewStyle {
    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        VStack(alignment: .leading) {
            configuration.title
            configuration._noteFormView
        }
    }
}
    
// Default fiori styles
extension KeyValueFormViewFioriStyle {
    struct ContentFioriStyle: KeyValueFormViewStyle {
        func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
            KeyValueFormView(configuration)
                .titleStyle { titleConf in
                    Title(titleConf)
                        .foregroundStyle(self.getTitleColor(configuration))
                        .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                }
        }
        
        func isDisabled(_ configuration: KeyValueFormViewConfiguration) -> Bool {
            configuration.controlState == .disabled
        }

        func getTitleColor(_ configuration: KeyValueFormViewConfiguration) -> Color {
            guard !(configuration.controlState == .disabled) else {
                return .preferredColor(.separator)
            }
            return self.isErrorStyle(configuration) ? .preferredColor(.negativeLabel) : .preferredColor(.primaryLabel)
        }

        func isErrorStyle(_ configuration: KeyValueFormViewConfiguration) -> Bool {
            TextInputFormViewConfiguration(configuration, isFocused: false).isErrorStyle()
        }
    }

    struct TitleFioriStyle: TitleStyle {
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .padding(.bottom, -4)
                .padding(.top, 11)
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
