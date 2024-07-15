// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
    public let title: Title
    @Binding public var rating: Int
    public let ratingControlStyle: RatingControl.Style
    public let ratingBounds: ClosedRange<Int>
    public let onImage: Image?
    public let offImage: Image?
    public let itemSize: CGSize?
    public let onColor: Color?
    public let offColor: Color?
    public let interItemSpacing: CGFloat?
    public let subtitle: Subtitle
    public let controlState: ControlState
    public let errorMessage: AttributedString?
    public let axis: Axis

    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
}

public struct RatingControlFormViewFioriStyle: RatingControlFormViewStyle {
    public func makeBody(_ configuration: RatingControlFormViewConfiguration) -> some View {
        RatingControlFormView(configuration)
            .titleStyle(TitleFioriStyle(ratingControlFormViewConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(ratingControlFormViewConfiguration: configuration))
            .ratingControlStyle(RatingControlFioriStyle(ratingControlFormViewConfiguration: configuration))
            .formViewStyle(FormViewFioriStyle(ratingControlFormViewConfiguration: configuration))
    }
}
