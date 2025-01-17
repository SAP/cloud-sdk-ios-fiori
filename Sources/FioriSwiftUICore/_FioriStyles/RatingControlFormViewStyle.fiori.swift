import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct RatingControlFormViewBaseStyle: RatingControlFormViewStyle {
    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        // Add default layout here
        VStack {
            if !configuration.subtitle.isEmpty {
                VStack(spacing: 4.0) {
                    configuration._ratingControl
                        .frame(maxWidth: .infinity)
                        .frame(alignment: .center)
                    configuration.subtitle
                        .frame(maxWidth: .infinity)
                        .frame(alignment: .center)
                }
            } else if configuration.axis == .vertical {
                VStack(spacing: 4.0) {
                    HStack {
                        configuration.title
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        configuration._ratingControl
                    }
                }
            } else {
                HStack {
                    configuration.title
                    Spacer()
                    configuration._ratingControl
                        .layoutPriority(2)
                }
            }
        }
        .padding(.bottom, 0)
        .accessibilityElement(children: .combine)
        .setAccessibilityAdjustable(configuration.ratingControlStyle == .editable) { direction in
            if configuration.ratingControlStyle == .editable {
                switch direction {
                case .increment:
                    let incrementValue = configuration.rating + 1
                    let newRating = min(configuration.ratingBounds.upperBound, incrementValue)
                    self.setRatingValue(configuration, newRating: newRating)
                case .decrement:
                    let decrementValue = configuration.rating - 1
                    let newRating = max(configuration.ratingBounds.lowerBound, decrementValue)
                    self.setRatingValue(configuration, newRating: newRating)
                @unknown default:
                    break
                }
            }
        }
        .disabled(configuration.ratingControlStyle == .editableDisabled)
    }

    func setRatingValue(_ configuration: RatingControlFormViewConfiguration, newRating: Int) {
        if configuration.rating != newRating {
            configuration.rating = newRating
            UIAccessibility.post(notification: .announcement, argument: RatingControl.getAccessibilityLabelString(configuration.rating, ratingBounds: configuration.ratingBounds))
        }
    }
}

// Default fiori styles
extension RatingControlFormViewFioriStyle {
    struct ContentFioriStyle: RatingControlFormViewStyle {
        func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
            RatingControlFormView(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(self.getTitleColor())
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        }

        func getTitleColor() -> Color {
            switch self.ratingControlFormViewConfiguration.ratingControlStyle {
            case .editableDisabled:
                return .preferredColor(.separator)
            default:
                return .preferredColor(.primaryLabel)
            }
        }
    }

    struct ValueLabelFioriStyle: ValueLabelStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
    
        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
        }
    }

    struct OnStarImageFioriStyle: OnStarImageStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
    
        func makeBody(_ configuration: OnStarImageConfiguration) -> some View {
            OnStarImage(configuration)
        }
    }

    struct OffStarImageFioriStyle: OffStarImageStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
    
        func makeBody(_ configuration: OffStarImageConfiguration) -> some View {
            OffStarImage(configuration)
        }
    }

    struct HalfStarImageFioriStyle: HalfStarImageStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
    
        func makeBody(_ configuration: HalfStarImageConfiguration) -> some View {
            HalfStarImage(configuration)
        }
    }

    struct ReviewCountLabelFioriStyle: ReviewCountLabelStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
    
        func makeBody(_ configuration: ReviewCountLabelConfiguration) -> some View {
            ReviewCountLabel(configuration)
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration

        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .foregroundColor(self.getSubtitleColor())
                .font(.fiori(forTextStyle: .footnote))
        }

        func getSubtitleColor() -> Color {
            switch self.ratingControlFormViewConfiguration.ratingControlStyle {
            case .editableDisabled:
                return .preferredColor(.separator)
            default:
                return .preferredColor(.tertiaryLabel)
            }
        }
    }

    struct RatingControlFioriStyle: RatingControlStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration

        func makeBody(_ configuration: RatingControlConfiguration) -> some View {
            RatingControl(configuration)
        }
    }
}

// Default nss styles
extension RatingControlFormViewNSSStyle {
    struct ContentNSSStyle: RatingControlFormViewStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
            RatingControlFormView(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TitleNSSStyle: TitleStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Title
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct ValueLabelNSSStyle: ValueLabelStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for ValueLabel
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct OnStarImageNSSStyle: OnStarImageStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: OnStarImageConfiguration) -> some View {
            OnStarImage(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for OnStarImage
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct OffStarImageNSSStyle: OffStarImageStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: OffStarImageConfiguration) -> some View {
            OffStarImage(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for OffStarImage
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct HalfStarImageNSSStyle: HalfStarImageStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: HalfStarImageConfiguration) -> some View {
            HalfStarImage(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for HalfStarImage
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct ReviewCountLabelNSSStyle: ReviewCountLabelStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: ReviewCountLabelConfiguration) -> some View {
            ReviewCountLabel(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for ReviewCountLabel
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct SubtitleNSSStyle: SubtitleStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Subtitle
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct RatingControlNSSStyle: RatingControlStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: RatingControlConfiguration) -> some View {
            RatingControl(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for RatingControl
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}
