import FioriThemeManager
import SwiftUI

public extension RatingControl {
    /**
     The available styles for the `RatingControl`.
     */
    enum Style {
        /**
         Editable style.

         Each rating star is large scale with tint color.
         This is the default style.
         */
        case editable

        /**
         Disabled editable style.

         Each rating star is the same as `Editable` style but with grey color. User interaction is disabled.
         */
        case editableDisabled

        /**
         Standard style.

         This `RatingControl` is read-only. Each rating star is in small scale.
         */
        case standard

        /**
         Standard large style.

         This `RatingControl` is read-only. Each rating star is in large scale.
         */
        case standardLarge

        /**
         Accented read-only style.

         This `RatingControl` is read-only. Each rating star is in small scale with accented color.
         */
        case accented

        /**
         Accented read-only style.

         This `RatingControl` is read-only. Each rating star is in large scale with accented color.
         */
        case accentedLarge
    }

    internal static func getAccessibilityLabelString(_ rating: Int, ratingBounds: ClosedRange<Int>) -> String {
        let labelFormat = NSLocalizedString("Rating Control %d of %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        return String(format: labelFormat, rating, ratingBounds.count - 1)
    }
}

extension RatingControlConfiguration {
    struct RatingItem: Identifiable {
        public let id = UUID()
        let isOn: Bool
        let isHalf: Bool
    }

    func ratingItems(_ rating: Int) -> [RatingItem] {
        var items: [RatingItem] = []
        for i in self.ratingBounds {
            guard i != self.ratingBounds.upperBound else {
                continue
            }
            items.append(RatingItem(isOn: i < rating, isHalf: false))
        }
        return items
    }

    func ratingItems(_ averageRating: CGFloat) -> [RatingItem] {
        var items: [RatingItem] = []
        for i in self.ratingBounds {
            guard i != self.ratingBounds.upperBound else {
                continue
            }
            let diff = averageRating - CGFloat(i)
            if diff < 0.25 {
                items.append(RatingItem(isOn: false, isHalf: false))
            } else if diff < 0.75 {
                items.append(RatingItem(isOn: false, isHalf: true))
            } else {
                items.append(RatingItem(isOn: true, isHalf: false))
            }
        }
        return items
    }

    func getOnColor() -> Color {
        switch self.ratingControlStyle {
        case .editable:
            return .preferredColor(.tintColor)
        case .editableDisabled:
            return .preferredColor(.quaternaryLabel)
        case .standard, .standardLarge:
            return .preferredColor(.tertiaryLabel)
        case .accented, .accentedLarge:
            return .preferredColor(.mango8)
        }
    }

    func getOffColor() -> Color {
        switch self.ratingControlStyle {
        case .editable:
            return .preferredColor(.tintColor)
        case .editableDisabled:
            return .preferredColor(.quaternaryLabel)
        case .standard, .standardLarge:
            return .preferredColor(.tertiaryLabel)
        case .accented, .accentedLarge:
            return .preferredColor(.mango8)
        }
    }

    func getDefaultLabelFont() -> Font {
        switch ratingControlStyle {
        case .editable, .editableDisabled, .standardLarge, .accentedLarge:
            return .fiori(forTextStyle: .body)
        case .standard, .accented:
            return .fiori(forTextStyle: .subheadline)
        }
    }

    func getDefaultLabelColor() -> Color {
        switch ratingControlStyle {
        case .editable:
            return .preferredColor(.primaryLabel)
        case .editableDisabled:
            return .preferredColor(.quaternaryLabel)
        case .standard, .standardLarge, .accented, .accentedLarge:
            return .preferredColor(.tertiaryLabel)
        }
    }

    func getScale() -> Image.Scale {
        switch self.ratingControlStyle {
        case .editable, .editableDisabled, .standardLarge, .accentedLarge:
            return .large
        case .standard, .accented:
            return .small
        }
    }

    func getItemSize() -> CGSize {
        if let itemSize {
            return itemSize
        }
        switch self.ratingControlStyle {
        case .editable, .editableDisabled, .standardLarge, .accentedLarge:
            return CGSize(width: 28, height: 28)
        case .standard, .accented:
            return CGSize(width: 16, height: 16)
        }
    }

    func getItemSpacing() -> CGFloat {
        if let interItemSpacing {
            return interItemSpacing
        }
        switch self.ratingControlStyle {
        case .editable, .editableDisabled, .standardLarge, .accentedLarge:
            return CGFloat(8)
        case .standard, .accented:
            return CGFloat(6)
        }
    }

    func getRatingValue(_ location: CGPoint) -> Int {
        let x = location.x
        if x <= 0 {
            return self.ratingBounds.lowerBound
        }
        let itemWidth = self.getItemSize().width + self.getItemSpacing()
        let n = Int(location.x / itemWidth) + 1
        if n >= self.ratingBounds.count {
            return self.ratingBounds.upperBound
        } else {
            return self.ratingBounds.lowerBound + n
        }
    }

    func getAccessbilityLabelString() -> String {
        switch ratingControlStyle {
        case .editable, .editableDisabled:
            let format = NSLocalizedString("Rating Control %d of %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            return String(format: format, rating, ratingBounds.count - 1)
        default:
            // read-only
            if let averageRating {
                if let reviewCount {
                    if let reviewCountCeiling, reviewCount > reviewCountCeiling {
                        // review count > review count ceiling
                        let format = NSLocalizedString("Rating Control, average rating %.1f of %d, %d plus reviews", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
                        return String(format: format, averageRating, ratingBounds.count - 1, reviewCountCeiling)
                    } else {
                        // review count < review count ceiling
                        let format = NSLocalizedString("Rating Control, average rating %.1f of %d, %d reviews", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
                        return String(format: format, averageRating, ratingBounds.count - 1, reviewCount)
                    }
                } else {
                    // no review count
                    let format = NSLocalizedString("Rating Control, average rating %.1f of %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
                    return String(format: format, averageRating, ratingBounds.count - 1)
                }
            } else {
                // no average rating
                if let reviewCount {
                    // has review count
                    let format = NSLocalizedString("Rating Control, rating %d of %d, %d reviews", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
                    return String(format: format, rating, ratingBounds.count - 1, reviewCount)
                } else {
                    // no review count
                    let format = NSLocalizedString("Rating Control %d of %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
                    return String(format: format, rating, ratingBounds.count - 1)
                }
            }
        }
    }
}
