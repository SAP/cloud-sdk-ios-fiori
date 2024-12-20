import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.

 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct FioriSliderBaseStyle: FioriSliderStyle {
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.sizeCategory) private var sizeCategory
    
    public func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
        VStack {
            if !configuration.title.isEmpty || configuration.showsValueLabel {
                if configuration.isLargeSizeCategory(self.sizeCategory) {
                    VStack {
                        configuration.title
                        
                        if configuration.showsValueLabel {
                            Spacer().frame(height: configuration.title.isEmpty ? 0 : 4)
                            configuration.valueLabel
                        }
                    }
                } else {
                    HStack {
                        configuration.title
                        
                        if configuration.showsValueLabel {
                            Spacer().frame(width: configuration.title.isEmpty ? 0 : 16)
                            configuration.valueLabel
                        }
                    }
                }
                
                Spacer()
                    .frame(height: configuration.isRangeSlider ? 4 : 24)
            }
            
            if self.sizeCategory == .accessibilityExtraExtraExtraLarge, configuration.leadingAccessory.isEmpty, configuration.trailingAccessory.isEmpty, configuration.isRangeSlider { // only for editable range slider
                VStack {
                    if configuration.showsLeadingAccessory || configuration.showsTrailingAccessory {
                        HStack {
                            if configuration.showsLeadingAccessory {
                                configuration.leadingAccessory
                            }
                            if configuration.showsTrailingAccessory {
                                Spacer()
                                configuration.trailingAccessory
                            }
                        }
                        
                        Spacer().frame(height: 4)
                    }
                    
                    RangeSliderControl(configuration.getRangeSliderControlConfiguration())
                        .disabled(!self.isEnabled)
                }
                .accessibilityElement(children: .contain)
            } else {
                HStack {
                    if configuration.showsLeadingAccessory {
                        configuration.leadingAccessory
                        Spacer().frame(width: 8)
                    }
                    
                    RangeSliderControl(configuration.getRangeSliderControlConfiguration())
                        .disabled(!self.isEnabled)
                    
                    if configuration.showsTrailingAccessory {
                        Spacer().frame(width: 8)
                        configuration.trailingAccessory
                    }
                }
                .accessibilityElement(children: .contain)
            }
            
            if !configuration._informationView.isEmpty {
                Spacer()
                    .frame(height: 4)
                configuration._informationView
            }
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        .clearFioriSliderEditableAccessoryFocusOnTap()
    }
}

// Default fiori styles
extension FioriSliderFioriStyle {
    struct ContentFioriStyle: FioriSliderStyle {
        @StateObject private var stateObject = SliderStateObject()
        @State private var sliderRowSize: CGSize = .zero
        @Environment(\.isEnabled) var isEnabled
        
        func makeBody(_ configuration: FioriSliderConfiguration) -> some View {
            let slider = FioriSlider(configuration)
                .overlay(
                    GeometryReader { geometry -> Color in
                        DispatchQueue.main.async {
                            self.sliderRowSize = geometry.size
                        }
                        return Color.clear
                    }
                )
                .background(Color.preferredColor(.secondaryGroupedBackground))
                .environmentObject(self.stateObject)
                .environmentObject(SliderModelObject(configuration: configuration, roundValueFormat: "%.\(configuration.decimalPlaces)f"))
                .environment(\.roundValueFormat, "%.\(configuration.decimalPlaces)f")
                .environment(\.sliderRowSize, self.sliderRowSize)
                .accessibilityElement(children: configuration.isRangeSlider ? .contain : .combine) // To combine all accessibility label for all children for non-range slider
            
            if self.isEnabled, !configuration.isRangeSlider {
                // Let the standard slider adjustable in enabled state by default.
                return AnyView(slider.accessibilityAdjustableAction { direction in
                    configuration.getRangeSliderControlConfiguration().adjustThumbAccessibilityAction(direction: direction)
                })
            } else {
                return AnyView(slider)
            }
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let fioriSliderConfiguration: FioriSliderConfiguration
        @Environment(\.isEnabled) var isEnabled
        @Environment(\.layoutDirection) var layoutDirection
        @Environment(\.trailingTextFieldStyle) var trailingTextFieldStyle
        @EnvironmentObject private var stateObject: SliderStateObject
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.fiori(forTextStyle: .subheadline))
                .fontWeight(.semibold)
                .foregroundStyle(self.isEnabled ? (self.stateObject.isFocused ? self.trailingTextFieldStyle.focusedBorderColor : Color.preferredColor(.primaryLabel)) : Color.preferredColor(.quaternaryLabel))
                .accessibilitySortPriority(self.fioriSliderConfiguration.isRangeSlider ? 7 : 0) // Need to set sort priority when the control was Range Slider
        }
    }
    
    struct ValueLabelFioriStyle: ValueLabelStyle {
        let fioriSliderConfiguration: FioriSliderConfiguration
        @Environment(\.isEnabled) var isEnabled
        @Environment(\.roundValueFormat) var roundValueFormat
        @Environment(\.layoutDirection) var layoutDirection
        @Environment(\.sizeCategory) private var sizeCategory
        
        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            let valueLabel = ValueLabel(configuration, fioriSliderConfiguration: fioriSliderConfiguration)
                .font(.fiori(forTextStyle: .body))
                .foregroundStyle(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.quaternaryLabel))
            
            guard !valueLabel.isEmpty else {
                return AnyView(valueLabel)
            }
            
            guard !self.fioriSliderConfiguration.title.isEmpty else {
                // value label should always has alignment when there is no title display
                return AnyView(valueLabel
                    .frame(maxWidth: .infinity, alignment: self.layoutDirection == .rightToLeft ? .leading : .trailing))
            }
            
            if self.fioriSliderConfiguration.isLargeSizeCategory(self.sizeCategory) {
                // value label should has same alignment with title when the title display in large size mode since they were in one column not in one line
                return AnyView(valueLabel
                    .frame(maxWidth: .infinity, alignment: .leading))
            }
            
            return AnyView(valueLabel)
        }
    }
    
    struct LowerThumbFioriStyle: LowerThumbStyle {
        let fioriSliderConfiguration: FioriSliderConfiguration
        @Environment(\.isEnabled) var isEnabled
        @Environment(\.roundValueFormat) var roundValueFormat
        
        func makeBody(_ configuration: LowerThumbConfiguration) -> some View {
            guard self.isEnabled, self.fioriSliderConfiguration.isRangeSlider, self.fioriSliderConfiguration.showsLowerThumb else {
                return AnyView(LowerThumb(configuration))
            }
            
            return AnyView(LowerThumb(configuration)
                .accessibilityLabel(NSLocalizedString("lower range slider thumb, current value is", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                .accessibilityHint(NSLocalizedString("you can swipe up or down to change the lower value", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                .accessibilityValue(String(format: self.fioriSliderConfiguration.leadingValueFormat ?? self.roundValueFormat, self.fioriSliderConfiguration.lowerValue))
                .accessibilitySortPriority(5)
                .accessibilityAdjustableAction { direction in
                    switch direction {
                    case .decrement:
                        self.fioriSliderConfiguration.lowerValue = max(self.fioriSliderConfiguration.lowerValue - self.fioriSliderConfiguration.step, self.fioriSliderConfiguration.range.lowerBound)
                    case .increment:
                        self.fioriSliderConfiguration.lowerValue = min(self.fioriSliderConfiguration.lowerValue + self.fioriSliderConfiguration.step, self.fioriSliderConfiguration.range.upperBound)
                    @unknown default:
                        self.fioriSliderConfiguration.lowerValue = self.fioriSliderConfiguration.lowerValue
                    }
                })
        }
    }
    
    struct UpperThumbFioriStyle: UpperThumbStyle {
        let fioriSliderConfiguration: FioriSliderConfiguration
        @Environment(\.isEnabled) var isEnabled
        @Environment(\.roundValueFormat) var roundValueFormat
        
        func makeBody(_ configuration: UpperThumbConfiguration) -> some View {
            guard self.isEnabled, self.fioriSliderConfiguration.isRangeSlider, self.fioriSliderConfiguration.showsLowerThumb, self.fioriSliderConfiguration.showsUpperThumb else {
                return AnyView(UpperThumb(configuration))
            }
            
            return AnyView(UpperThumb(configuration)
                .accessibilityLabel(NSLocalizedString(self.fioriSliderConfiguration.showsLowerThumb ? "upper range slider thumb, current value is" : "slider thumb, current value is", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                .accessibilityHint(NSLocalizedString(self.fioriSliderConfiguration.showsLowerThumb ? "you can swipe up or down to change the upper value" : "you can swipe up or down to change the value", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                .accessibilityValue(String(format: self.fioriSliderConfiguration.trailingValueFormat ?? self.roundValueFormat, self.fioriSliderConfiguration.upperValue))
                .accessibilitySortPriority(4)
                .accessibilityAdjustableAction { direction in
                    switch direction {
                    case .decrement:
                        self.fioriSliderConfiguration.upperValue = max(self.fioriSliderConfiguration.upperValue - self.fioriSliderConfiguration.step, self.fioriSliderConfiguration.range.lowerBound)
                    case .increment:
                        self.fioriSliderConfiguration.upperValue = min(self.fioriSliderConfiguration.upperValue + self.fioriSliderConfiguration.step, self.fioriSliderConfiguration.range.upperBound)
                    @unknown default:
                        self.fioriSliderConfiguration.upperValue = self.fioriSliderConfiguration.upperValue
                    }
                })
        }
    }
    
    struct ActiveTrackFioriStyle: ActiveTrackStyle {
        let fioriSliderConfiguration: FioriSliderConfiguration
        
        func makeBody(_ configuration: ActiveTrackConfiguration) -> some View {
            ActiveTrack(configuration)
        }
    }
    
    struct InactiveTrackFioriStyle: InactiveTrackStyle {
        let fioriSliderConfiguration: FioriSliderConfiguration
        
        func makeBody(_ configuration: InactiveTrackConfiguration) -> some View {
            InactiveTrack(configuration)
        }
    }
    
    struct IconFioriStyle: IconStyle {
        let fioriSliderConfiguration: FioriSliderConfiguration
        
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundStyle(Color.preferredColor(.negativeLabel))
                .font(.fiori(forTextStyle: .footnote))
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        let fioriSliderConfiguration: FioriSliderConfiguration
        @Environment(\.isEnabled) var isEnabled
        
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundStyle(self.isEnabled ? Color.preferredColor(.tertiaryLabel).opacity(0.9) : Color.preferredColor(.quaternaryLabel))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    struct LeadingAccessoryFioriStyle: LeadingAccessoryStyle {
        let fioriSliderConfiguration: FioriSliderConfiguration
        @Environment(\.isEnabled) var isEnabled
        @Environment(\.roundValueFormat) var roundValueFormat
        
        func makeBody(_ configuration: LeadingAccessoryConfiguration) -> some View {
            let isCustomEmpty = configuration.leadingAccessory.isEmpty
            
            let content = LeadingAccessory(configuration: configuration, fioriSliderConfiguration: fioriSliderConfiguration)
            
            if self.fioriSliderConfiguration.isRangeSlider, isCustomEmpty { // To use the text field for Range Slider
                let labelHint = self.getEditableAccessibilityLabelHint()
                return AnyView(content
                    .accessibilityHidden(!self.isEnabled)
                    .accessibilityLabel(labelHint.0)
                    .accessibilityHint(labelHint.1)
                    .accessibilityValue(self.getEditableAccessibilityValue())
                    .accessibilitySortPriority(3))
                    .typeErased
            } else {
                return AnyView(content
                    .font(Font.fiori(forTextStyle: .body))
                    .foregroundStyle(self.isEnabled ? Color.preferredColor(.tertiaryLabel).opacity(0.9) : Color.preferredColor(.separator).opacity(0.37)))
            }
        }
        
        func getEditableAccessibilityLabelHint() -> (String, String) {
            guard self.isEnabled, self.fioriSliderConfiguration.showsLeadingAccessory else {
                return ("", "")
            }
            
            return (NSLocalizedString("lower value text field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), NSLocalizedString("You can double tap to input a specific value", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
        }
        
        func getEditableAccessibilityValue() -> String {
            guard self.isEnabled, self.fioriSliderConfiguration.showsLeadingAccessory else {
                return String(format: self.roundValueFormat, self.fioriSliderConfiguration.lowerValue)
            }
            
            let format = NSLocalizedString("current value is %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            return String(format: format, String(format: self.roundValueFormat, self.fioriSliderConfiguration.lowerValue))
        }
    }
    
    struct TrailingAccessoryFioriStyle: TrailingAccessoryStyle {
        let fioriSliderConfiguration: FioriSliderConfiguration
        @Environment(\.isEnabled) var isEnabled
        @Environment(\.roundValueFormat) var roundValueFormat
        @Environment(\.sizeCategory) private var sizeCategory
        
        func makeBody(_ configuration: TrailingAccessoryConfiguration) -> some View {
            let isCustomEmpty = configuration.trailingAccessory.isEmpty
            
            let content = TrailingAccessory(configuration: configuration, fioriSliderConfiguration: fioriSliderConfiguration)
            
            if self.fioriSliderConfiguration.isRangeSlider, isCustomEmpty { // To use the text field for Range Slider
                let labelHint = self.getEditableAccessibilityLabelHint()
                return AnyView(content
                    .accessibilityHidden(!self.isEnabled)
                    .accessibilityLabel(labelHint.0)
                    .accessibilityHint(labelHint.1)
                    .accessibilityValue(self.getEditableAccessibilityValue())
                    .accessibilitySortPriority(2))
                    .typeErased
            } else {
                return AnyView(content
                    .font(Font.fiori(forTextStyle: .body))
                    .foregroundStyle(self.isEnabled ? Color.preferredColor(.tertiaryLabel).opacity(0.9) : Color.preferredColor(.separator).opacity(0.37)))
            }
        }
        
        func getEditableAccessibilityLabelHint() -> (String, String) {
            guard self.isEnabled, self.fioriSliderConfiguration.showsTrailingAccessory else {
                return ("", "")
            }
            
            return (NSLocalizedString(self.fioriSliderConfiguration.showsLeadingAccessory ? "upper value text field" : "slider value text field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), NSLocalizedString("You can double tap to input a specific value", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
        }
        
        func getEditableAccessibilityValue() -> String {
            let format = NSLocalizedString("current value is %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            return String(format: format, String(format: self.roundValueFormat, self.fioriSliderConfiguration.upperValue))
        }
    }
    
    struct RangeSliderControlFioriStyle: RangeSliderControlStyle {
        let fioriSliderConfiguration: FioriSliderConfiguration
        @Environment(\.isEnabled) var isEnabled
        @Environment(\.roundValueFormat) var roundValueFormat
        
        func makeBody(_ configuration: RangeSliderControlConfiguration) -> some View {
            guard self.fioriSliderConfiguration.isRangeSlider else {
                return AnyView(RangeSliderControl(configuration))
            }
            
            let isEditableSlider = self.fioriSliderConfiguration.leadingAccessory.isEmpty && self.fioriSliderConfiguration.trailingAccessory.isEmpty
            return AnyView(RangeSliderControl(configuration)
                .accessibilityAdjustments(self.getAccessibility(self.fioriSliderConfiguration, isEditableSlider)))
        }
        
        func getAccessibility(_ configuration: FioriSliderConfiguration, _ isEditableSlider: Bool) -> RangeSliderAccessibilityModel {
            var accessibility = RangeSliderAccessibilityModel()
            
            if configuration.showsLowerThumb, configuration.showsUpperThumb {
                let labelFormat = isEditableSlider ? (self.isEnabled ? NSLocalizedString("This is a range slider that is editable, the minimum value is %@ and the maximum value is %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "") : NSLocalizedString("This is a range slider that can't be edited, the minimum value is %@ and the maximum value is %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")) :
                    NSLocalizedString("This is a range slider, the minimum value is %@ and the maximum value is %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
                var lowerFormat = self.roundValueFormat
                var upperFormat = self.roundValueFormat
                if let format = configuration.rangeFormat {
                    lowerFormat = format.0
                    upperFormat = format.1
                }
                accessibility.label = String(format: labelFormat, String(format: lowerFormat, configuration.range.lowerBound), String(format: upperFormat, configuration.range.upperBound))
                
                accessibility.value = String(format: NSLocalizedString("current lower value is %@, upper value is %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), String(format: configuration.leadingValueFormat ?? self.roundValueFormat, configuration.lowerValue), String(format: configuration.trailingValueFormat ?? self.roundValueFormat, configuration.upperValue))
                
            } else if configuration.showsUpperThumb {
                let labelFormat = isEditableSlider ? (self.isEnabled ? NSLocalizedString("This is a slider that is editable, the minimum value is %@ and the maximum value is %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "") : NSLocalizedString("This is a slider that can't be edited, the minimum value is %@ and the maximum value is %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")) :
                    NSLocalizedString("This is a slider, the minimum value is %@ and the maximum value is %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
                
                var lowerFormat = self.roundValueFormat
                var upperFormat = self.roundValueFormat
                if let format = configuration.rangeFormat {
                    lowerFormat = format.0
                    upperFormat = format.1
                }
                
                accessibility.label = String(format: labelFormat, String(format: lowerFormat, configuration.range.lowerBound), String(format: upperFormat, configuration.range.upperBound))
                
                accessibility.value = String(format: NSLocalizedString("current value is %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), String(format: configuration.trailingValueFormat ?? self.roundValueFormat, configuration.upperValue))
            }
            
            // Only let the RangeSlider adjustable when only one thumb enabled. Otherwise, each thumb was adjustable.
            accessibility.adjustable = self.isEnabled && configuration.showsLowerThumb != configuration.showsUpperThumb
            return accessibility
        }
    }
    
    struct InformationViewFioriStyle: InformationViewStyle {
        let fioriSliderConfiguration: FioriSliderConfiguration
        
        func makeBody(_ configuration: InformationViewConfiguration) -> some View {
            InformationView(configuration)
        }
    }
}

public extension FioriSlider {
    /// Adjust the accessibility label and value for the standard slider. By default, the standard slider uses SwiftUI's default accessibility behavior to combine all subviews.
    /// However, this function allows you to adjust the accessibility label and value for the standard slider.
    ///
    /// The values of the parameters `title`, `leadingLabel`, `trailingLabel`, and `description` are formatted as 'This is a %@ slider whose maximum value is %@ and minimum value is %@, %@' for the accessibility label.
    /// The value of the parameter `value` is formatted as 'Current value is %@' for the accessibility value.
    ///
    /// - Parameters:
    ///   - title: The string used to display the title of the slider.
    ///   - value: An optional formatted value as the accessibility value. The default formatted slider value is used when it was nil.
    ///   - leadingLabel: An optional formatted string as the accessibility label of leading accessory view. The default formatted minimum value of range is used when it is nil.
    ///   - trailingLabel: An optional formatted string as the accessibility label of trailing accessory view. The default formatted maximum value of range is used when it is nil.
    ///   - description: An optional formatted string which append to the accessibility label
    func accessibilityAdjustments(title: String, value: String? = nil, leadingLabel: String? = nil, trailingLabel: String? = nil, description: String? = nil) -> some View {
        let value = value ?? String(format: self.valueFormat ?? "%.\(self.decimalPlaces)f", self.upperValue)
        return self.modifier(StandardSliderAccessibilityModifier(value: self.$upperValue, label: title, formattedValue: value, range: self.range, step: self.step, decimalPlaces: self.decimalPlaces, leadingLabelFormat: leadingLabel ?? self.leadingValueFormat, trailingLabelFormat: trailingLabel ?? self.trailingValueFormat, description: description ?? "", canAdjust: !self.isRangeSlider))
    }
}

extension FioriSliderConfiguration {
    func isLargeSizeCategory(_ sizeCategory: ContentSizeCategory) -> Bool {
        sizeCategory == .accessibilityMedium || sizeCategory == .accessibilityLarge || sizeCategory == .accessibilityExtraLarge
            || sizeCategory == .accessibilityExtraExtraLarge || sizeCategory == .accessibilityExtraExtraExtraLarge
    }
    
    func getRangeSliderControlConfiguration() -> RangeSliderControlConfiguration {
        var onRangeValueChange: ((Bool, Double, Double) -> Void)? = self.onRangeValueChange
         
        if let onValueChange = self.onValueChange, !self.showsLowerThumb {
            onRangeValueChange = { isEditing, _, upperValue in
                onValueChange(isEditing, upperValue)
            }
        }
        
        return RangeSliderControlConfiguration(lowerThumb: self.lowerThumb, upperThumb: self.upperThumb, activeTrack: self.activeTrack, inactiveTrack: self.inactiveTrack, lowerValue: self.$lowerValue, upperValue: self.$upperValue, range: self.range, step: self.step, decimalPlaces: self.decimalPlaces, thumbHalfWidth: self.thumbHalfWidth, showsLowerThumb: self.showsLowerThumb, showsUpperThumb: self.showsUpperThumb, onRangeValueChange: onRangeValueChange)
    }
}

// To modify accessibility of the standard slider which wrapper the SwiftUI built-in slider since the limitation of style component(Don't change to get the string value from a view. For example, the title of the Slider)
struct StandardSliderAccessibilityModifier: ViewModifier {
    @Binding var value: Double
    var label: String
    var formattedValue: String
    var range: ClosedRange<Double>
    var step: Double
    var decimalPlaces: Int
    var leadingLabelFormat: String?
    var trailingLabelFormat: String?
    var description: String
    var canAdjust: Bool
    
    @Environment(\.isEnabled) private var isEnabled
    
    func body(content: Content) -> some View {
        guard self.canAdjust else {
            return AnyView(content)
        }
        let minValue = String(format: self.leadingLabelFormat ?? "%.\(self.decimalPlaces)f", self.range.lowerBound)
        let maxValue = String(format: self.trailingLabelFormat ?? "%.\(self.decimalPlaces)f", self.range.upperBound)
        
        let labelFormat = NSLocalizedString("This is %@ slider whose maximum value is %@ and minimum value is %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        let valueFormat = NSLocalizedString("Current value is %@", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        let label = String(format: labelFormat, label, maxValue, minValue) + (description.isEmpty ? "" : ". \(self.description)")
        var updateContent = content
            .accessibilityElement()
            .accessibilityLabel(label)
            .accessibilityValue(String(format: valueFormat, self.formattedValue))
        
        if self.isEnabled { // To set adjustable action to make sure the accessibility trait was 'adjustable' only for enabled status
            updateContent = updateContent.accessibilityAdjustableAction { direction in
                switch direction {
                case .decrement:
                    self.value = max(self.value - self.step, self.range.lowerBound)
                case .increment:
                    self.value = min(self.value + self.step, self.range.upperBound)
                @unknown default:
                    self.value = self.value
                }
            }
        }
            
        return AnyView(updateContent)
    }
}

class SliderStateObject: ObservableObject { // To stored and observe some stateful variables and avoid multi-instance was initialized.
    @Published var isFocused: Bool = false // present the focused state of the text field
    
    var editingLeadingValue: String? // To stored the current editing leading TextField's value
    var editingTrailingValue: String? // To stored the current editing trailing TextField's value
}

class SliderModelObject: ObservableObject { // The ObservableObject was used to stored stateless variables
    @Published var leadingText: String
    @Published var trailingText: String
    
    init(configuration: FioriSliderConfiguration, roundValueFormat: String) {
        self.leadingText = String(format: roundValueFormat, configuration.lowerValue)
        self.trailingText = String(format: roundValueFormat, configuration.upperValue)
    }
}
