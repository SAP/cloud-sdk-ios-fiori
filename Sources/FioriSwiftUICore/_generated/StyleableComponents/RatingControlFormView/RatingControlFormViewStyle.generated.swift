// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol RatingControlFormViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: RatingControlFormViewConfiguration) -> Body
}

struct AnyRatingControlFormViewStyle: RatingControlFormViewStyle {
    let content: (RatingControlFormViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (RatingControlFormViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct RatingControlFormViewConfiguration {
    public let contentIdentifier = "FioriRatingControlFormView_content"
    public let titleIdentifier = "FioriRatingControlFormView_title"
    public let valueLabelIdentifier = "FioriRatingControlFormView_valueLabel"
    public let onStarImageIdentifier = "FioriRatingControlFormView_onStarImage"
    public let offStarImageIdentifier = "FioriRatingControlFormView_offStarImage"
    public let halfStarImageIdentifier = "FioriRatingControlFormView_halfStarImage"
    public let reviewCountLabelIdentifier = "FioriRatingControlFormView_reviewCountLabel"
    public let subtitleIdentifier = "FioriRatingControlFormView_subtitle"
    public let ratingControlIdentifier = "FioriRatingControlFormView_ratingControl"

    public let title: Title
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
    public let subtitle: Subtitle
    public let axis: Axis

    public typealias Title = ConfigurationViewWrapper
    public typealias ValueLabel = ConfigurationViewWrapper
    public typealias OnStarImage = ConfigurationViewWrapper
    public typealias OffStarImage = ConfigurationViewWrapper
    public typealias HalfStarImage = ConfigurationViewWrapper
    public typealias ReviewCountLabel = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
}

public struct RatingControlFormViewFioriStyle: RatingControlFormViewStyle {
    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .titleStyle(TitleFioriStyle(ratingControlFormViewConfiguration: configuration))
            .valueLabelStyle(ValueLabelFioriStyle(ratingControlFormViewConfiguration: configuration))
            .onStarImageStyle(OnStarImageFioriStyle(ratingControlFormViewConfiguration: configuration))
            .offStarImageStyle(OffStarImageFioriStyle(ratingControlFormViewConfiguration: configuration))
            .halfStarImageStyle(HalfStarImageFioriStyle(ratingControlFormViewConfiguration: configuration))
            .reviewCountLabelStyle(ReviewCountLabelFioriStyle(ratingControlFormViewConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(ratingControlFormViewConfiguration: configuration))
            .ratingControlStyle(RatingControlFioriStyle(ratingControlFormViewConfiguration: configuration))
    }
}

public struct RatingControlFormViewNSSStyle: RatingControlFormViewStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .titleStyle(TitleNSSStyle(ratingControlFormViewConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .valueLabelStyle(ValueLabelNSSStyle(ratingControlFormViewConfiguration: configuration, nssData: self.data.value(configuration.valueLabelIdentifier)))
            .onStarImageStyle(OnStarImageNSSStyle(ratingControlFormViewConfiguration: configuration, nssData: self.data.value(configuration.onStarImageIdentifier)))
            .offStarImageStyle(OffStarImageNSSStyle(ratingControlFormViewConfiguration: configuration, nssData: self.data.value(configuration.offStarImageIdentifier)))
            .halfStarImageStyle(HalfStarImageNSSStyle(ratingControlFormViewConfiguration: configuration, nssData: self.data.value(configuration.halfStarImageIdentifier)))
            .reviewCountLabelStyle(ReviewCountLabelNSSStyle(ratingControlFormViewConfiguration: configuration, nssData: self.data.value(configuration.reviewCountLabelIdentifier)))
            .subtitleStyle(SubtitleNSSStyle(ratingControlFormViewConfiguration: configuration, nssData: self.data.value(configuration.subtitleIdentifier)))
            .ratingControlStyle(RatingControlNSSStyle(ratingControlFormViewConfiguration: configuration, nssData: self.data.value(configuration.ratingControlIdentifier)))
            .ratingControlFormViewStyle(ContentNSSStyle(ratingControlFormViewConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
