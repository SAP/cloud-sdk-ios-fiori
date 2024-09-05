import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct RatingControlBaseStyle: RatingControlStyle {
    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        HStack(spacing: configuration.getItemSpacing()) {
            if configuration.showsValueLabel, self.getReadOnly(configuration) {
                // shows value label
                Text(self.getValueText(configuration))
            }
            if self.getReadOnly(configuration), let averageRating = configuration.averageRating {
                ForEach(configuration.ratingItems(averageRating)) { ratingItem in
                    if ratingItem.isOn {
                        configuration.getOnImageView()
                    } else if ratingItem.isHalf {
                        configuration.getHalfImageView()
                    } else {
                        configuration.getOffImageView()
                    }
                }
            } else {
                ForEach(configuration.ratingItems(configuration.rating)) { ratingItem in
                    if ratingItem.isOn {
                        configuration.getOnImageView()
                    } else {
                        configuration.getOffImageView()
                    }
                }
            }
            if configuration.showsValueLabel, !self.getReadOnly(configuration) {
                // shows value label
                Text(self.getValueText(configuration))
            }
            if let reviewCount = configuration.reviewCount, configuration.showsReviewCountLabel, getReadOnly(configuration) {
                // shows review count
                Text(self.getReviewCountText(configuration, reviewCount: reviewCount))
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

    func getReadOnly(_ configuration: RatingControlConfiguration) -> Bool {
        switch configuration.ratingControlStyle {
        case .editable, .editableDisabled:
            return false
        default:
            return true
        }
    }

    func getValueText(_ configuration: RatingControlConfiguration) -> String {
        guard self.getReadOnly(configuration) else {
            let format = configuration.ratingValueFormat ?? NSLocalizedString("%d of %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            return String(format: format, configuration.rating, configuration.ratingBounds.upperBound)
        }
        let avgRating = configuration.averageRating ?? CGFloat(configuration.rating)
        return String(format: configuration.averageRatingFormat, avgRating, configuration.ratingBounds.upperBound)
    }

    func getReviewCountText(_ configuration: RatingControlConfiguration, reviewCount: Int) -> String {
        if let reviewCountCeiling = configuration.reviewCountCeiling, reviewCount > reviewCountCeiling {
            let format = configuration.reviewCountCeilingFormat ?? NSLocalizedString("%d+ reviews", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            return String(format: format, reviewCountCeiling)
        }
        let format = configuration.reviewCountFormat ?? NSLocalizedString("%d reviews", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        return String(format: format, reviewCount)
    }
}

// Default fiori styles
extension RatingControlFioriStyle {
    struct ContentFioriStyle: RatingControlStyle {
        func makeBody(_ configuration: RatingControlConfiguration) -> some View {
            RatingControl(configuration)
                .font(self.getFont(configuration))
                .foregroundStyle(self.getColor(configuration))
        }

        func getFont(_ configuration: RatingControlConfiguration) -> Font {
            if let font = configuration.valueLabelFont {
                return font
            }
            switch configuration.ratingControlStyle {
            case .editable, .editableDisabled, .standardLarge, .accentedLarge:
                return .fiori(forTextStyle: .body)
            case .standard, .accented:
                return .fiori(forTextStyle: .subheadline)
            }
        }

        func getColor(_ configuration: RatingControlConfiguration) -> Color {
            if let color = configuration.valueLabelColor {
                return color
            }
            switch configuration.ratingControlStyle {
            case .editable:
                return .preferredColor(.primaryLabel)
            case .editableDisabled:
                return .preferredColor(.quaternaryLabel)
            case .standard, .standardLarge, .accented, .accentedLarge:
                return .preferredColor(.tertiaryLabel)
            }
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
