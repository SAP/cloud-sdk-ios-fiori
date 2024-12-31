import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct KeyValueItemBaseStyle: KeyValueItemStyle {
    public func makeBody(_ configuration: KeyValueItemConfiguration) -> some View {
        CompactVStack(alignment: .leading) {
            switch configuration.axis {
            case .horizontal:
                HStack(spacing: 0) {
                    configuration.key
                    if configuration.isRequired {
                        configuration.mandatoryFieldIndicator
                    }
                    Spacer()
                    configuration.value
                }
                .frame(maxWidth: .infinity)
            case .vertical:
                HStack(spacing: 0) {
                    configuration.key
                    if configuration.isRequired {
                        configuration.mandatoryFieldIndicator
                    }
                }
                configuration.value
            }
        }.accessibilityElement(children: .combine)
    }
}

// Default fiori styles
extension KeyValueItemFioriStyle {
    struct ContentFioriStyle: KeyValueItemStyle {
        func makeBody(_ configuration: KeyValueItemConfiguration) -> some View {
            KeyValueItem(configuration)
                .disabled(configuration.controlState == .disabled || configuration.controlState == .readOnly)
        }
    }

    public struct KeyFioriStyle: KeyStyle {
        let keyValueItemConfiguration: KeyValueItemConfiguration

        public func makeBody(_ configuration: KeyConfiguration) -> some View {
            Key(configuration)
                .foregroundStyle(Color.preferredColor(self.keyValueItemConfiguration.controlState == .disabled ? .separator : .primaryLabel))
        }
    }

    struct ValueFioriStyle: ValueStyle {
        let keyValueItemConfiguration: KeyValueItemConfiguration

        func makeBody(_ configuration: ValueConfiguration) -> some View {
            Value(configuration)
                .foregroundStyle(Color.preferredColor(self.keyValueItemConfiguration.controlState == .disabled ? .separator : .primaryLabel))
        }
    }
    
    struct MandatoryFieldIndicatorFioriStyle: MandatoryFieldIndicatorStyle {
        let keyValueItemConfiguration: KeyValueItemConfiguration
        func makeBody(_ configuration: MandatoryFieldIndicatorConfiguration) -> some View {
            MandatoryFieldIndicator(configuration)
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                .foregroundStyle(Color.preferredColor(self.keyValueItemConfiguration.controlState == .disabled ? .separator : .primaryLabel))
        }
    }

    struct FormViewFioriStyle: FormViewStyle {
        let keyValueItemConfiguration: KeyValueItemConfiguration

        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}
