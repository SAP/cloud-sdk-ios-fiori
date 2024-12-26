// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// The `FioriSlider` is a SwiftUI component that provides both a standard slider and a range slider.
/// The standard slider allows users to select a single value, while the range slider allows users to select a range of values with two thumbs.
///
/// ## Usage
///
/// ### Standard Slider:
///
/// A standard slider consists of a title, a bound value, and a "thumb" (an image that users can drag along a linear "track".
/// The track represents a continuum between two extremes: a minimum and a maximum value.
/// By default, the formatted minimum value is displayed at the leading end of the slider, and the formatted maximum value is displayed at the trailing end of the slider.
///
/// The title is displayed at the top left of the component, while the bound value is displayed at the top right. As users move the thumb, the slider continuously updates its bound value to reflect the thumb’s position.
///
/// The following example illustrates a standard slider bound to the value `speed`. The slider uses the default range of `0` to `100`, with a default step of `1`.
/// The minimum value of the range is displayed as the leading accessory view label, while the maximum value is shown as the trailing accessory view label.
/// As the slider updates the `speed` value, the updated value is displayed in a label at the top right of the slider.
///
///  ```swift
///  @State private var speed: Double = 20
///
///  FioriSlider(
///      title: "Speed Limit",
///      value: $speed,
///      description: "Simple standard slider"
///  )
///  ```
///
/// You can also use the `range` parameter to specify the value range of the slider.
/// The `step` parameter allows you to define incremental steps along the slider's path.
/// The `decimalPlaces` parameter can be used to manage the decimal places of the slider's value.
/// To format the bound value for display, use the `valueFormat` parameter.
/// The `leadingValueFormat` parameter customizes the leading value label, which displays the minimum value of the range.
/// Similarly, the `trailingValueFormat` parameter customizes the trailing value label, which displays the maximum value of the range.
/// Additionally, you can use the `showsValueLabel`, `showsLeadingAccessory`, and `showsTrailingAccessory` parameters to control the display of the related labels.
/// The `onValueChange` closure passed to the slider provides callbacks when the user drags the slider.
///
///  ```swift
///  @State private var speed: Double = 20
///
///  FioriSlider(
///      title: "Speed Limit",
///      value: $speed,
///      range: 10...200,
///      step: 2.5,
///      decimalPlaces: 1,
///      description: "Simple standard slider",
///      valueLabelFormat: "%.1f KM",
///      leadingLabelFormat: "%.1f KM",
///      trailingLabelFormat: "%.1f KM",
///      onValueChange: { isEditing, newSpeed in
///         if !isEditing {
///             print("The speed was changed to: " + String(format: "%.1f", value))
///         }
///      }
///  )
///  ```
/// The example above illustrates a standard slider with a range of `10` to `200` and a step increment of `2.5`.
/// Therefore, the slider's increments would be `10`, `12.5`, `15`, and so on.
/// At the same time, the minimum value of the range is formatted and displayed as `10.0 KM`.
/// Similarly, the maximum value of the range is formatted and displayed as `200.0 KM`.
/// The updated value can be received within the `onValueChange` closure callback when the user drags the slider.
///
/// The slider also uses the `step` to increase or decrease the value when a
/// VoiceOver user adjusts the slider with voice commands.
///
/// The `FioriSlider` supports a modifier called `accessibilityAdjustments`, which allows you to adjust the accessibility settings for a standard slider according to the Fiori Slider guidelines.
///
/// ### Range Slider:
///
/// A range slider consists of a title, a bound lower value, a bound upper value, and two "thumbs" (images that users can drag along a linear "track").
/// The track represents a continuum between two extremes: a minimum and a maximum value.
/// By default, the formatted lower value is displayed in a text field at the leading end of the slider, and the formatted upper value is displayed in a text field at the trailing end of the slider.
/// The title is displayed at the top left of the component. As users edit the lower or upper value in the text fields or move the thumbs, the slider continuously updates the bound values to reflect the thumbs’ positions.
///
/// A single editable range slider is also supported. In this case, only the formatted upper value is displayed in a text field at the trailing end of the slider.
///
/// The following example illustrates an editable range slider bound to the lower value `lowerValue` and the upper value `upperValue`.
/// The range slider uses the default range of `0` to `100`, with a default step of `1`.
/// By default, the lower value is displayed in a text field as the leading accessory view, while the upper value is shown in a text field as the trailing accessory view.
/// Both the lower thumb and upper thumb are clearly displayed on the slider track.
/// You can edit these values in the text fields to change the lower and upper values.
/// Alternatively, you can drag the lower thumb to adjust the lower value and drag the upper thumb to change the upper value.
/// The range slider does not display the value label at the top right of the slider by default.
///
///  ```swift
///  @State private var lowerValue: Double = 20
///  @State private var upperValue: Double = 40
///
///  FioriSlider(
///      title: "Editable Range Slider",
///      lowerValue: $lowerValue,
///      upperValue: $upperValue,
///      description: "Simple editable range slider"
///  )
///  ```
///
/// The following example illustrates a single editable range slider bound to the upper value `upperValue`.
/// The range slider uses the default range of `0` to `100`, with a default step of `1`.
/// By default, only the upper value is shown in a text field as the trailing accessory view and one thumb displayed on the slider track.
/// You can edit value in the text fields to change the upper values or drag the thumb to adjust the upper value.
/// The single range slider does not display the value label at the top right of the slider by default.
///
///  ```swift
///  @State private var upperValue: Double = 40
///
///  FioriSlider(
///      title: "Single Editable Range Slider",
///      upperValue: $upperValue,
///      description: "Simple Single Editable range slider"
///  )
///  ```
///
/// Similar with standard slider, the range slider also allow you use the `range` parameter to specify the value range of the slider.
/// The `step` parameter allows you to define incremental steps along the slider's path.
/// The `decimalPlaces` parameter can be used to manage the decimal places of the slider's value.
/// By default, the range slider does not display the value label.
/// However, you can specify what you want to display in the `valueLabel` parameter to show the value label at the top right of the slider.
/// The `showsLeadingAccessory` and `showsTrailingAccessory` parameters control the display of the leading accessory view and trailing accessory view, respectively.
/// By default, the editable range slider uses a text field as the leading or trailing accessory view.
/// However, you can specify your own view in the `leadingAccessory` or `trailingAccessory` parameters to override the default text field.
/// The `showsLeadingAccessory` and `showsTrailingAccessory` parameters can be used to control the display of the respective accessory views.
/// The `onRangeValueChange` closure passed to the slider provides callbacks when the user drags the slider.
/// The `onValueChange` closure passed to the single editable slider provides callbacks when the user drags the slider.
///
/// ```swift
///  @State private var lowerValue: Double = 20
///  @State private var upperValue: Double = 40
///
///  FioriSlider(
///      title: "Editable Range Slider",
///      lowerValue: $lowerValue,
///      upperValue: $upperValue,
///      range: 10...200,
///      step: 2.5,
///      decimalPlaces: 1,
///      description: "Simple editable range slider",
///      onRangeValueChange: { isEditing, lowerValue, upperValue in
///         if !isEditing {
///             print("Range Slider value was: " + String(format: "%.1f", lowerValue) + " - " + String(format: "%.1f", upperValue))
///         }
///      }
///  )
///  ```
///
/// The slider also uses the `step` to increase or decrease the value when a
/// VoiceOver user adjusts the slider with voice commands.
///
public struct FioriSlider {
    let title: any View
    let valueLabel: any View
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
    let icon: any View
    let description: any View
    let leadingAccessory: any View
    let trailingAccessory: any View
    /// Indicates whether the slider is a range slider or not. The default value is `true`, meaning that the slider is a range slider.
    let isRangeSlider: Bool
    /// This optional format is used to format the displayed slider value in the value label view. It is also utilized for formatting the accessibility value, if provided.
    let valueFormat: String?
    /// The optional formats are used to format the lower and upper bound values of the range. They are utilized for formatting the accessibility values when you customize the range slider with your own leading and trailing accessory views, if provided.
    let rangeFormat: (String, String)?
    /// This optional format is used to format the displayed minimal value of standard slider's range or lower value of range slider  in the leading accessory view. It is also utilized for formatting the accessibility value, if provided.
    let leadingValueFormat: String?
    /// This optional format is used to format the displayed maximal value of standard slider's range or upper value of range slider  in the trailing accessory view. It is also utilized for formatting the accessibility value, if provided.
    let trailingValueFormat: String?
    /// Indicates whether the value label is to be displayed or not. The default value is `true`
    let showsValueLabel: Bool
    /// Indicates whether the leading accessory view is to be displayed or not. The default value is `true`
    let showsLeadingAccessory: Bool
    /// Indicates whether the trailing accessory view is to be displayed or not. The default value is `true`
    let showsTrailingAccessory: Bool
    /// An optional callback function is triggered when the user begins to drag the thumb along the standard slider's track to adjust its value. The first boolean property indicates whether the editing process has begun or ended, with `false` signifying that the editing has concluded. The second double property represents the newly adjusted slider value.
    let onValueChange: ((Bool, Double) -> Void)?
    /// An optional callback function is triggered when the focus state of a text field, which serves as a leading or trailing accessory for an editable slider, changes. The boolean parameter of the callback indicates the focus state of the text field. This can be useful for obtaining the focus state when customizing the editable slider.
    let onEditFieldFocusStatusChange: ((Bool) -> Void)?

    @Environment(\.fioriSliderStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder valueLabel: () -> any View = { EmptyView() },
                @ViewBuilder lowerThumb: () -> any View,
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
                onRangeValueChange: ((Bool, Double, Double) -> Void)? = nil,
                @ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder leadingAccessory: () -> any View = { EmptyView() },
                @ViewBuilder trailingAccessory: () -> any View = { EmptyView() },
                isRangeSlider: Bool = true,
                valueFormat: String? = nil,
                rangeFormat: (String, String)? = nil,
                leadingValueFormat: String? = nil,
                trailingValueFormat: String? = nil,
                showsValueLabel: Bool = true,
                showsLeadingAccessory: Bool = true,
                showsTrailingAccessory: Bool = true,
                onValueChange: ((Bool, Double) -> Void)? = nil,
                onEditFieldFocusStatusChange: ((Bool) -> Void)? = nil)
    {
        self.title = Title(title: title)
        self.valueLabel = ValueLabel(valueLabel: valueLabel)
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
        self.icon = Icon(icon: icon)
        self.description = Description(description: description)
        self.leadingAccessory = LeadingAccessory(leadingAccessory: leadingAccessory)
        self.trailingAccessory = TrailingAccessory(trailingAccessory: trailingAccessory)
        self.isRangeSlider = isRangeSlider
        self.valueFormat = valueFormat
        self.rangeFormat = rangeFormat
        self.leadingValueFormat = leadingValueFormat
        self.trailingValueFormat = trailingValueFormat
        self.showsValueLabel = showsValueLabel
        self.showsLeadingAccessory = showsLeadingAccessory
        self.showsTrailingAccessory = showsTrailingAccessory
        self.onValueChange = onValueChange
        self.onEditFieldFocusStatusChange = onEditFieldFocusStatusChange
    }
}

public extension FioriSlider {
    init(title: AttributedString,
         valueLabel: AttributedString? = nil,
         lowerThumb: any Shape = Circle(),
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
         onRangeValueChange: ((Bool, Double, Double) -> Void)? = nil,
         icon: Image? = nil,
         description: AttributedString? = nil,
         @ViewBuilder leadingAccessory: () -> any View = { EmptyView() },
         @ViewBuilder trailingAccessory: () -> any View = { EmptyView() },
         isRangeSlider: Bool = true,
         valueFormat: String? = nil,
         rangeFormat: (String, String)? = nil,
         leadingValueFormat: String? = nil,
         trailingValueFormat: String? = nil,
         showsValueLabel: Bool = true,
         showsLeadingAccessory: Bool = true,
         showsTrailingAccessory: Bool = true,
         onValueChange: ((Bool, Double) -> Void)? = nil,
         onEditFieldFocusStatusChange: ((Bool) -> Void)? = nil)
    {
        self.init(title: { Text(title) }, valueLabel: { OptionalText(valueLabel) }, lowerThumb: { lowerThumb }, upperThumb: { upperThumb }, activeTrack: { activeTrack }, inactiveTrack: { inactiveTrack }, lowerValue: lowerValue, upperValue: upperValue, range: range, step: step, decimalPlaces: decimalPlaces, thumbHalfWidth: thumbHalfWidth, showsLowerThumb: showsLowerThumb, showsUpperThumb: showsUpperThumb, onRangeValueChange: onRangeValueChange, icon: { icon }, description: { OptionalText(description) }, leadingAccessory: leadingAccessory, trailingAccessory: trailingAccessory, isRangeSlider: isRangeSlider, valueFormat: valueFormat, rangeFormat: rangeFormat, leadingValueFormat: leadingValueFormat, trailingValueFormat: trailingValueFormat, showsValueLabel: showsValueLabel, showsLeadingAccessory: showsLeadingAccessory, showsTrailingAccessory: showsTrailingAccessory, onValueChange: onValueChange, onEditFieldFocusStatusChange: onEditFieldFocusStatusChange)
    }
}

public extension FioriSlider {
    init(_ configuration: FioriSliderConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FioriSliderConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.valueLabel = configuration.valueLabel
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
        self.icon = configuration.icon
        self.description = configuration.description
        self.leadingAccessory = configuration.leadingAccessory
        self.trailingAccessory = configuration.trailingAccessory
        self.isRangeSlider = configuration.isRangeSlider
        self.valueFormat = configuration.valueFormat
        self.rangeFormat = configuration.rangeFormat
        self.leadingValueFormat = configuration.leadingValueFormat
        self.trailingValueFormat = configuration.trailingValueFormat
        self.showsValueLabel = configuration.showsValueLabel
        self.showsLeadingAccessory = configuration.showsLeadingAccessory
        self.showsTrailingAccessory = configuration.showsTrailingAccessory
        self.onValueChange = configuration.onValueChange
        self.onEditFieldFocusStatusChange = configuration.onEditFieldFocusStatusChange
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension FioriSlider: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), valueLabel: .init(self.valueLabel), lowerThumb: .init(self.lowerThumb), upperThumb: .init(self.upperThumb), activeTrack: .init(self.activeTrack), inactiveTrack: .init(self.inactiveTrack), lowerValue: self.$lowerValue, upperValue: self.$upperValue, range: self.range, step: self.step, decimalPlaces: self.decimalPlaces, thumbHalfWidth: self.thumbHalfWidth, showsLowerThumb: self.showsLowerThumb, showsUpperThumb: self.showsUpperThumb, onRangeValueChange: self.onRangeValueChange, icon: .init(self.icon), description: .init(self.description), leadingAccessory: .init(self.leadingAccessory), trailingAccessory: .init(self.trailingAccessory), isRangeSlider: self.isRangeSlider, valueFormat: self.valueFormat, rangeFormat: self.rangeFormat, leadingValueFormat: self.leadingValueFormat, trailingValueFormat: self.trailingValueFormat, showsValueLabel: self.showsValueLabel, showsLeadingAccessory: self.showsLeadingAccessory, showsTrailingAccessory: self.showsTrailingAccessory, onValueChange: self.onValueChange, onEditFieldFocusStatusChange: self.onEditFieldFocusStatusChange)).typeErased
                .transformEnvironment(\.fioriSliderStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension FioriSlider {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        FioriSlider(.init(title: .init(self.title), valueLabel: .init(self.valueLabel), lowerThumb: .init(self.lowerThumb), upperThumb: .init(self.upperThumb), activeTrack: .init(self.activeTrack), inactiveTrack: .init(self.inactiveTrack), lowerValue: self.$lowerValue, upperValue: self.$upperValue, range: self.range, step: self.step, decimalPlaces: self.decimalPlaces, thumbHalfWidth: self.thumbHalfWidth, showsLowerThumb: self.showsLowerThumb, showsUpperThumb: self.showsUpperThumb, onRangeValueChange: self.onRangeValueChange, icon: .init(self.icon), description: .init(self.description), leadingAccessory: .init(self.leadingAccessory), trailingAccessory: .init(self.trailingAccessory), isRangeSlider: self.isRangeSlider, valueFormat: self.valueFormat, rangeFormat: self.rangeFormat, leadingValueFormat: self.leadingValueFormat, trailingValueFormat: self.trailingValueFormat, showsValueLabel: self.showsValueLabel, showsLeadingAccessory: self.showsLeadingAccessory, showsTrailingAccessory: self.showsTrailingAccessory, onValueChange: self.onValueChange, onEditFieldFocusStatusChange: self.onEditFieldFocusStatusChange))
            .shouldApplyDefaultStyle(false)
            .fioriSliderStyle(FioriSliderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
