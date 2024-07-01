import SwiftUI

/**
 The data type for Rating Control.
 */
public struct RatingControlConfig {
    /**
     The available style for the `FUIRatingControl`.
     */
    public enum Style {
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

    /**
     The style of this `RatingControlDataType`.

     The default is `.editable`
     */
    public var style: Style = .editable

    /**
     The range of the rating values.

     The default is 0 through 5. This means that there will be 5 images.
     If rating is 0, all five images will be using the off image.
     */
    public var ratingBounds: ClosedRange<Int> = 0 ... 5

    /**
     The custom image to be used for "On".

     If this property is not set, the default filled star image will be used.
     */
    public var onImage: Image?

    /**
     The custom image to be used for "Off".

     If this property is not set, the default empty star image will be used.
     */
    public var offImage: Image?

    /**
     The custom fixed size of each item image view.

     If this property is not set, the default size is used.
     */
    public var itemSize: CGSize?

    /**
     The custom color for the ON image.

     If this property is not set, the default color is used.
     */
    public var onColor: Color?

    /**
     The custom color for the OFF image.

     If this property is not set, the default color is used.
     */
    public var offColor: Color?

    /**
     The custom spacing between item images.

     If this property is not set, the default spacing is used.
     - For styles `.readOnlyStandard` `.readOnlyAccented`, the spacing is 2px.
     - For styles `.editableEnabled` and `.editableDisabled`, the spacing is 4px.
     */
    public var interItemSpacing: CGFloat?

    /**
     The public constructor.

     - parameter style: The style for this `RatingControl`. Default is `editable`
     - parameter ratingBounds: The bounds for this rating control. Default is from 0 to 5.
     - parameter onImage: The image for the ON state. The default is `nil`, meaning the default image is used.
     - parameter offImage: The image for the OFF state. The default is `nil`, meaning the default image is used.
     - parameter itemSize: The customized item size. The default is `nil`, meaning the default size is used.
     - parameter interItemSpacing: The spacing between items. The default is `nil`, meaning the default spacing is used.
     */
    public init(style: Style = .editable, ratingBounds: ClosedRange<Int> = 0 ... 5, onImage: Image? = nil, offImage: Image? = nil, onColor: Color? = nil, offColor: Color? = nil, itemSize: CGSize? = nil, interItemSpacing: CGFloat? = nil) {
        self.style = style
        self.ratingBounds = ratingBounds
        self.onImage = onImage
        self.offImage = offImage
        self.onColor = onColor
        self.offColor = offColor
        self.itemSize = itemSize
        self.interItemSpacing = interItemSpacing
    }

    struct RatingItem: Identifiable {
        let id = UUID()
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
        switch self.style {
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
        switch self.style {
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
        switch self.style {
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
        switch self.style {
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
        switch self.style {
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
