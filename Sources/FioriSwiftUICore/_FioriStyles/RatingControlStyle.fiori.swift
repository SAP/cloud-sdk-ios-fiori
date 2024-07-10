import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct RatingControlBaseStyle: RatingControlStyle {
    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        HStack(spacing: configuration.getItemSpacing()) {
            ForEach(configuration.ratingItems(configuration.rating)) { ratingItem in
                if ratingItem.isOn {
                    configuration.getOnImageView()
                } else {
                    configuration.getOffImageView()
                }
            }
        }
        .onTapGesture { location in
            if configuration.ratingControlStyle == .editable {
                self.setRatingValue(configuration, location: location)
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0.5)
                .onChanged { value in
                    if configuration.ratingControlStyle == .editable {
                        self.setRatingValue(configuration, location: value.location)
                    }
                }
        )
        .accessibilityElement()
        .accessibilityLabel(self.getAccessibilityLabel(configuration))
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

    func setRatingValue(_ configuration: RatingControlConfiguration, location: CGPoint) {
        let newValue = configuration.getRatingValue(location)
        self.setRatingValue(configuration, newRating: newValue)
    }

    func setRatingValue(_ configuration: RatingControlConfiguration, newRating: Int) {
        if configuration.rating != newRating {
            configuration.rating = newRating
            UIAccessibility.post(notification: .announcement, argument: self.getAccessibilityLabel(configuration))
        }
    }

    func getAccessibilityLabel(_ configuration: RatingControlConfiguration) -> String {
        RatingControl.getAccessibilityLabelString(configuration.rating, ratingBounds: configuration.ratingBounds)
    }
}

// Default fiori styles
extension RatingControlFioriStyle {
    struct ContentFioriStyle: RatingControlStyle {
        func makeBody(_ configuration: RatingControlConfiguration) -> some View {
            RatingControl(configuration)
        }
    }
}

extension View {
    @ViewBuilder func setAccessibilityAdjustable(_ isAdjustable: Bool, handler: @escaping (AccessibilityAdjustmentDirection) -> Void) -> some View {
        if isAdjustable {
            self.accessibilityAdjustableAction(handler)
        } else {
            self
        }
    }
}
