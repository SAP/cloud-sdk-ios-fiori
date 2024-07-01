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
    /// The rating conrol configuration parameters.
    let ratingControlConfig: RatingControlConfig

    @Environment(\.ratingControlStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(rating: Binding<Int>,
                ratingControlConfig: RatingControlConfig)
    {
        self._rating = rating
        self.ratingControlConfig = ratingControlConfig
    }
}

public extension RatingControl {
    init(_ configuration: RatingControlConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: RatingControlConfiguration, shouldApplyDefaultStyle: Bool) {
        self._rating = configuration.$rating
        self.ratingControlConfig = configuration.ratingControlConfig
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension RatingControl: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(rating: self.$rating, ratingControlConfig: self.ratingControlConfig)).typeErased
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
        RatingControl(.init(rating: self.$rating, ratingControlConfig: self.ratingControlConfig))
            .shouldApplyDefaultStyle(false)
            .ratingControlStyle(RatingControlFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
