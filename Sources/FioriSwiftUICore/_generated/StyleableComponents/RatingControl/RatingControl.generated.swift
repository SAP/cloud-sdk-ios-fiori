// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `RatingControl` uses images to represent a rating.
///
/// The number of "On" images denotes the rating.
/// The default "On" image is a filled star while the default "Off" inmage
/// is an unfilled star.
public struct RatingControl {
    /// The rating value.
    @Binding var rating: Int
    /// The style of this `RatingControl`.
    let ratingControlStyle: RatingControl.Style
    /// The range of the rating values. The default is `0...5`.
    let ratingBounds: ClosedRange<Int>
    /// The custom image to be used for "On".
    let onImage: Image?
    /// The custom image to be used for "Off".
    let offImage: Image?
    /// The custom image to be used for half On image.
    let halfImage: Image?
    /// The custom fixed size of each item image view.
    let itemSize: CGSize?
    /// The custom color for the ON image.
    let onColor: Color?
    /// The custom color for the OFF image.
    let offColor: Color?
    /// The custom spacing between images.
    let interItemSpacing: CGFloat?
    /// The rating format for displaying rating value.
    /// When this is `nil`, the default format is "%d of %d" where "of" is the localized "of". The first parameter is the rating value while the second parameter is the total number of stars.
    let ratingValueFormat: String?
    /// The custom font for value label.
    let valueLabelFont: Font?
    /// The custom text color for value label.
    let valueLabelColor: Color?
    /// This property indicates if the value label is to be displayed or not. The default value is `false` for backward compatibility.
    let showsValueLabel: Bool
    /// The average rating for read-only style.
    let averageRating: CGFloat?
    /// The format for display the average rating. The default is "%.1f"
    let averageRatingFormat: String
    /// The number of reviews.
    let reviewCount: Int?
    /// The format for the review count string. The default is "%d reviews" where "reviews" is the localized "reviews" string.
    let reviewCountFormat: String?
    /// The ceiling number to be displayed for review count. If the `reviewCount` is larger than this number, this number will be displayed with a "+" sign after the number.
    let reviewCountCeiling: Int?
    /// The format for the review count string when the count is over the ceiling. The default is "%d+ reviews" where "reviews" is the localized "reviews" string.
    let reviewCountCeilingFormat: String?
    /// This property indicates if the review count label is to be displayed or not. The default value is `false` for backward compatibility.
    let showsReviewCountLabel: Bool

    @Environment(\.ratingControlStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(rating: Binding<Int>,
                ratingControlStyle: RatingControl.Style = .editable,
                ratingBounds: ClosedRange<Int> = 0 ... 5,
                onImage: Image? = nil,
                offImage: Image? = nil,
                halfImage: Image? = nil,
                itemSize: CGSize? = nil,
                onColor: Color? = nil,
                offColor: Color? = nil,
                interItemSpacing: CGFloat? = nil,
                ratingValueFormat: String? = nil,
                valueLabelFont: Font? = nil,
                valueLabelColor: Color? = nil,
                showsValueLabel: Bool = false,
                averageRating: CGFloat? = nil,
                averageRatingFormat: String = "%.1f",
                reviewCount: Int? = nil,
                reviewCountFormat: String? = nil,
                reviewCountCeiling: Int? = nil,
                reviewCountCeilingFormat: String? = nil,
                showsReviewCountLabel: Bool = false)
    {
        self._rating = rating
        self.ratingControlStyle = ratingControlStyle
        self.ratingBounds = ratingBounds
        self.onImage = onImage
        self.offImage = offImage
        self.halfImage = halfImage
        self.itemSize = itemSize
        self.onColor = onColor
        self.offColor = offColor
        self.interItemSpacing = interItemSpacing
        self.ratingValueFormat = ratingValueFormat
        self.valueLabelFont = valueLabelFont
        self.valueLabelColor = valueLabelColor
        self.showsValueLabel = showsValueLabel
        self.averageRating = averageRating
        self.averageRatingFormat = averageRatingFormat
        self.reviewCount = reviewCount
        self.reviewCountFormat = reviewCountFormat
        self.reviewCountCeiling = reviewCountCeiling
        self.reviewCountCeilingFormat = reviewCountCeilingFormat
        self.showsReviewCountLabel = showsReviewCountLabel
    }
}

public extension RatingControl {
    init(_ configuration: RatingControlConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: RatingControlConfiguration, shouldApplyDefaultStyle: Bool) {
        self._rating = configuration.$rating
        self.ratingControlStyle = configuration.ratingControlStyle
        self.ratingBounds = configuration.ratingBounds
        self.onImage = configuration.onImage
        self.offImage = configuration.offImage
        self.halfImage = configuration.halfImage
        self.itemSize = configuration.itemSize
        self.onColor = configuration.onColor
        self.offColor = configuration.offColor
        self.interItemSpacing = configuration.interItemSpacing
        self.ratingValueFormat = configuration.ratingValueFormat
        self.valueLabelFont = configuration.valueLabelFont
        self.valueLabelColor = configuration.valueLabelColor
        self.showsValueLabel = configuration.showsValueLabel
        self.averageRating = configuration.averageRating
        self.averageRatingFormat = configuration.averageRatingFormat
        self.reviewCount = configuration.reviewCount
        self.reviewCountFormat = configuration.reviewCountFormat
        self.reviewCountCeiling = configuration.reviewCountCeiling
        self.reviewCountCeilingFormat = configuration.reviewCountCeilingFormat
        self.showsReviewCountLabel = configuration.showsReviewCountLabel
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension RatingControl: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(rating: self.$rating, ratingControlStyle: self.ratingControlStyle, ratingBounds: self.ratingBounds, onImage: self.onImage, offImage: self.offImage, halfImage: self.halfImage, itemSize: self.itemSize, onColor: self.onColor, offColor: self.offColor, interItemSpacing: self.interItemSpacing, ratingValueFormat: self.ratingValueFormat, valueLabelFont: self.valueLabelFont, valueLabelColor: self.valueLabelColor, showsValueLabel: self.showsValueLabel, averageRating: self.averageRating, averageRatingFormat: self.averageRatingFormat, reviewCount: self.reviewCount, reviewCountFormat: self.reviewCountFormat, reviewCountCeiling: self.reviewCountCeiling, reviewCountCeilingFormat: self.reviewCountCeilingFormat, showsReviewCountLabel: self.showsReviewCountLabel)).typeErased
                .transformEnvironment(\.ratingControlStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension RatingControl {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        RatingControl(.init(rating: self.$rating, ratingControlStyle: self.ratingControlStyle, ratingBounds: self.ratingBounds, onImage: self.onImage, offImage: self.offImage, halfImage: self.halfImage, itemSize: self.itemSize, onColor: self.onColor, offColor: self.offColor, interItemSpacing: self.interItemSpacing, ratingValueFormat: self.ratingValueFormat, valueLabelFont: self.valueLabelFont, valueLabelColor: self.valueLabelColor, showsValueLabel: self.showsValueLabel, averageRating: self.averageRating, averageRatingFormat: self.averageRatingFormat, reviewCount: self.reviewCount, reviewCountFormat: self.reviewCountFormat, reviewCountCeiling: self.reviewCountCeiling, reviewCountCeilingFormat: self.reviewCountCeilingFormat, showsReviewCountLabel: self.showsReviewCountLabel))
            .shouldApplyDefaultStyle(false)
            .ratingControlStyle(RatingControlFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
