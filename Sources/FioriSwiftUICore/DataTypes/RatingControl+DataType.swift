import SwiftUI

public extension RatingControl {
    /**
     The available style for the `FUIRatingControl`.
     */
    enum Style {
        /**
         Editable style.

         Each rating star is a SF Symbol body light style (large scale) with tint color.
         This is the default style.
         */
        case editable

        /**
         Disabled editable style.

         Each rating star is the same as `Editable` style but with grey color.
         */
        case editableDisabled

        /**
         Standard style.

         This `FUIRatingControl` is read-only. Each rating star is a SF Symbol body light style (small scale).
         */
        case standard

        /**
         Accented read-only style.

         This `FUIRatingControl` is read-only with accented color. Each rating star is the same as in `standard` style.
         */
        case accented
    }
}

extension RatingControlConfiguration {
    struct RatingItem: Identifiable {
        public let id = UUID()
        let isOn: Bool
    }

    func ratingItems(_ rating: Int) -> [RatingItem] {
        var items: [RatingItem] = []
        for i in self.ratingBounds {
            guard i != self.ratingBounds.upperBound else {
                continue
            }
            items.append(RatingItem(isOn: i < rating))
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
        case .standard:
            return .preferredColor(.tertiaryLabel)
        case .accented:
            return .preferredColor(.mango3)
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
        case .standard:
            return .preferredColor(.tertiaryLabel)
        case .accented:
            return .preferredColor(.mango4)
        }
    }

    func getOnImageView() -> some View {
        self.getOnImage()
            .resizable(resizingMode: .stretch)
            .frame(width: self.getItemSize().width, height: self.getItemSize().height)
            .font(.body)
            .fontWeight(.light)
            .imageScale(self.getScale())
            .foregroundColor(self.getOnColor())
    }

    func getOffImageView() -> some View {
        self.getOffImage()
            .resizable(resizingMode: .stretch)
            .frame(width: self.getItemSize().width, height: self.getItemSize().height)
            .font(.body)
            .fontWeight(.light)
            .imageScale(self.getScale())
            .foregroundColor(self.getOffColor())
    }

    func getOnImage() -> Image {
        let image: Image = (onImage ?? Image(systemName: "star.fill"))
            .renderingMode(.template)
        return image
    }

    func getOffImage() -> Image {
        let image: Image = (offImage ?? Image(systemName: "star"))
            .renderingMode(.template)
        return image
    }

    func getScale() -> Image.Scale {
        switch self.ratingControlStyle {
        case .editable, .editableDisabled:
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
        case .editable, .editableDisabled:
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
        case .editable, .editableDisabled:
            return CGFloat(4)
        case .standard, .accented:
            return CGFloat(2)
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
