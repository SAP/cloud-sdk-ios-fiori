import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TextWithMandatoryFieldIndicatorBaseStyle: TextWithMandatoryFieldIndicatorStyle {
    public func makeBody(_ configuration: TextWithMandatoryFieldIndicatorConfiguration) -> some View {
        Group {
            if let mandatoryFieldIndicator = configuration.mandatoryFieldIndicator, configuration.isRequired {
                switch mandatoryFieldIndicator {
                case .text(let attributedString):
                    Text(configuration.text) + Text(attributedString).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field"))
                case .icon(let image):
                    Text(configuration.text) + Text(image).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field"))
                case .both(let attributedString, let image):
                    Text(configuration.text) + Text(attributedString).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field")) + Text(image).accessibilityLabel("")
                }
            } else {
                Text(configuration.text)
            }
        }.typeErased
    }
}

// Default fiori styles
extension TextWithMandatoryFieldIndicatorFioriStyle {
    struct ContentFioriStyle: TextWithMandatoryFieldIndicatorStyle {
        func makeBody(_ configuration: TextWithMandatoryFieldIndicatorConfiguration) -> some View {
            TextWithMandatoryFieldIndicator(configuration)
        }
    }
}
