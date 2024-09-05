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
        let labelFormat = NSLocalizedString("%d out of %d stars", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
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
            if diff < 0.3 {
                items.append(RatingItem(isOn: false, isHalf: false))
            } else if diff < 0.7 {
                items.append(RatingItem(isOn: false, isHalf: true))
            } else {
                items.append(RatingItem(isOn: true, isHalf: false))
            }
        }
        return items
    }

    func getOnColor() -> Color {
        if let onColor {
            return onColor
        }
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
        if let offColor {
            return offColor
        }
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

    func getOnImageView() -> some View {
        self.getOnImage()
            .resizable()
            .scaledToFit()
            .frame(width: self.getItemSize().width, height: self.getItemSize().height)
            .font(.body)
            .fontWeight(.light)
            .imageScale(self.getScale())
            .foregroundColor(self.getOnColor())
    }

    func getOffImageView() -> some View {
        self.getOffImage()
            .resizable()
            .scaledToFit()
            .frame(width: self.getItemSize().width, height: self.getItemSize().height)
            .font(.body)
            .fontWeight(.light)
            .imageScale(self.getScale())
            .foregroundColor(self.getOffColor())
    }

    func getHalfImageView() -> some View {
        self.getHalfImage()
            .resizable()
            .scaledToFit()
            .frame(width: self.getItemSize().width, height: self.getItemSize().height)
            .font(.body)
            .fontWeight(.light)
            .imageScale(self.getScale())
            .foregroundColor(self.getOnColor())
    }

    func getOnImage() -> Image {
        let image: Image = (onImage ?? FioriIcon.actions.favorite)
            .renderingMode(.template)
        return image
    }

    func getOffImage() -> Image {
        let image: Image = (offImage ?? FioriIcon.actions.unfavorite)
            .renderingMode(.template)
        return image
    }

    func getHalfImage() -> Image {
        let image: Image = (halfImage ?? FioriIcon.actions.halfStar)
            .renderingMode(.template)
        return image
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
}
