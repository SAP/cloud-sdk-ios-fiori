// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

/// `RatingControl` uses images to represent a rating.
///
/// The number of "On" images denotes the rating.
/// The default "On" image is a filled star while the default "Off" inmage
/// is an unfilled star.
public struct RatingControl {
    let valueLabel: any View
    /// The image to be used for "On" rating star.
    let onStarImage: any View
    /// / The image to be used for "Off" rating star.
    let offStarImage: any View
    /// / The image to be used for "half" rating star.
    let halfStarImage: any View
    let reviewCountLabel: any View
    /// The rating value.
    @Binding var rating: Int
    /// The style of this `RatingControl`.
    let ratingControlStyle: RatingControl.Style
    /// The range of the rating values. The default is `0...5`.
    let ratingBounds: ClosedRange<Int>
    /// The custom fixed size of each item image view.
    let itemSize: CGSize?
    /// The custom spacing between images.
    let interItemSpacing: CGFloat?
    /// The rating format for displaying rating value.
    /// When this is `nil`, the default format is "%d of %d" where "of" is the localized "of". The first parameter is the rating value while the second parameter is the total number of stars.
    let ratingValueFormat: String?
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

    var componentIdentifier: String = RatingControl.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder valueLabel: () -> any View = { EmptyView() },
                @ViewBuilder onStarImage: () -> any View,
                @ViewBuilder offStarImage: () -> any View,
                @ViewBuilder halfStarImage: () -> any View,
                @ViewBuilder reviewCountLabel: () -> any View = { EmptyView() },
                rating: Binding<Int>,
                ratingControlStyle: RatingControl.Style = .editable,
                ratingBounds: ClosedRange<Int> = 0 ... 5,
                itemSize: CGSize? = nil,
                interItemSpacing: CGFloat? = nil,
                ratingValueFormat: String? = nil,
                showsValueLabel: Bool = false,
                averageRating: CGFloat? = nil,
                averageRatingFormat: String = "%.1f",
                reviewCount: Int? = nil,
                reviewCountFormat: String? = nil,
                reviewCountCeiling: Int? = nil,
                reviewCountCeilingFormat: String? = nil,
                showsReviewCountLabel: Bool = false,
                componentIdentifier: String? = RatingControl.identifier)
    {
        self.valueLabel = ValueLabel(valueLabel: valueLabel, componentIdentifier: componentIdentifier)
        self.onStarImage = OnStarImage(onStarImage: onStarImage, componentIdentifier: componentIdentifier)
        self.offStarImage = OffStarImage(offStarImage: offStarImage, componentIdentifier: componentIdentifier)
        self.halfStarImage = HalfStarImage(halfStarImage: halfStarImage, componentIdentifier: componentIdentifier)
        self.reviewCountLabel = ReviewCountLabel(reviewCountLabel: reviewCountLabel, componentIdentifier: componentIdentifier)
        self._rating = rating
        self.ratingControlStyle = ratingControlStyle
        self.ratingBounds = ratingBounds
        self.itemSize = itemSize
        self.interItemSpacing = interItemSpacing
        self.ratingValueFormat = ratingValueFormat
        self.showsValueLabel = showsValueLabel
        self.averageRating = averageRating
        self.averageRatingFormat = averageRatingFormat
        self.reviewCount = reviewCount
        self.reviewCountFormat = reviewCountFormat
        self.reviewCountCeiling = reviewCountCeiling
        self.reviewCountCeilingFormat = reviewCountCeilingFormat
        self.showsReviewCountLabel = showsReviewCountLabel
        self.componentIdentifier = componentIdentifier ?? RatingControl.identifier
    }
}

public extension RatingControl {
    static let identifier = "fiori_ratingcontrol_component"
}

public extension RatingControl {
    init(valueLabel: AttributedString? = nil,
         onStarImage: Image = FioriIcon.actions.favorite.renderingMode(.template).resizable(),
         offStarImage: Image = FioriIcon.actions.unfavorite.renderingMode(.template).resizable(),
         halfStarImage: Image = FioriIcon.actions.halfStar.renderingMode(.template).resizable(),
         reviewCountLabel: AttributedString? = nil,
         rating: Binding<Int>,
         ratingControlStyle: RatingControl.Style = .editable,
         ratingBounds: ClosedRange<Int> = 0 ... 5,
         itemSize: CGSize? = nil,
         interItemSpacing: CGFloat? = nil,
         ratingValueFormat: String? = nil,
         showsValueLabel: Bool = false,
         averageRating: CGFloat? = nil,
         averageRatingFormat: String = "%.1f",
         reviewCount: Int? = nil,
         reviewCountFormat: String? = nil,
         reviewCountCeiling: Int? = nil,
         reviewCountCeilingFormat: String? = nil,
         showsReviewCountLabel: Bool = false)
    {
        self.init(valueLabel: { OptionalText(valueLabel) }, onStarImage: { onStarImage }, offStarImage: { offStarImage }, halfStarImage: { halfStarImage }, reviewCountLabel: { OptionalText(reviewCountLabel) }, rating: rating, ratingControlStyle: ratingControlStyle, ratingBounds: ratingBounds, itemSize: itemSize, interItemSpacing: interItemSpacing, ratingValueFormat: ratingValueFormat, showsValueLabel: showsValueLabel, averageRating: averageRating, averageRatingFormat: averageRatingFormat, reviewCount: reviewCount, reviewCountFormat: reviewCountFormat, reviewCountCeiling: reviewCountCeiling, reviewCountCeilingFormat: reviewCountCeilingFormat, showsReviewCountLabel: showsReviewCountLabel)
    }
}

public extension RatingControl {
    init(_ configuration: RatingControlConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: RatingControlConfiguration, shouldApplyDefaultStyle: Bool) {
        self.valueLabel = configuration.valueLabel
        self.onStarImage = configuration.onStarImage
        self.offStarImage = configuration.offStarImage
        self.halfStarImage = configuration.halfStarImage
        self.reviewCountLabel = configuration.reviewCountLabel
        self._rating = configuration.$rating
        self.ratingControlStyle = configuration.ratingControlStyle
        self.ratingBounds = configuration.ratingBounds
        self.itemSize = configuration.itemSize
        self.interItemSpacing = configuration.interItemSpacing
        self.ratingValueFormat = configuration.ratingValueFormat
        self.showsValueLabel = configuration.showsValueLabel
        self.averageRating = configuration.averageRating
        self.averageRatingFormat = configuration.averageRatingFormat
        self.reviewCount = configuration.reviewCount
        self.reviewCountFormat = configuration.reviewCountFormat
        self.reviewCountCeiling = configuration.reviewCountCeiling
        self.reviewCountCeilingFormat = configuration.reviewCountCeilingFormat
        self.showsReviewCountLabel = configuration.showsReviewCountLabel
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension RatingControl: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, valueLabel: .init(self.valueLabel), onStarImage: .init(self.onStarImage), offStarImage: .init(self.offStarImage), halfStarImage: .init(self.halfStarImage), reviewCountLabel: .init(self.reviewCountLabel), rating: self.$rating, ratingControlStyle: self.ratingControlStyle, ratingBounds: self.ratingBounds, itemSize: self.itemSize, interItemSpacing: self.interItemSpacing, ratingValueFormat: self.ratingValueFormat, showsValueLabel: self.showsValueLabel, averageRating: self.averageRating, averageRatingFormat: self.averageRatingFormat, reviewCount: self.reviewCount, reviewCountFormat: self.reviewCountFormat, reviewCountCeiling: self.reviewCountCeiling, reviewCountCeilingFormat: self.reviewCountCeilingFormat, showsReviewCountLabel: self.showsReviewCountLabel)).typeErased
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
        RatingControl(.init(componentIdentifier: self.componentIdentifier, valueLabel: .init(self.valueLabel), onStarImage: .init(self.onStarImage), offStarImage: .init(self.offStarImage), halfStarImage: .init(self.halfStarImage), reviewCountLabel: .init(self.reviewCountLabel), rating: self.$rating, ratingControlStyle: self.ratingControlStyle, ratingBounds: self.ratingBounds, itemSize: self.itemSize, interItemSpacing: self.interItemSpacing, ratingValueFormat: self.ratingValueFormat, showsValueLabel: self.showsValueLabel, averageRating: self.averageRating, averageRatingFormat: self.averageRatingFormat, reviewCount: self.reviewCount, reviewCountFormat: self.reviewCountFormat, reviewCountCeiling: self.reviewCountCeiling, reviewCountCeilingFormat: self.reviewCountCeilingFormat, showsReviewCountLabel: self.showsReviewCountLabel))
            .shouldApplyDefaultStyle(false)
            .ratingControlStyle(RatingControlFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
