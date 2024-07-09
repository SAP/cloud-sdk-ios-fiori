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
                    self.getRatingControl(configuration)
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
                        self.getRatingControl(configuration)
                    }
                }
            } else {
                HStack {
                    configuration.title
                    Spacer()
                    self.getRatingControl(configuration)
                }
            }
        }
        .informationView(isPresented: Binding(get: { self.isInfoViewNeeded(configuration) }, set: { _ in }), description: configuration.errorMessage ?? "")
        .informationViewStyle(.error)
        .padding(.bottom, self.isInfoViewNeeded(configuration) ? -11.0 : 0)
        .accessibilityElement(children: .combine)
        .setAccessibilityAdjustable(self.getRatingControl(configuration).ratingControlStyle == .editable) { direction in
            if self.getRatingControl(configuration).ratingControlStyle == .editable {
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

    func getRatingControl(_ configuration: RatingControlFormViewConfiguration) -> RatingControl {
        // the rating control style is based on the controlState
        let ratingControlStyle: RatingControl.Style
        switch configuration.controlState {
        case .disabled:
            ratingControlStyle = .editableDisabled
        case .readOnly:
            ratingControlStyle = .standard
        case .highlighted:
            ratingControlStyle = .accented
        default:
            ratingControlStyle = .editable
        }

        return RatingControl(rating: configuration.$rating, ratingControlStyle: ratingControlStyle, ratingBounds: configuration.ratingBounds, onImage: configuration.onImage, offImage: configuration.offImage, itemSize: configuration.itemSize, onColor: configuration.onColor, offColor: configuration.offColor, interItemSpacing: configuration.interItemSpacing)
    }

    func isInfoViewNeeded(_ configuration: RatingControlFormViewConfiguration) -> Bool {
        if let errorMessage = configuration.errorMessage, !errorMessage.characters.isEmpty {
            return true
        }
        return false
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
            switch self.ratingControlFormViewConfiguration.controlState {
            case .disabled:
                return .preferredColor(.separator)
            default:
                return .preferredColor(.primaryLabel)
            }
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
            switch self.ratingControlFormViewConfiguration.controlState {
            case .disabled:
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

    struct FormViewFioriStyle: FormViewStyle {
        let ratingControlFormViewConfiguration: RatingControlFormViewConfiguration

        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}
