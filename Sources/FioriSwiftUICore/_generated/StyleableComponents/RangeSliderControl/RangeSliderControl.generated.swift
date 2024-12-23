// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct RangeSliderControl {
    let lowerThumb: any View
    let upperThumb: any View
    let activeTrack: any View
    let inactiveTrack: any View
    /// The lower value of range slider.
    @Binding var lowerValue: Double
    /// The upper value of range slider
    @Binding var upperValue: Double
    /// The range of the slider values. The default is `0...100`.
    let range: ClosedRange<Double>
    /// The incremental/decremental value when the thumb changes its position. The default is `1`.
    let step: Double
    /// This property specifies the number of digits that should appear after the decimal point in the Double value for slider value or lower/upper value for range slider . It controls the precision of the numerical representation by determining how many decimal places are displayed or used in calculations, rounding the Double accordingly. The default is `0`
    let decimalPlaces: Int
    /// The half-width of the thumb. This value only takes effect for a range slider. In the context of a circular representation of the thumb, this value is used as the radius. It should be less than 22. The default value is `14`.
    let thumbHalfWidth: CGFloat
    /// Indicates whether the lower thumb is to be displayed or not. The default value is `true`
    let showsLowerThumb: Bool
    /// Indicates whether the upper thumb is to be displayed or not. The default value is `true`
    let showsUpperThumb: Bool
    /// An optional callback function that is triggered when the user begins to drag either the lower or upper thumb along the range slider's track or edit the value in text field to adjust the slider's values. The first boolean parameter indicates whether the editing has begun or ended, with `false` signifying that the editing has ended. The second parameter is a double that represents the updated lower value, while the third parameter (also a double) represents the updated upper value.
    let onRangeValueChange: ((Bool, Double, Double) -> Void)?

    @Environment(\.rangeSliderControlStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder lowerThumb: () -> any View,
                @ViewBuilder upperThumb: () -> any View,
                @ViewBuilder activeTrack: () -> any View,
                @ViewBuilder inactiveTrack: () -> any View,
                lowerValue: Binding<Double>,
                upperValue: Binding<Double>,
                range: ClosedRange<Double> = 0 ... 100,
                step: Double = 1,
                decimalPlaces: Int = 0,
                thumbHalfWidth: CGFloat = 14,
                showsLowerThumb: Bool = true,
                showsUpperThumb: Bool = true,
                onRangeValueChange: ((Bool, Double, Double) -> Void)? = nil)
    {
        self.lowerThumb = LowerThumb(lowerThumb: lowerThumb)
        self.upperThumb = UpperThumb(upperThumb: upperThumb)
        self.activeTrack = ActiveTrack(activeTrack: activeTrack)
        self.inactiveTrack = InactiveTrack(inactiveTrack: inactiveTrack)
        self._lowerValue = lowerValue
        self._upperValue = upperValue
        self.range = range
        self.step = step
        self.decimalPlaces = decimalPlaces
        self.thumbHalfWidth = thumbHalfWidth
        self.showsLowerThumb = showsLowerThumb
        self.showsUpperThumb = showsUpperThumb
        self.onRangeValueChange = onRangeValueChange
    }
}

public extension RangeSliderControl {
    init(lowerThumb: any Shape = Circle(),
         upperThumb: any Shape = Circle(),
         activeTrack: any Shape = Capsule(),
         inactiveTrack: any Shape = Capsule(),
         lowerValue: Binding<Double>,
         upperValue: Binding<Double>,
         range: ClosedRange<Double> = 0 ... 100,
         step: Double = 1,
         decimalPlaces: Int = 0,
         thumbHalfWidth: CGFloat = 14,
         showsLowerThumb: Bool = true,
         showsUpperThumb: Bool = true,
         onRangeValueChange: ((Bool, Double, Double) -> Void)? = nil)
    {
        self.init(lowerThumb: { lowerThumb }, upperThumb: { upperThumb }, activeTrack: { activeTrack }, inactiveTrack: { inactiveTrack }, lowerValue: lowerValue, upperValue: upperValue, range: range, step: step, decimalPlaces: decimalPlaces, thumbHalfWidth: thumbHalfWidth, showsLowerThumb: showsLowerThumb, showsUpperThumb: showsUpperThumb, onRangeValueChange: onRangeValueChange)
    }
}

public extension RangeSliderControl {
    init(_ configuration: RangeSliderControlConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: RangeSliderControlConfiguration, shouldApplyDefaultStyle: Bool) {
        self.lowerThumb = configuration.lowerThumb
        self.upperThumb = configuration.upperThumb
        self.activeTrack = configuration.activeTrack
        self.inactiveTrack = configuration.inactiveTrack
        self._lowerValue = configuration.$lowerValue
        self._upperValue = configuration.$upperValue
        self.range = configuration.range
        self.step = configuration.step
        self.decimalPlaces = configuration.decimalPlaces
        self.thumbHalfWidth = configuration.thumbHalfWidth
        self.showsLowerThumb = configuration.showsLowerThumb
        self.showsUpperThumb = configuration.showsUpperThumb
        self.onRangeValueChange = configuration.onRangeValueChange
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension RangeSliderControl: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(lowerThumb: .init(self.lowerThumb), upperThumb: .init(self.upperThumb), activeTrack: .init(self.activeTrack), inactiveTrack: .init(self.inactiveTrack), lowerValue: self.$lowerValue, upperValue: self.$upperValue, range: self.range, step: self.step, decimalPlaces: self.decimalPlaces, thumbHalfWidth: self.thumbHalfWidth, showsLowerThumb: self.showsLowerThumb, showsUpperThumb: self.showsUpperThumb, onRangeValueChange: self.onRangeValueChange)).typeErased
                .transformEnvironment(\.rangeSliderControlStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension RangeSliderControl {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        RangeSliderControl(.init(lowerThumb: .init(self.lowerThumb), upperThumb: .init(self.upperThumb), activeTrack: .init(self.activeTrack), inactiveTrack: .init(self.inactiveTrack), lowerValue: self.$lowerValue, upperValue: self.$upperValue, range: self.range, step: self.step, decimalPlaces: self.decimalPlaces, thumbHalfWidth: self.thumbHalfWidth, showsLowerThumb: self.showsLowerThumb, showsUpperThumb: self.showsUpperThumb, onRangeValueChange: self.onRangeValueChange))
            .shouldApplyDefaultStyle(false)
            .rangeSliderControlStyle(RangeSliderControlFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
