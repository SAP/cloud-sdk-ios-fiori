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
    /// The custom fixed size of each item image view.
    let itemSize: CGSize?
    /// The custom color for the ON image.
    let onColor: Color?
    /// The custom color for the OFF image.
    let offColor: Color?
    /// The custom spacing between images.
    let interItemSpacing: CGFloat?

    @Environment(\.ratingControlStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(rating: Binding<Int>,
                ratingControlStyle: RatingControl.Style = .editable,
                ratingBounds: ClosedRange<Int> = 0 ... 5,
                onImage: Image? = nil,
                offImage: Image? = nil,
                itemSize: CGSize? = nil,
                onColor: Color? = nil,
                offColor: Color? = nil,
                interItemSpacing: CGFloat? = nil)
    {
        self._rating = rating
        self.ratingControlStyle = ratingControlStyle
        self.ratingBounds = ratingBounds
        self.onImage = onImage
        self.offImage = offImage
        self.itemSize = itemSize
        self.onColor = onColor
        self.offColor = offColor
        self.interItemSpacing = interItemSpacing
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
        self.itemSize = configuration.itemSize
        self.onColor = configuration.onColor
        self.offColor = configuration.offColor
        self.interItemSpacing = configuration.interItemSpacing
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension RatingControl: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(rating: self.$rating, ratingControlStyle: self.ratingControlStyle, ratingBounds: self.ratingBounds, onImage: self.onImage, offImage: self.offImage, itemSize: self.itemSize, onColor: self.onColor, offColor: self.offColor, interItemSpacing: self.interItemSpacing)).typeErased
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
        RatingControl(.init(rating: self.$rating, ratingControlStyle: self.ratingControlStyle, ratingBounds: self.ratingBounds, onImage: self.onImage, offImage: self.offImage, itemSize: self.itemSize, onColor: self.onColor, offColor: self.offColor, interItemSpacing: self.interItemSpacing))
            .shouldApplyDefaultStyle(false)
            .ratingControlStyle(RatingControlFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
