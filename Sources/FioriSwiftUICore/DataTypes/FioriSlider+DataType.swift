//
//  Slider+DataType.swift
//  FioriSwiftUI
//
//  Created by i063052 on 2024/12/13.
//
import Combine
import FioriThemeManager
import SwiftUI

public extension FioriSlider {
    /// Create a standard slider
    ///
    /// A standard slider consists of a title, a selected value, and a "thumb" (an image that the user can drag along a linear "track").
    /// The track represents a continuum between two bounded values: a minimum and a maximum value.
    /// By default, the formatted minimum value is displayed at the leading side of the slider, and the formatted maximum value is displayed at the trailing side of the slider.
    ///
    /// The title is displayed at the top left of the component, while the bound value is displayed at the top right. As the user moves the thumb, the slider continuously updates its selected value corresponding to the thumb’s position.
    /// You also can customize the slider with customized value label, leading accessory view and trailing accessory view.
    ///
    /// - Parameters:
    ///   - title: The view used to display the title of the slider.
    ///   - value: The slider which allows the user to select a single value within a specified range (`range`).
    ///   - range: The range of the slider values. The default is `0...100`
    ///   - step: The distance between each valid value. The default is `1`.
    ///   - decimalPlaces: This property specifies the number of digits that should appear after the decimal point in the Double value for slider value. It controls the precision of the numerical representation by determining how many decimal places are displayed or used in calculations, rounding the Double accordingly. The default is `0`.
    ///   - icon: The icon image for hint text of the slider
    ///   - description: The hint text of the slider
    ///   - valueLabel: The customized view to override the default slider value label for the standard slider
    ///   - showsValueLabel: Indicates whether the value label is to be displayed or not. The default value is `true`
    ///   - valueFormat: This optional format is used to format the displayed slider value in the value label view. It is also utilized for formatting the accessibility value, if provided.
    ///   - leadingAccessory: The customized view to override the default leading accessory view which was a text label to display the minimum value of the range
    ///   - showsLeadingAccessory: Indicates whether the leading accessory view is to be displayed or not. The default value is `true`
    ///   - leadingValueFormat: This optional format is used to format the displayed minimal value of standard slider's range in the leading accessory view, if provided.
    ///   - trailingAccessory: The customized view to override the default trailing accessory view which is a text label to display the maximum value of the range
    ///   - showsTrailingAccessory: Indicates whether the trailing accessory view is to be displayed or not. The default value is `true`
    ///   - trailingValueFormat: This optional format is used to format the displayed maximal value of standard slider's range in the trailing accessory view. if provided.
    ///   - onValueChange: An optional callback function is triggered when the user begins to drag the thumb along the standard slider's track to adjust its value. The first boolean property indicates whether the editing process has begun or ended, with `false` signifying that the editing has concluded. The second double property represents the newly adjusted slider value.
    ///   - thumb: the Shape for  thumb of the standard Slider. By default, it is Circle.
    ///   - activeTrack: the shape for active track of the standard Slider. By default, it is capsule.
    ///   - inactiveTrack: the Shape for inactive track of the standard Slider. By default, it is Capsule.
    ///   - thumbHalfWidth: the half width of the thumb of the standard slider. In the context of a circular representation of the thumb, this value is used as the radius. It should be less than 22. The default value is `14`.
    ///
    init(@ViewBuilder title: () -> any View,
         value: Binding<Double>,
         range: ClosedRange<Double> = 0 ... 100,
         step: Double = 1,
         decimalPlaces: Int = 0,
         @ViewBuilder icon: () -> any View = { EmptyView() },
         @ViewBuilder description: () -> any View = { EmptyView() },
         @ViewBuilder valueLabel: () -> any View = { EmptyView() },
         showsValueLabel: Bool = true,
         valueFormat: String? = nil,
         @ViewBuilder leadingAccessory: () -> any View = { EmptyView() },
         showsLeadingAccessory: Bool = true,
         leadingValueFormat: String? = nil,
         @ViewBuilder trailingAccessory: () -> any View = { EmptyView() },
         showsTrailingAccessory: Bool = true,
         trailingValueFormat: String? = nil,
         onValueChange: ((Bool, Double) -> Void)? = nil,
         thumb: any Shape = Circle(),
         activeTrack: any Shape = Capsule(),
         inactiveTrack: any Shape = Capsule(),
         thumbHalfWidth: CGFloat = 14)
    {
        self.init(title: title,
                  valueLabel: valueLabel,
                  lowerThumb: { EmptyView() },
                  upperThumb: { thumb },
                  activeTrack: { activeTrack },
                  inactiveTrack: { inactiveTrack },
                  lowerValue: Binding<Double>(get: { range.lowerBound }, set: { _ in }),
                  upperValue: value,
                  range: range,
                  step: step,
                  decimalPlaces: decimalPlaces,
                  thumbHalfWidth: thumbHalfWidth,
                  showsLowerThumb: false,
                  showsUpperThumb: true,
                  icon: icon,
                  description: description,
                  leadingAccessory: leadingAccessory,
                  trailingAccessory: trailingAccessory,
                  isRangeSlider: false,
                  valueFormat: valueFormat,
                  leadingValueFormat: leadingValueFormat,
                  trailingValueFormat: trailingValueFormat,
                  showsValueLabel: showsValueLabel,
                  showsLeadingAccessory: showsLeadingAccessory,
                  showsTrailingAccessory: showsTrailingAccessory,
                  onValueChange: onValueChange)
    }
    
    /// Create a standard slider
    ///
    /// A standard slider consists of a title, a bound value, and a "thumb" (an image that users can drag along a linear "track").
    /// The track represents a continuum between two extremes: a minimum and a maximum value.
    /// By default, the formatted minimum value is displayed at the leading end of the slider, and the formatted maximum value is displayed at the trailing end of the slider.
    ///
    /// The title is displayed at the top left of the component, while the bound value is displayed at the top right. As users move the thumb, the slider continuously updates its bound value to reflect the thumb’s position.
    /// You also can customize the slider with customized value label, leading accessory view and trailing accessory view.
    ///
    /// - Parameters:
    ///   - title: The string used to display the title of the slider.
    ///   - value: The slider which allows the user to select a single value within a specified range (`range`).
    ///   - range: The range of the slider values. The default is `0...100`
    ///   - step: The distance between each valid value. The default is `1`.
    ///   - decimalPlaces: This property specifies the number of digits that should appear after the decimal point in the Double value for slider value. It controls the precision of the numerical representation by determining how many decimal places are displayed or used in calculations, rounding the Double accordingly. The default is `0`.
    ///   - icon: The icon image for hint text of the slider
    ///   - description: The hint text of the slider
    ///   - valueLabel: The customized string to override the default slider value label for the standard slider
    ///   - showsValueLabel: Indicates whether the value label is to be displayed or not. The default value is `true`
    ///   - valueFormat: This optional format is used to format the displayed slider value in the value label view. It is also utilized for formatting the accessibility value, if provided.
    ///   - leadingAccessory: The customized view to override the default leading accessory view which was a text label to display the minimum value of the range
    ///   - showsLeadingAccessory: Indicates whether the leading accessory view is to be displayed or not. The default value is `true`
    ///   - leadingValueFormat: This optional format is used to format the displayed minimal value of standard slider's range in the leading accessory view. if provided.
    ///   - trailingAccessory: The customized view to override the default trailing accessory view which was a text label to display the maximum value of the range
    ///   - showsTrailingAccessory: Indicates whether the trailing accessory view is to be displayed or not. The default value is `true`
    ///   - trailingValueFormat: This optional format is used to format the displayed maximal value of standard slider's range in the trailing accessory view. if provided.
    ///   - onValueChange: An optional callback function is triggered when the user begins to drag the thumb along the standard slider's track to adjust its value. The first boolean property indicates whether the editing process has begun or ended, with `false` signifying that the editing has concluded. The second double property represents the newly adjusted slider value.
    ///   - thumb: the Shape for  thumb of the standard Slider. By default, it is Circle.
    ///   - activeTrack: the Shape for active track of the standard Slider. By default, it is Capsule.
    ///   - inactiveTrack: the Shape for inactive track of the standard Slider. By default, it is Capsule.
    ///   - thumbHalfWidth: the half width of the thumb of the standard slider. In the context of a circular representation of the thumb, this value is used as the radius. It should be less than 22. The default value is `14`.
    ///
    init(title: AttributedString,
         value: Binding<Double>,
         range: ClosedRange<Double> = 0 ... 100,
         step: Double = 1,
         decimalPlaces: Int = 0,
         icon: Image? = nil,
         description: AttributedString? = nil,
         valueLabel: AttributedString? = nil,
         showsValueLabel: Bool = true,
         valueFormat: String? = nil,
         @ViewBuilder leadingAccessory: () -> any View = { EmptyView() },
         showsLeadingAccessory: Bool = true,
         leadingValueFormat: String? = nil,
         @ViewBuilder trailingAccessory: () -> any View = { EmptyView() },
         showsTrailingAccessory: Bool = true,
         trailingValueFormat: String? = nil,
         onValueChange: ((Bool, Double) -> Void)? = nil,
         wrapperBuiltInSlider: Bool = false,
         thumb: any Shape = Circle(),
         activeTrack: any Shape = Capsule(),
         inactiveTrack: any Shape = Capsule(),
         thumbHalfWidth: CGFloat = 14)
    {
        self.init(title: title,
                  valueLabel: valueLabel,
                  lowerThumb: Circle(),
                  upperThumb: thumb,
                  activeTrack: activeTrack,
                  inactiveTrack: inactiveTrack,
                  lowerValue: Binding<Double>(get: { range.lowerBound }, set: { _ in }),
                  upperValue: value,
                  range: range,
                  step: step,
                  decimalPlaces: decimalPlaces,
                  thumbHalfWidth: thumbHalfWidth,
                  showsLowerThumb: false,
                  showsUpperThumb: true,
                  icon: icon,
                  description: description,
                  leadingAccessory: leadingAccessory,
                  trailingAccessory: trailingAccessory,
                  isRangeSlider: false,
                  valueFormat: valueFormat,
                  leadingValueFormat: leadingValueFormat,
                  trailingValueFormat: trailingValueFormat,
                  showsValueLabel: showsValueLabel,
                  showsLeadingAccessory: showsLeadingAccessory,
                  showsTrailingAccessory: showsTrailingAccessory,
                  onValueChange: onValueChange)
    }
    
    /// Create a range slider
    ///
    /// A range slider consists of a title, a bound lower value, a bound upper value, and two "thumbs" (images that users can drag along a linear "track").
    /// The track represents a continuum between two extremes: a minimum and a maximum value.
    /// By default, the formatted lower value is displayed in a text field at the leading end of the slider, and the formatted upper value is displayed in a text field at the trailing end of the slider.
    /// The title is displayed at the top left of the component. As users edit the lower or upper value in the text fields or move the thumbs, the slider continuously updates the bound values to reflect the thumbs’ positions.
    /// You can also customize the slider with a customized value label, leading accessory view, and trailing accessory view.
    ///
    /// - Parameters:
    ///   - title: The view used to display the title of the slider.
    ///   - lowerValue: The lower value of range slider.
    ///   - upperValue: The upper value of range slider.
    ///   - range: The range of the slider values. The default is `0...100`
    ///   - step: The distance between each valid value. The default is `1`.
    ///   - decimalPlaces: This property specifies the number of digits that should appear after the decimal point in the Double value for slider value. It controls the precision of the numerical representation by determining how many decimal places are displayed or used in calculations, rounding the Double accordingly. The default is `0`.
    ///   - icon: The icon image for hint text of the slider
    ///   - description: The hint text of the slider
    ///   - valueLabel: The customized view for value label which display at the top right of the slider
    ///   - rangeFormat: The optional formats are used to format the lower and upper bound values of the range. They are utilized for formatting the accessibility values when you customize the range slider with your own leading and trailing accessory views, if provided.
    ///   - leadingAccessory: The customized view to override the default leading accessory view which was a text field to display the lower value
    ///   - showsLeadingAccessory: Indicates whether the leading accessory view is to be displayed or not. The default value is `true`
    ///   - leadingValueFormat: This optional format is used to format the displayed lower value of range slider in the leading accessory view. if provided.
    ///   - trailingAccessory: The customized view to override the default trailing accessory view which was a text field to display the upper value
    ///   - showsTrailingAccessory: Indicates whether the trailing accessory view is to be displayed or not. The default value is `true`
    ///   - trailingValueFormat: This optional format is used to format the displayed upper value of range slider in the leading accessory view. if provided.
    ///   - onRangeValueChange: An optional callback function that is triggered when the user begins to drag either the lower or upper thumb along the range slider's track to adjust the slider's values. The first boolean parameter indicates whether the editing has begun or ended, with `false` signifying that the editing has ended. The second parameter is a double that represents the updated lower value, while the third parameter (also a double) represents the updated upper value.
    ///   - lowerThumb: the Shape for lower thumb of the range Slider. By default, it is Circle.
    ///   - upperThumb: the Shape for upper thumb of the range Slider. By default, it is Circle.
    ///   - activeTrack: the Shape for active track of the range Slider. By default, it is Capsule.
    ///   - inactiveTrack: the Shape for inactive track of the range Slider. By default, it is Capsule.
    ///   - thumbHalfWidth: the half width of the thumb of the range slider. In the context of a circular representation of the thumb, this value is used as the radius. It should be less than 22. The default value is `14`.
    ///   - onEditFieldFocusStatusChange: An optional callback function is triggered when the focus state of a text field, which serves as a leading or trailing accessory for an editable slider, changes. The boolean parameter of the callback indicates the focus state of the text field. This can be useful for obtaining the focus state when customizing the editable slider.
    ///
    init(@ViewBuilder title: () -> any View,
         lowerValue: Binding<Double>,
         upperValue: Binding<Double>,
         range: ClosedRange<Double> = 0 ... 100,
         step: Double = 1,
         decimalPlaces: Int = 0,
         @ViewBuilder icon: () -> any View = { EmptyView() },
         @ViewBuilder description: () -> any View = { EmptyView() },
         @ViewBuilder valueLabel: () -> any View = { EmptyView() },
         rangeFormat: (String, String)? = nil,
         @ViewBuilder leadingAccessory: () -> any View = { EmptyView() },
         showsLeadingAccessory: Bool = true,
         leadingValueFormat: String? = nil,
         @ViewBuilder trailingAccessory: () -> any View = { EmptyView() },
         showsTrailingAccessory: Bool = true,
         trailingValueFormat: String? = nil,
         onRangeValueChange: ((Bool, Double, Double) -> Void)? = nil,
         lowerThumb: any Shape = Circle(),
         upperThumb: any Shape = Circle(),
         activeTrack: any Shape = Capsule(),
         inactiveTrack: any Shape = Capsule(),
         thumbHalfWidth: CGFloat = 14,
         onEditFieldFocusStatusChange: ((Bool) -> Void)? = nil)
    {
        self.init(title: title,
                  valueLabel: valueLabel,
                  lowerThumb: { lowerThumb },
                  upperThumb: { upperThumb },
                  activeTrack: { activeTrack },
                  inactiveTrack: { inactiveTrack },
                  lowerValue: lowerValue,
                  upperValue: upperValue,
                  range: range,
                  step: step,
                  decimalPlaces: decimalPlaces,
                  thumbHalfWidth: thumbHalfWidth,
                  showsLowerThumb: showsLeadingAccessory,
                  showsUpperThumb: showsTrailingAccessory,
                  onRangeValueChange: onRangeValueChange,
                  icon: icon,
                  description: description,
                  leadingAccessory: leadingAccessory,
                  trailingAccessory: trailingAccessory,
                  isRangeSlider: true,
                  rangeFormat: rangeFormat,
                  leadingValueFormat: leadingValueFormat,
                  trailingValueFormat: trailingValueFormat,
                  showsValueLabel: true, // Always set it as true and only show custom valueLabel
                  showsLeadingAccessory: showsLeadingAccessory,
                  showsTrailingAccessory: showsTrailingAccessory,
                  onEditFieldFocusStatusChange: onEditFieldFocusStatusChange)
    }
    
    /// Create a range slider
    ///
    /// A range slider consists of a title, a bound lower value, a bound upper value, and two "thumbs" (images that users can drag along a linear "track").
    /// The track represents a continuum between two extremes: a minimum and a maximum value.
    /// By default, the formatted lower value is displayed in a text field at the leading end of the slider, and the formatted upper value is displayed in a text field at the trailing end of the slider.
    /// The title is displayed at the top left of the component. As users edit the lower or upper value in the text fields or move the thumbs, the slider continuously updates the bound values to reflect the thumbs’ positions.
    /// You can also customize the slider with a customized value label, leading accessory view, and trailing accessory view.
    ///
    /// - Parameters:
    ///   - title: The string used to display the title of the slider.
    ///   - lowerValue: The lower value of range slider.
    ///   - upperValue: The upper value of range slider.
    ///   - range: The range of the slider values. The default is `0...100`
    ///   - step: The distance between each valid value. The default is `1`.
    ///   - decimalPlaces: This property specifies the number of digits that should appear after the decimal point in the Double value for slider value. It controls the precision of the numerical representation by determining how many decimal places are displayed or used in calculations, rounding the Double accordingly. The default is `0`.
    ///   - icon: The icon image for hint text of the slider
    ///   - description: The hint text of the slider
    ///   - valueLabel: The optional customized string for value label which display at the top right of the slider
    ///   - rangeFormat: The optional formats are used to format the lower and upper bound values of the range. They are utilized for formatting the accessibility values when you customize the range slider with your own leading and trailing accessory views, if provided.
    ///   - leadingAccessory: The customized view to override the default leading accessory view which was a text field to display the lower value
    ///   - showsLeadingAccessory: Indicates whether the leading accessory view is to be displayed or not. The default value is `true`
    ///   - leadingValueFormat: This optional format is used to format the displayed lower value of range slider in the leading accessory view. if provided.
    ///   - trailingAccessory: The customized view to override the default trailing accessory view which was a text field to display the upper value
    ///   - showsTrailingAccessory: Indicates whether the trailing accessory view is to be displayed or not. The default value is `true`
    ///   - trailingValueFormat: This optional format is used to format the displayed upper value of range slider in the leading accessory view. if provided.
    ///   - onRangeValueChange: An optional callback function that is triggered when the user begins to drag either the lower or upper thumb along the range slider's track to adjust the slider's values. The first boolean parameter indicates whether the editing has begun or ended, with `false` signifying that the editing has ended. The second parameter is a double that represents the updated lower value, while the third parameter (also a double) represents the updated upper value.
    ///   - lowerThumb: the Shape for lower thumb of the range Slider. By default, it is Circle.
    ///   - upperThumb: the Shape for upper thumb of the range Slider. By default, it is Circle.
    ///   - activeTrack: the Shape for active track of the range Slider. By default, it is Capsule.
    ///   - inactiveTrack: the Shape for inactive track of the range Slider. By default, it is Capsule.
    ///   - thumbHalfWidth: the half width of the thumb of the range slider. In the context of a circular representation of the thumb, this value is used as the radius. It should be less than 22. The default value is `14`.
    ///   - onEditFieldFocusStatusChange: An optional callback function is triggered when the focus state of a text field, which serves as a leading or trailing accessory for an editable slider, changes. The boolean parameter of the callback indicates the focus state of the text field. This can be useful for obtaining the focus state when customizing the editable slider.
    ///
    init(title: AttributedString,
         lowerValue: Binding<Double>,
         upperValue: Binding<Double>,
         range: ClosedRange<Double> = 0 ... 100,
         step: Double = 1,
         decimalPlaces: Int = 0,
         icon: Image? = nil,
         description: AttributedString? = nil,
         valueLabel: AttributedString? = nil,
         rangeFormat: (String, String)? = nil,
         @ViewBuilder leadingAccessory: () -> any View = { EmptyView() },
         showsLeadingAccessory: Bool = true,
         leadingValueFormat: String? = nil,
         @ViewBuilder trailingAccessory: () -> any View = { EmptyView() },
         showsTrailingAccessory: Bool = true,
         trailingValueFormat: String? = nil,
         onRangeValueChange: ((Bool, Double, Double) -> Void)? = nil,
         lowerThumb: any Shape = Circle(),
         upperThumb: any Shape = Circle(),
         activeTrack: any Shape = Capsule(),
         inactiveTrack: any Shape = Capsule(),
         thumbHalfWidth: CGFloat = 14,
         onEditFieldFocusStatusChange: ((Bool) -> Void)? = nil)
    {
        self.init(title: title,
                  valueLabel: valueLabel,
                  lowerThumb: lowerThumb,
                  upperThumb: upperThumb,
                  activeTrack: activeTrack,
                  inactiveTrack: inactiveTrack,
                  lowerValue: lowerValue,
                  upperValue: upperValue,
                  range: range,
                  step: step,
                  decimalPlaces: decimalPlaces,
                  thumbHalfWidth: thumbHalfWidth,
                  showsLowerThumb: showsLeadingAccessory,
                  showsUpperThumb: showsTrailingAccessory,
                  onRangeValueChange: onRangeValueChange,
                  icon: icon,
                  description: description,
                  leadingAccessory: leadingAccessory,
                  trailingAccessory: trailingAccessory,
                  isRangeSlider: true,
                  rangeFormat: rangeFormat,
                  leadingValueFormat: leadingValueFormat,
                  trailingValueFormat: trailingValueFormat,
                  showsValueLabel: true, // Always set it as true and only show custom valueLabel. if provided.
                  showsLeadingAccessory: showsLeadingAccessory,
                  showsTrailingAccessory: showsTrailingAccessory,
                  onEditFieldFocusStatusChange: onEditFieldFocusStatusChange)
    }
    
    /// Create a single editable range slider
    ///
    /// A range slider consists of a title, a bound upper value, and a "thumb" (images that users can drag along a linear "track").
    /// The track represents a continuum between two extremes: a minimum and a maximum value.
    /// By default, the formatted upper value is displayed in a text field at the trailing end of the slider.
    /// The title is displayed at the top left of the component. As users edit the upper value in the text fields or move the thumb, the slider continuously updates the bound values to reflect the thumbs’ positions.
    ///
    /// - Parameters:
    ///   - title: The view used to display the title of the slider.
    ///   - upperValue: The value of single editable slider.
    ///   - range: The range of the slider values. The default is `0...100`
    ///   - step: The distance between each valid value. The default is `1`.
    ///   - decimalPlaces: This property specifies the number of digits that should appear after the decimal point in the Double value for slider value. It controls the precision of the numerical representation by determining how many decimal places are displayed or used in calculations, rounding the Double accordingly. The default is `0`.
    ///   - icon: The icon image for hint text of the slider
    ///   - description: The hint text of the slider
    ///   - valueLabel: The optional customized value for value label which display at the top right of the slider
    ///   - rangeFormat: The optional formats are used to format the lower and upper bound values of the range. They are utilized for formatting the accessibility values when you customize the range slider with your own leading and trailing accessory views, if provided.
    ///   - onValueChange: An optional callback function is triggered when the user drag the thumb to change bound value or finish edit in text field. The first boolean property indicates whether the editing process has begun or ended, with `false` signifying that the editing has concluded. The second double property represents the newly adjusted slider value.
    ///   - upperThumb: the Shape for upper thumb of the range Slider. By default, it is Circle.
    ///   - activeTrack: the Shape for active track of the range Slider. By default, it is Capsule.
    ///   - inactiveTrack: the Shape for inactive track of the range Slider. By default, it is Capsule.
    ///   - thumbHalfWidth: the half width of the thumb of the range slider. In the context of a circular representation of the thumb, this value is used as the radius. It should be less than 22. The default value is `14`.
    ///   - onEditFieldFocusStatusChange: An optional callback function is triggered when the focus state of a text field, which serves as trailing accessory for an editable slider, changes. The boolean parameter of the callback indicates the focus state of the text field. This can be useful for obtaining the focus state when customizing the editable slider.
    ///
    init(@ViewBuilder title: () -> any View,
         upperValue: Binding<Double>,
         range: ClosedRange<Double> = 0 ... 100,
         step: Double = 1,
         decimalPlaces: Int = 0,
         @ViewBuilder icon: () -> any View = { EmptyView() },
         @ViewBuilder description: () -> any View = { EmptyView() },
         @ViewBuilder valueLabel: () -> any View = { EmptyView() },
         rangeFormat: (String, String)? = nil,
         onValueChange: ((Bool, Double) -> Void)? = nil,
         upperThumb: any Shape = Circle(),
         activeTrack: any Shape = Capsule(),
         inactiveTrack: any Shape = Capsule(),
         thumbHalfWidth: CGFloat = 14,
         onEditFieldFocusStatusChange: ((Bool) -> Void)? = nil)
    {
        self.init(title: title,
                  valueLabel: valueLabel,
                  lowerThumb: { upperThumb },
                  upperThumb: { upperThumb },
                  activeTrack: { activeTrack },
                  inactiveTrack: { inactiveTrack },
                  lowerValue: Binding<Double>(get: { range.lowerBound }, set: { _ in }),
                  upperValue: upperValue,
                  range: range,
                  step: step,
                  decimalPlaces: decimalPlaces,
                  thumbHalfWidth: thumbHalfWidth,
                  showsLowerThumb: false,
                  showsUpperThumb: true,
                  icon: icon,
                  description: description,
                  isRangeSlider: true,
                  rangeFormat: rangeFormat,
                  showsValueLabel: true, // Always set it as true and only show custom valueLabel
                  showsLeadingAccessory: false,
                  showsTrailingAccessory: true,
                  onValueChange: onValueChange,
                  onEditFieldFocusStatusChange: onEditFieldFocusStatusChange)
    }
    
    /// Create a single editable range slider
    ///
    /// A range slider consists of a title, a bound upper value, and a "thumb" (images that users can drag along a linear "track").
    /// The track represents a continuum between two extremes: a minimum and a maximum value.
    /// By default, the formatted upper value is displayed in a text field at the trailing end of the slider.
    /// The title is displayed at the top left of the component. As users edit the upper value in the text fields or move the thumb, the slider continuously updates the bound values to reflect the thumbs’ positions.
    ///
    /// - Parameters:
    ///   - title: The string used to display the title of the slider.
    ///   - upperValue: The value of single editable slider.
    ///   - range: The range of the slider values. The default is `0...100`
    ///   - step: The distance between each valid value. The default is `1`.
    ///   - decimalPlaces: This property specifies the number of digits that should appear after the decimal point in the Double value for slider value. It controls the precision of the numerical representation by determining how many decimal places are displayed or used in calculations, rounding the Double accordingly. The default is `0`.
    ///   - icon: The icon image for hint text of the slider
    ///   - description: The hint text of the slider
    ///   - valueLabel: The optional customized value for value label which display at the top right of the slider
    ///   - rangeFormat: The optional formats are used to format the lower and upper bound values of the range. They are utilized for formatting the accessibility values when you customize the range slider with your own leading and trailing accessory views, if provided.
    ///   - - onValueChange: An optional callback function is triggered when the user drag the thumb to change bound value or finish edit in text field. The first boolean property indicates whether the editing process has begun or ended, with `false` signifying that the editing has concluded. The second double property represents the newly adjusted slider value.
    ///   - upperThumb: the Shape for upper thumb of the range Slider. By default, it is Circle.
    ///   - activeTrack: the Shape for active track of the range Slider. By default, it is Capsule.
    ///   - inactiveTrack: the Shape for inactive track of the range Slider. By default, it is Capsule.
    ///   - thumbHalfWidth: the half width of the thumb of the range slider. In the context of a circular representation of the thumb, this value is used as the radius. It should be less than 22. The default value is `14`.
    ///   - onEditFieldFocusStatusChange: An optional callback function is triggered when the focus state of a text field, which serves as trailing accessory for an editable slider, changes. The boolean parameter of the callback indicates the focus state of the text field. This can be useful for obtaining the focus state when customizing the editable slider.
    ///
    init(title: AttributedString,
         upperValue: Binding<Double>,
         range: ClosedRange<Double> = 0 ... 100,
         step: Double = 1,
         decimalPlaces: Int = 0,
         icon: Image? = nil,
         description: AttributedString? = nil,
         valueLabel: AttributedString? = nil,
         rangeFormat: (String, String)? = nil,
         onValueChange: ((Bool, Double) -> Void)? = nil,
         upperThumb: any Shape = Circle(),
         activeTrack: any Shape = Capsule(),
         inactiveTrack: any Shape = Capsule(),
         thumbHalfWidth: CGFloat = 14,
         onEditFieldFocusStatusChange: ((Bool) -> Void)? = nil)
    {
        self.init(title: title,
                  valueLabel: valueLabel,
                  lowerThumb: upperThumb,
                  upperThumb: upperThumb,
                  activeTrack: activeTrack,
                  inactiveTrack: inactiveTrack,
                  lowerValue: Binding<Double>(get: { range.lowerBound }, set: { _ in }),
                  upperValue: upperValue,
                  range: range,
                  step: step,
                  decimalPlaces: decimalPlaces,
                  thumbHalfWidth: thumbHalfWidth,
                  showsLowerThumb: false,
                  showsUpperThumb: true,
                  icon: icon,
                  description: description,
                  isRangeSlider: true,
                  rangeFormat: rangeFormat,
                  showsValueLabel: true, // Always set it as true and only show custom valueLabel
                  showsLeadingAccessory: false,
                  showsTrailingAccessory: true,
                  onValueChange: onValueChange,
                  onEditFieldFocusStatusChange: onEditFieldFocusStatusChange)
    }
}

struct NumbersOnlyTextField: View {
    let configuration: FioriSliderConfiguration
    var isLeadingAccessory: Bool = false
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.sliderRowSize) private var sliderRowSize
    @Environment(\.leadingTextFieldStyle) private var leadingTextFieldStyle
    @Environment(\.trailingTextFieldStyle) private var trailingTextFieldStyle
    @Environment(\.roundValueFormat) private var roundValueFormat
    @EnvironmentObject private var stateObject: SliderStateObject
    @EnvironmentObject private var modelObject: SliderModelObject
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        let textSize = self.estimateTextSize() // estimate the size of the displayed text and set it as the text field's size to make sure the size can be changed according the editing value.
        let borderColor = self.isLeadingAccessory ? self.leadingTextFieldStyle.borderColor : self.trailingTextFieldStyle.borderColor
        let focusedBorderColor = self.isLeadingAccessory ? self.leadingTextFieldStyle.focusedBorderColor : self.trailingTextFieldStyle.focusedBorderColor
        let disabledBorderColor = self.isLeadingAccessory ? self.leadingTextFieldStyle.disabledBorderColor : self.trailingTextFieldStyle.disabledBorderColor
        let borderWidth = self.isLeadingAccessory ? self.leadingTextFieldStyle.borderWidth : self.trailingTextFieldStyle.borderWidth
        let focusedBorderWidth = self.isLeadingAccessory ? self.leadingTextFieldStyle.focusedBorderWidth : self.trailingTextFieldStyle.focusedBorderWidth
        TextField(
            "",
            text: self.isLeadingAccessory ? self.$modelObject.leadingText : self.$modelObject.trailingText
        )
        .numbersOnly(self.isLeadingAccessory ? self.$modelObject.leadingText : self.$modelObject.trailingText, decimalPlace: self.configuration.decimalPlaces, onValueChange: { value in
            self.isLeadingAccessory ? (self.stateObject.editingLeadingValue = value) : (self.stateObject.editingTrailingValue = value)
            // To store the current editing value in state object and it will be used when editing done.
        }) // To use $modelObject.leadingText or trailingText and let NumbersOnlyViewModifier can parse and check the editing value.
        .disableAutocorrection(true)
        .autocapitalization(.none)
        .multilineTextAlignment(.center)
        .frame(width: textSize.width, height: textSize.height) // Don't use minWidth, maxWidth here to avoid the text field re-render un-expected and let the editing value refreshed.
        .cornerRadius(self.isLeadingAccessory ? self.leadingTextFieldStyle.cornerRadius : self.trailingTextFieldStyle.cornerRadius)
        .focused(self.$isTextFieldFocused)
        .onChange(of: self.isTextFieldFocused) {
            self.stateObject.isFocused = self.isTextFieldFocused
            if !self.isTextFieldFocused { // Update the slider value and notify consumer when text field lost focus
                if let editingValue = isLeadingAccessory ? self.stateObject.editingLeadingValue : self.stateObject.editingTrailingValue, let newValue = Double(editingValue) {
                    self.isLeadingAccessory ? (self.stateObject.editingLeadingValue = nil) : (self.stateObject.editingTrailingValue = nil) // always clear the temporarily stored editing value
                    
                    let valueChanged = self.isLeadingAccessory && newValue != self.configuration.lowerValue || !self.isLeadingAccessory && newValue != self.configuration.upperValue
                    
                    guard valueChanged else { // Make sure to notify consumer only when the value was changed
                        return
                    }
                   
                    self.isLeadingAccessory ? (self.configuration.lowerValue = newValue) : (self.configuration.upperValue = newValue)
                    if let onRangeValueChange = configuration.onRangeValueChange, configuration.showsLowerThumb, configuration.showsUpperThumb {
                        onRangeValueChange(false, self.configuration.lowerValue, self.configuration.upperValue)
                    } else if let onValueChange = configuration.onValueChange, configuration.showsLowerThumb != configuration.showsUpperThumb {
                        onValueChange(false, newValue)
                    }
                }
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            if let onChange = self.configuration.onEditFieldFocusStatusChange {
                onChange(self.isTextFieldFocused)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: self.isLeadingAccessory ? self.leadingTextFieldStyle.cornerRadius : self.trailingTextFieldStyle.cornerRadius)
                .strokeBorder(self.isEnabled ? ((self.isTextFieldFocused && self.isLeadingAccessory || self.isTextFieldFocused && !self.isLeadingAccessory) ? focusedBorderColor : borderColor) : disabledBorderColor, lineWidth: (self.isTextFieldFocused && self.isLeadingAccessory || self.isTextFieldFocused && !self.isLeadingAccessory) ? focusedBorderWidth : borderWidth)
        )
        .font(self.isLeadingAccessory ? self.leadingTextFieldStyle.font : self.trailingTextFieldStyle.font)
        .foregroundStyle(self.isEnabled ? (self.isLeadingAccessory ? self.leadingTextFieldStyle.foregroundColor : self.trailingTextFieldStyle.foregroundColor) : (self.isLeadingAccessory ? self.leadingTextFieldStyle.disabledForegroundColor : self.trailingTextFieldStyle.disabledForegroundColor))
    }
}

extension TextField {
    func numbersOnly(_ text: Binding<String>, decimalPlace: Int = 0, onValueChange: ((String) -> Void)? = nil) -> some View {
        self.modifier(NumbersOnlyViewModifier(text: text, decimalPlace: decimalPlace, onValueChange: onValueChange))
    }
}

extension NumbersOnlyTextField {
    func estimateTextSize() -> CGSize { // Just estimate the size for display text.
        let text = self.isLeadingAccessory ? self.modelObject.leadingText : self.modelObject.trailingText
        let characterSize = self.midSizeNumberCharacters(withFont: self.isLeadingAccessory ? self.leadingTextFieldStyle.font : self.trailingTextFieldStyle.font)
        let count = self.configuration.decimalPlaces == 0 ? text.count : (text.count - 1)
        let height = max(characterSize.height + 16, 44)
        let width = min(max(characterSize.width * CGFloat(count) + 32, 51), self.sliderRowSize.width / 3) // The min width was 51 and max width was 1/3 of row width
        return CGSize(width: width, height: height)
    }
    
    func midSizeNumberCharacters(withFont: Font) -> CGSize { // estimate the middle size for possible characters
        var sizes: [CGSize] = []
        let attributes = [NSAttributedString.Key.font: self.fontFrom(font: withFont)]
        for digit in "0123456789" {
            let size = String(digit).size(withAttributes: attributes)
            sizes.append(size)
        }
        sizes.sort { $0.width < $1.width } // Sort sizes by width (or any other criteria, such as height if needed)
        if sizes.count % 2 == 1 { // Return the middle element if there's an odd number of sizes
            return sizes[sizes.count / 2]
        } else { // Return the average of the two middle elements if there's an even number of sizes
            let midIndex = sizes.count / 2
            let size1 = sizes[midIndex - 1]
            let size2 = sizes[midIndex]
            let averageWidth = (size1.width + size2.width) / 2
            let averageHeight = (size1.height + size2.height) / 2
            return CGSize(width: averageWidth, height: averageHeight)
        }
    }
    
    func fontFrom(font: Font) -> UIFont {
        switch font {
        case .largeTitle:
            return UIFont.preferredFont(forTextStyle: .largeTitle)
        case .title:
            return UIFont.preferredFont(forTextStyle: .title1)
        case .title2:
            return UIFont.preferredFont(forTextStyle: .title2)
        case .title3:
            return UIFont.preferredFont(forTextStyle: .title3)
        case .headline:
            return UIFont.preferredFont(forTextStyle: .headline)
        case .subheadline:
            return UIFont.preferredFont(forTextStyle: .subheadline)
        case .body:
            return UIFont.preferredFont(forTextStyle: .body)
        case .callout:
            return UIFont.preferredFont(forTextStyle: .callout)
        case .footnote:
            return UIFont.preferredFont(forTextStyle: .footnote)
        case .caption:
            return UIFont.preferredFont(forTextStyle: .caption1)
        case .caption2:
            return UIFont.preferredFont(forTextStyle: .caption2)
        default:
            return UIFont.preferredFont(forTextStyle: .body)
        }
    }
}

struct NumbersOnlyViewModifier: ViewModifier {
    @EnvironmentObject private var stateObject: SliderStateObject
    @Binding var text: String
    var decimalPlace: Int
    var onValueChange: ((String) -> Void)?
    
    func body(content: Content) -> some View {
        content.keyboardType(self.decimalPlace > 0 ? .decimalPad : .numberPad)
            .onReceive(Just(self.text)) { newValue in
                var numbers = "0123456789"
                let decimalSeparator = Locale.current.decimalSeparator ?? "."
                if self.decimalPlace > 0 {
                    numbers += decimalSeparator
                }
                if newValue.components(separatedBy: decimalSeparator).count - 1 > 1 { // Always make sure the editing string value only has one decimalSeparator
                    let filtered = newValue
                    self.text = String(filtered.dropLast())
                } else {
                    var filtered = newValue.filter { numbers.contains($0) }
                    let components = filtered.split(separator: decimalSeparator)
                    if components.count == 2, components[1].count > self.decimalPlace { // make sure the edited values match the decimal places exactly.
                        filtered = String(filtered.prefix(components[0].count + 1 + self.decimalPlace))
                    }
                    if filtered != newValue {
                        self.text = filtered
                    }
                }
                if let onValueChange = self.onValueChange {
                    onValueChange(self.text)
                }
            }
    }
}

struct FioriTextFieldStylesModifier: ViewModifier { // To change the appearance of the Range Slider text field
    var leadingStyle: FioriSliderTextFieldStyle?
    var trailingStyle: FioriSliderTextFieldStyle?
    
    func body(content: Content) -> some View {
        guard let leadingStyle = self.leadingStyle, let trailingStyle = self.trailingStyle else {
            if let style = self.leadingStyle {
                return AnyView(content
                    .environment(\.leadingTextFieldStyle, style))
            } else if let style = self.trailingStyle {
                return AnyView(content
                    .environment(\.trailingTextFieldStyle, style))
            } else {
                return AnyView(content)
            }
        }
        
        return AnyView(content.environment(\.leadingTextFieldStyle, leadingStyle)
            .environment(\.trailingTextFieldStyle, trailingStyle))
    }
}

struct SliderLeadingTextFieldStyleKey: EnvironmentKey {
    static let defaultValue: FioriSliderTextFieldStyle = .leading
}

struct SliderTrailingTextFieldStyleKey: EnvironmentKey {
    static let defaultValue: FioriSliderTextFieldStyle = .trailing
}

extension EnvironmentValues {
    var leadingTextFieldStyle: FioriSliderTextFieldStyle {
        get { self[SliderLeadingTextFieldStyleKey.self] }
        set { self[SliderLeadingTextFieldStyleKey.self] = newValue }
    }

    var trailingTextFieldStyle: FioriSliderTextFieldStyle {
        get { self[SliderTrailingTextFieldStyleKey.self] }
        set { self[SliderTrailingTextFieldStyleKey.self] = newValue }
    }
}
