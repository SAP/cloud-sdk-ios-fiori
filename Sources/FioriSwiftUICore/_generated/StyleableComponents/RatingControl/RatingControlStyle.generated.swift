// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol RatingControlStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: RatingControlConfiguration) -> Body
}

struct AnyRatingControlStyle: RatingControlStyle {
    let content: (RatingControlConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (RatingControlConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct RatingControlConfiguration {
    public let contentIdentifier = "FioriRatingControl_content"
    public let valueLabelIdentifier = "FioriRatingControl_valueLabel"
    public let onStarImageIdentifier = "FioriRatingControl_onStarImage"
    public let offStarImageIdentifier = "FioriRatingControl_offStarImage"
    public let halfStarImageIdentifier = "FioriRatingControl_halfStarImage"
    public let reviewCountLabelIdentifier = "FioriRatingControl_reviewCountLabel"

    public let valueLabel: ValueLabel
    public let onStarImage: OnStarImage
    public let offStarImage: OffStarImage
    public let halfStarImage: HalfStarImage
    public let reviewCountLabel: ReviewCountLabel
    @Binding public var rating: Int
    public let ratingControlStyle: RatingControl.Style
    public let ratingBounds: ClosedRange<Int>
    public let itemSize: CGSize?
    public let interItemSpacing: CGFloat?
    public let ratingValueFormat: String?
    public let showsValueLabel: Bool
    public let averageRating: CGFloat?
    public let averageRatingFormat: String
    public let reviewCount: Int?
    public let reviewCountFormat: String?
    public let reviewCountCeiling: Int?
    public let reviewCountCeilingFormat: String?
    public let showsReviewCountLabel: Bool

    public typealias ValueLabel = ConfigurationViewWrapper
    public typealias OnStarImage = ConfigurationViewWrapper
    public typealias OffStarImage = ConfigurationViewWrapper
    public typealias HalfStarImage = ConfigurationViewWrapper
    public typealias ReviewCountLabel = ConfigurationViewWrapper
}

public struct RatingControlFioriStyle: RatingControlStyle {
    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
            .valueLabelStyle(ValueLabelFioriStyle(ratingControlConfiguration: configuration))
            .onStarImageStyle(OnStarImageFioriStyle(ratingControlConfiguration: configuration))
            .offStarImageStyle(OffStarImageFioriStyle(ratingControlConfiguration: configuration))
            .halfStarImageStyle(HalfStarImageFioriStyle(ratingControlConfiguration: configuration))
            .reviewCountLabelStyle(ReviewCountLabelFioriStyle(ratingControlConfiguration: configuration))
    }
}

public struct RatingControlNSSStyle: RatingControlStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
            .valueLabelStyle(ValueLabelNSSStyle(ratingControlConfiguration: configuration, nssData: self.data.value(configuration.valueLabelIdentifier)))
            .onStarImageStyle(OnStarImageNSSStyle(ratingControlConfiguration: configuration, nssData: self.data.value(configuration.onStarImageIdentifier)))
            .offStarImageStyle(OffStarImageNSSStyle(ratingControlConfiguration: configuration, nssData: self.data.value(configuration.offStarImageIdentifier)))
            .halfStarImageStyle(HalfStarImageNSSStyle(ratingControlConfiguration: configuration, nssData: self.data.value(configuration.halfStarImageIdentifier)))
            .reviewCountLabelStyle(ReviewCountLabelNSSStyle(ratingControlConfiguration: configuration, nssData: self.data.value(configuration.reviewCountLabelIdentifier)))
            .ratingControlStyle(ContentNSSStyle(ratingControlConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
