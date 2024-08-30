// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// The form view which contains a title, rating control, and a subtitle
public struct RatingControlFormView {
    let title: any View
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
    let subtitle: any View
    /// The `ControlState` of the form view. The default is `normal`
    let controlState: ControlState
    /// The error message of the form view.
    let errorMessage: AttributedString?
    /// Indicates if the axis for displaying the title and rating control.
    let axis: Axis

    @Environment(\.ratingControlFormViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                rating: Binding<Int>,
                ratingControlStyle: RatingControl.Style = .editable,
                ratingBounds: ClosedRange<Int> = 0 ... 5,
                onImage: Image? = nil,
                offImage: Image? = nil,
                itemSize: CGSize? = nil,
                onColor: Color? = nil,
                offColor: Color? = nil,
                interItemSpacing: CGFloat? = nil,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                axis: Axis = .horizontal)
    {
        self.title = Title(title: title)
        self._rating = rating
        self.ratingControlStyle = ratingControlStyle
        self.ratingBounds = ratingBounds
        self.onImage = onImage
        self.offImage = offImage
        self.itemSize = itemSize
        self.onColor = onColor
        self.offColor = offColor
        self.interItemSpacing = interItemSpacing
        self.subtitle = Subtitle(subtitle: subtitle)
        self.controlState = controlState
        self.errorMessage = errorMessage
        self.axis = axis
    }
}

public extension RatingControlFormView {
    init(title: AttributedString,
         rating: Binding<Int>,
         ratingControlStyle: RatingControl.Style = .editable,
         ratingBounds: ClosedRange<Int> = 0 ... 5,
         onImage: Image? = nil,
         offImage: Image? = nil,
         itemSize: CGSize? = nil,
         onColor: Color? = nil,
         offColor: Color? = nil,
         interItemSpacing: CGFloat? = nil,
         subtitle: AttributedString? = nil,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         axis: Axis = .horizontal)
    {
        self.init(title: { Text(title) }, rating: rating, ratingControlStyle: ratingControlStyle, ratingBounds: ratingBounds, onImage: onImage, offImage: offImage, itemSize: itemSize, onColor: onColor, offColor: offColor, interItemSpacing: interItemSpacing, subtitle: { OptionalText(subtitle) }, controlState: controlState, errorMessage: errorMessage, axis: axis)
    }
}

public extension RatingControlFormView {
    init(_ configuration: RatingControlFormViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: RatingControlFormViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self._rating = configuration.$rating
        self.ratingControlStyle = configuration.ratingControlStyle
        self.ratingBounds = configuration.ratingBounds
        self.onImage = configuration.onImage
        self.offImage = configuration.offImage
        self.itemSize = configuration.itemSize
        self.onColor = configuration.onColor
        self.offColor = configuration.offColor
        self.interItemSpacing = configuration.interItemSpacing
        self.subtitle = configuration.subtitle
        self.controlState = configuration.controlState
        self.errorMessage = configuration.errorMessage
        self.axis = configuration.axis
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension RatingControlFormView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), rating: self.$rating, ratingControlStyle: self.ratingControlStyle, ratingBounds: self.ratingBounds, onImage: self.onImage, offImage: self.offImage, itemSize: self.itemSize, onColor: self.onColor, offColor: self.offColor, interItemSpacing: self.interItemSpacing, subtitle: .init(self.subtitle), controlState: self.controlState, errorMessage: self.errorMessage, axis: self.axis)).typeErased
                .transformEnvironment(\.ratingControlFormViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension RatingControlFormView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        RatingControlFormView(.init(title: .init(self.title), rating: self.$rating, ratingControlStyle: self.ratingControlStyle, ratingBounds: self.ratingBounds, onImage: self.onImage, offImage: self.offImage, itemSize: self.itemSize, onColor: self.onColor, offColor: self.offColor, interItemSpacing: self.interItemSpacing, subtitle: .init(self.subtitle), controlState: self.controlState, errorMessage: self.errorMessage, axis: self.axis))
            .shouldApplyDefaultStyle(false)
            .ratingControlFormViewStyle(RatingControlFormViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
