import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TitleWithOptionalMandatoryFieldBaseStyle: TitleWithOptionalMandatoryFieldStyle {
    public func makeBody(_ configuration: TitleWithOptionalMandatoryFieldConfiguration) -> some View {
        Group {
            if let mandatoryField = configuration.mandatoryField, configuration.isRequired {
                switch mandatoryField {
                case .text(let attributedString):
                    Text(configuration.title) + Text(attributedString)
                case .icon(let image):
                    Text(configuration.title) + Text(image)
                case .both(let attributedString, let image):
                    Text(configuration.title) + Text(attributedString) + Text(image)
                }
            } else {
                Text(configuration.title)
            }
        }.typeErased
    }
}

// Default fiori styles
extension TitleWithOptionalMandatoryFieldFioriStyle {
    struct ContentFioriStyle: TitleWithOptionalMandatoryFieldStyle {
        func makeBody(_ configuration: TitleWithOptionalMandatoryFieldConfiguration) -> some View {
            TitleWithOptionalMandatoryField(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .headline))
        }
    }
}
