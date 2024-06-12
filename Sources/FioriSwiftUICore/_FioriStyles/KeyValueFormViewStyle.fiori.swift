import FioriThemeManager
import Foundation
import SwiftUI

/// The base layout style for `KeyValueFormView`.
public struct KeyValueFormViewBaseStyle: KeyValueFormViewStyle {
    public func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                configuration.title
                if configuration.isRequired {
                    configuration.mandatoryFieldIndicator
                }
                Spacer()
            }
            configuration._noteFormView
        }
    }
}
    
// Default fiori styles
extension KeyValueFormViewFioriStyle {
    struct ContentFioriStyle: KeyValueFormViewStyle {
        func makeBody(_ configuration: KeyValueFormViewConfiguration) -> some View {
            KeyValueFormView(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(self.getTitleColor(self.keyValueFormViewConfiguration))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                .padding(.bottom, -4)
                .padding(.top, 11)
        }
        
        private func getTitleColor(_ configuration: KeyValueFormViewConfiguration) -> Color {
            guard !(configuration.controlState == .disabled) else {
                return .preferredColor(.separator)
            }
            return .preferredColor(.primaryLabel)
        }
        
        private func isDisabled(_ configuration: KeyValueFormViewConfiguration) -> Bool {
            configuration.controlState == .disabled
        }

        private func isErrorStyle(_ configuration: KeyValueFormViewConfiguration) -> Bool {
            TextInputFormViewConfiguration(configuration, isFocused: false).isErrorStyle()
        }
    }

    struct TextViewFioriStyle: TextViewStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        
        func makeBody(_ configuration: TextViewConfiguration) -> some View {
            TextView(configuration)
        }
    }

    struct PlaceholderFioriStyle: PlaceholderStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        
        func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
            Placeholder(configuration)
        }
    }

    struct NoteFormViewFioriStyle: NoteFormViewStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        
        func makeBody(_ configuration: NoteFormViewConfiguration) -> some View {
            NoteFormView(configuration)
        }
    }
    
    struct MandatoryFieldIndicatorFioriStyle: MandatoryFieldIndicatorStyle {
        let keyValueFormViewConfiguration: KeyValueFormViewConfiguration
        
        func makeBody(_ configuration: MandatoryFieldIndicatorConfiguration) -> some View {
            MandatoryFieldIndicator(configuration)
                .foregroundStyle(Color.preferredColor(self.keyValueFormViewConfiguration.controlState == .disabled ? .separator : .primaryLabel))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                .padding(.bottom, -4)
                .padding(.top, 11)
        }
    }
}
