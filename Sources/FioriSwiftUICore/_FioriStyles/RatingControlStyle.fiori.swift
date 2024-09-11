import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct RatingControlBaseStyle: RatingControlStyle {
    @Environment(\.sizeCategory) var sizeCategory

    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        self.getMainBody(configuration)
            .onTapGesture { location in
                if configuration.ratingControlStyle == .editable {
                    self.setRatingValue(configuration, location: location, isTap: true)
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

    @ViewBuilder func getMainBody(_ configuration: RatingControlConfiguration) -> some View {
        if self.sizeCategory >= ContentSizeCategory.extraExtraExtraLarge {
            VStack {
                self.getFirstLabel(configuration)
                HStack(spacing: configuration.getItemSpacing()) {
                    self.getRatingView(configuration)
                }
                self.getSecondLabel(configuration)
            }
        } else {
            HStack(spacing: configuration.getItemSpacing()) {
                self.getFirstLabel(configuration)
                self.getRatingView(configuration)
                self.getSecondLabel(configuration)
            }
        }
    }

    @ViewBuilder func getFirstLabel(_ configuration: RatingControlConfiguration) -> some View {
        if configuration.showsValueLabel, self.getReadOnly(configuration) {
            // shows value label
            ValueLabel(valueLabel: AttributedString(self.getValueText(configuration)))
        }
    }

    @ViewBuilder func getRatingView(_ configuration: RatingControlConfiguration) -> some View {
        if self.getReadOnly(configuration), let averageRating = configuration.averageRating {
            ForEach(configuration.ratingItems(averageRating)) { ratingItem in
                if ratingItem.isOn {
                    configuration.onStarImage
                } else if ratingItem.isHalf {
                    configuration.halfStarImage
                } else {
                    configuration.offStarImage
                }
            }
        } else {
            ForEach(configuration.ratingItems(configuration.rating)) { ratingItem in
                if ratingItem.isOn {
                    configuration.onStarImage
                } else {
                    configuration.offStarImage
                }
            }
        }
    }

    @ViewBuilder func getSecondLabel(_ configuration: RatingControlConfiguration) -> some View {
        if configuration.showsValueLabel, !self.getReadOnly(configuration) {
            // shows value label
            ValueLabel(valueLabel: AttributedString(self.getValueText(configuration)))
        }
        if let reviewCount = configuration.reviewCount, configuration.showsReviewCountLabel, getReadOnly(configuration) {
            // shows review count
            ReviewCountLabel(reviewCountLabel: AttributedString(self.getReviewCountText(configuration, reviewCount: reviewCount)))
        }
    }

    func setRatingValue(_ configuration: RatingControlConfiguration, location: CGPoint, isTap: Bool = false) {
        var newValue = configuration.getRatingValue(location)
        if isTap, newValue == 1, configuration.rating == 1 {
            // Tap on the first star is set rating to 0 if original rating is 1
            newValue = 0
        }
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
        }
    }

    struct ValueLabelFioriStyle: ValueLabelStyle {
        let ratingControlConfiguration: RatingControlConfiguration
    
        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
                .font(self.ratingControlConfiguration.getDefaultLabelFont())
                .foregroundStyle(self.ratingControlConfiguration.getDefaultLabelColor())
        }
    }

    struct OnStarImageFioriStyle: OnStarImageStyle {
        let ratingControlConfiguration: RatingControlConfiguration
    
        func makeBody(_ configuration: OnStarImageConfiguration) -> some View {
            OnStarImage(configuration)
                .scaledToFit()
                .frame(width: self.ratingControlConfiguration.getItemSize().width, height: self.ratingControlConfiguration.getItemSize().height)
                .font(.body)
                .fontWeight(.light)
                .imageScale(self.ratingControlConfiguration.getScale())
                .foregroundColor(self.ratingControlConfiguration.getOnColor())
        }
    }

    struct OffStarImageFioriStyle: OffStarImageStyle {
        let ratingControlConfiguration: RatingControlConfiguration
    
        func makeBody(_ configuration: OffStarImageConfiguration) -> some View {
            OffStarImage(configuration)
                .scaledToFit()
                .frame(width: self.ratingControlConfiguration.getItemSize().width, height: self.ratingControlConfiguration.getItemSize().height)
                .font(.body)
                .fontWeight(.light)
                .imageScale(self.ratingControlConfiguration.getScale())
                .foregroundColor(self.ratingControlConfiguration.getOffColor())
        }
    }

    struct HalfStarImageFioriStyle: HalfStarImageStyle {
        let ratingControlConfiguration: RatingControlConfiguration
    
        func makeBody(_ configuration: HalfStarImageConfiguration) -> some View {
            HalfStarImage(configuration)
                .scaledToFit()
                .frame(width: self.ratingControlConfiguration.getItemSize().width, height: self.ratingControlConfiguration.getItemSize().height)
                .font(.fiori(forTextStyle: .body))
                .fontWeight(.light)
                .imageScale(self.ratingControlConfiguration.getScale())
                .foregroundColor(self.ratingControlConfiguration.getOnColor())
        }
    }

    struct ReviewCountLabelFioriStyle: ReviewCountLabelStyle {
        let ratingControlConfiguration: RatingControlConfiguration
    
        func makeBody(_ configuration: ReviewCountLabelConfiguration) -> some View {
            ReviewCountLabel(configuration)
                .font(self.ratingControlConfiguration.getDefaultLabelFont())
                .foregroundStyle(self.ratingControlConfiguration.getDefaultLabelColor())
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
