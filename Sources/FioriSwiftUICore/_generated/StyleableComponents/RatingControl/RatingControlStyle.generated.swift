// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
    @Binding public var rating: Int
    public let ratingControlStyle: RatingControl.Style
    public let ratingBounds: ClosedRange<Int>
    public let onImage: Image?
    public let offImage: Image?
    public let itemSize: CGSize?
    public let onColor: Color?
    public let offColor: Color?
    public let interItemSpacing: CGFloat?
}

public struct RatingControlFioriStyle: RatingControlStyle {
    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        RatingControl(configuration)
    }
}
