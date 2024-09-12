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
