import Foundation

import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct SliderExample: View {
    var body: some View {
        List {
            NavigationLink {
                SingleSliderExample()
            } label: {
                Text("Slider")
            }
            NavigationLink {
                RangeSliderExample()
            } label: {
                Text("Range Slider")
            }
            NavigationLink {
                CustomSliderExample()
            } label: {
                Text("Customized Slider")
            }
        }
    }
}

struct SingleSliderExample: View {
    @State var intValue: Double = 20
    @State var wrapperValue: Double = 20
    @State var decimalValue: Double = 14.0
    @State var distanceValue: Double = 12450.68
    @State var longValue: Double = 3.0
    @State var statusValue: Double = 350
    @State var disableValue: Double = 60
    @State var disableEditValue: Double = 60
    @State var limitValue: Double = 30
    @State var volumeValue: Double = 15.0
    @State var lettersValue: Double = 6
    @State var feedbackValue: Double = 10
    
    var statusDescription: AttributedString {
        if self.statusValue > 250 {
            "The mouse scroll speed is too fast."
        } else if self.statusValue > 150 {
            "The mouse scroll speed is a bit fast."
        } else if self.statusValue > 50 {
            "The mouse scroll speed is just right."
        } else {
            ""
        }
    }
    
    var infoStyle: any InformationViewStyle {
        if self.statusValue > 250 {
            InformationViewErrorStyle.error
        } else if self.statusValue > 150 {
            InformationViewWarningStyle.warning
        } else if self.statusValue > 50 {
            InformationViewInformationalStyle.informational
        } else {
            InformationViewFioriStyle.fiori
        }
    }
    
    var onValueChange: (Bool, Double, Int) -> Void = { isEditing, value, decimalPlace in
        if !isEditing {
            print("Slider value change to: " + String(format: "%.\(decimalPlace)f", value))
        }
    }
    
    var body: some View {
        List {
            let title1 = "Integer value Slider"
            let description1 = "The Integer Value Slider allows you to select whole numbers within a specified range"
            FioriSlider(
                title: AttributedString(title1),
                value: self.$intValue,
                description: AttributedString(description1),
                onValueChange: { isEditing, newValue in
                    self.onValueChange(isEditing, newValue, 0)
                }
            )
            .accessibilityAdjustments(title: title1, description: description1)

            let title2 = "Decimal value Slider"
            let description2 = "The Decimal Value Slider offers the flexibility to select numbers with decimal precision"
            FioriSlider(
                title: AttributedString(title2),
                value: self.$decimalValue,
                step: 2.5,
                decimalPlaces: 1,
                description: AttributedString(description2)
            )
            .accessibilityAdjustments(title: title2, description: description2)

            let kmDecimalPlace = 2
            let format = "%.\(kmDecimalPlace)f KM"
            let title3 = "Distance"
            FioriSlider(
                title: AttributedString(title3),
                value: self.$distanceValue,
                range: 30 ... 60000,
                step: 20.55,
                decimalPlaces: kmDecimalPlace,
                valueFormat: format,
                leadingValueFormat: format,
                trailingValueFormat: format,
                onValueChange: { isEditing, newValue in
                    self.onValueChange(isEditing, newValue, 2)
                }
            )
            .accessibilityAdjustments(title: title3)

            let title4 = "The Integer Value Slider allows you to select whole numbers within a specified range. This type of slider is ideal for settings where precise, non-fractional values are required. Whether you are setting quantities, levels, or steps, the Integer Value Slider ensures that you can quickly and easily choose a precise whole number."
            FioriSlider(
                title: AttributedString(title4),
                value: self.$longValue,
                step: 10,
                onValueChange: { isEditing, newValue in
                    self.onValueChange(isEditing, newValue, 0)
                }
            )
            .accessibilityAdjustments(title: title4)

            let title5 = "Mouse Scrolling Speed"
            FioriSlider(
                title: "Mouse Scrolling Speed",
                value: self.$statusValue,
                range: 0 ... 400,
                step: 10,
                description: self.statusDescription,
                onValueChange: { isEditing, newValue in
                    self.onValueChange(isEditing, newValue, 0)
                }
            )
            .accessibilityAdjustments(title: title5, description: String(self.statusDescription.characters))
            .informationViewStyle(self.infoStyle).typeErased

            // Disable Slider
            let title6 = "Disabled Slider"
            let description6 = "The slider is currently disabled."
            FioriSlider(title: AttributedString(title6), value: self.$disableValue, description: AttributedString(description6))
                .accessibilityAdjustments(title: title6, description: description6)
                .environment(\.isEnabled, false)

            // Custom Slider
            let title7 = "Volume"
            let description7 = "Adjust the volume by moving the slider"
            FioriSlider(
                titleView: { Text(title7) },
                value: self.$volumeValue,
                range: 0 ... 30, step: 2.0,
                description: AttributedString(description7),
                valueLabelView: {
                    if self.volumeValue <= 0 { FioriIcon.actions.soundOff }
                    else if self.volumeValue >= 30 { FioriIcon.actions.soundLoud }
                    else { EmptyView() }
                },
                leadingAccessory: { FioriIcon.actions.sound },
                trailingAccessory: { FioriIcon.actions.soundLoud }
            )
            .accessibilityAdjustments(title: title7, description: description7)
            .valueLabelStyle { configuration in
                configuration.valueLabel
                    .font(.fiori(forTextStyle: .body))
                    .foregroundStyle(.tint)
            }
            .leadingAccessoryStyle { configuration in
                configuration.leadingAccessory
                    .font(.fiori(forTextStyle: .body))
                    .foregroundStyle(.tint)
            }
            .trailingAccessoryStyle { configuration in
                configuration.trailingAccessory
                    .font(.fiori(forTextStyle: .body))
                    .foregroundStyle(.tint)
            }
            
            let title8 = "Letters"
            let letterValue = getLetter(for: Int(String(format: "%.0f", lettersValue)) ?? 1)
            let leadingLabel = getLetter(for: 1)
            let trailingLabel = getLetter(for: 26)
            FioriSlider(
                titleView: { Text(title8) },
                value: self.$lettersValue,
                range: 1 ... 26,
                valueLabelView: {
                    Text(letterValue)
                },
                leadingAccessory: {
                    Text(leadingLabel)
                },
                trailingAccessory: {
                    Text(trailingLabel)
                }
            )
            .accessibilityAdjustments(title: title8, value: letterValue, leadingLabel: leadingLabel, trailingLabel: trailingLabel)
            
            FioriSlider(
                value: self.$limitValue,
                range: 1 ... 80,
                step: 5,
                description: "Simple Custom Slider",
                showsValueLabel: false,
                leadingAccessory: {
                    Text("Limiter")
                        .font(Font.fiori(forTextStyle: .body))
                        .foregroundStyle(Color.preferredColor(.primaryLabel))
                },
                trailingAccessory: {
                    Text("\(String(format: "%.0f", self.limitValue))")
                }
            )
            .accessibilityAdjustments(title: "Limiter", description: "Simple Custom Slider")

            let title9 = "\(String(format: "%.0f", self.feedbackValue)) Stories"
            let description9 = "User Stories"
            FioriSlider(
                titleView: { Text(title9) },
                value: self.$feedbackValue,
                description: AttributedString(description9),
                showsValueLabel: false
            )
            .accessibilityAdjustments(title: title9, description: description9)
        }
        .listStyle(.plain)
    }
}

struct RangeSliderExample: View {
    @State var intLowerValue: Double = 10
    @State var intUpperValue: Double = 60
    
    @State var lowerValue: Double = 30.0
    @State var upperValue: Double = 254.5
    
    @State var twoDecimalLowerValue: Double = 28.97
    @State var twoDecimalUpperValue: Double = 79.23
    
    @State var singleEditUpperValue: Double = 40
    @State var disableEditValue: Double = 20
    
    @State var disabledLowerValue: Double = 5.0
    @State var disabledUpperValue: Double = 20.0
    
    @State var customLowerValue: Double = 4
    @State var customUpperValue: Double = 16
    
    @State var colorLowerValue: Double = 0.1987
    @State var colorUpperValue: Double = 0.8796
    
    var onRangeValueChange: (Bool, Double, Double, Int) -> Void = { isEditing, lowerValue, upperValue, decimalPlace in
        if !isEditing {
            print("Range Slider value was: " + String(format: "%.\(decimalPlace)f", lowerValue) + " - " + String(format: "%.\(decimalPlace)f", upperValue))
        }
    }
    
    var body: some View {
        List {
            let singleEditableRange = 1.0 ... 70.0
            FioriSlider(
                title: AttributedString("Single Range Slider (\(String(format: "%.0f", singleEditableRange.lowerBound)) - \(String(format: "%.0f", singleEditableRange.upperBound)))"),
                upperValue: self.$singleEditUpperValue,
                range: singleEditableRange,
                description: getInfoDescription(lowerValue: singleEditableRange.lowerBound, upperValue: self.singleEditUpperValue, range: singleEditableRange, decimalPlace: 0, defaultDesc: "The single editable slider accepts integer numbers."),
                onValueChange: { isEditing, value in
                    if !isEditing {
                        print("The Slider value was: " + String(format: "%.0f", value))
                    }
                }
            )
            .informationViewStyle(getInfoStyle(lowerValue: singleEditableRange.lowerBound, upperValue: self.singleEditUpperValue, range: singleEditableRange)).typeErased
            
            FioriSlider(
                title: "Range Slider (0 - 100)",
                lowerValue: self.$intLowerValue,
                upperValue: self.$intUpperValue,
                description: getInfoDescription(lowerValue: self.intLowerValue, upperValue: self.intUpperValue, range: 0 ... 100, decimalPlace: 0, defaultDesc: "A range slider that allows users to input integers for the lower and upper values provides flexibility in defining numeric ranges through both sliding handles and direct text input."),
                onRangeValueChange: { isEditing, lowerValue, upperValue in
                    self.onRangeValueChange(isEditing, lowerValue, upperValue, 0)
                }
            )
            .informationViewStyle(getInfoStyle(lowerValue: self.intLowerValue, upperValue: self.intUpperValue, range: 0 ... 100)).typeErased
            
            let oneDecimalRange = 10.5 ... 400.5
            FioriSlider(
                title: AttributedString("Range Slider (\(String(format: "%.1f", oneDecimalRange.lowerBound)) - \(String(format: "%.1f", oneDecimalRange.upperBound)))"),
                lowerValue: self.$lowerValue,
                upperValue: self.$upperValue,
                range: 10.5 ... 400.5,
                step: 3.5,
                decimalPlaces: 1,
                description: getInfoDescription(lowerValue: self.lowerValue, upperValue: self.upperValue, range: 10.5 ... 400.5, decimalPlace: 1, defaultDesc: "The range slider accepts numbers with one decimal place."),
                onRangeValueChange: { isEditing, lowerValue, upperValue in
                    self.onRangeValueChange(isEditing, lowerValue, upperValue, 1)
                }
            )
            .informationViewStyle(getInfoStyle(lowerValue: self.lowerValue, upperValue: self.upperValue, range: 10.5 ... 400.5)).typeErased
            
            let twoDecimalRange = 1.58 ... 90.58
            FioriSlider(
                title: AttributedString("Range Slider (\(String(format: "%.2f", twoDecimalRange.lowerBound)) - \(String(format: "%.2f", twoDecimalRange.upperBound)))"),
                lowerValue: self.$twoDecimalLowerValue,
                upperValue: self.$twoDecimalUpperValue,
                range: twoDecimalRange,
                step: 0.01,
                decimalPlaces: 2,
                description: getInfoDescription(lowerValue: self.twoDecimalLowerValue, upperValue: self.twoDecimalUpperValue, range: twoDecimalRange, decimalPlace: 2, defaultDesc: "The range slider accepts numbers with two decimal place."),
                onRangeValueChange: { isEditing, lowerValue, upperValue in
                    self.onRangeValueChange(isEditing, lowerValue, upperValue, 2)
                }
            )
            .informationViewStyle(getInfoStyle(lowerValue: self.twoDecimalLowerValue, upperValue: self.twoDecimalUpperValue, range: twoDecimalRange)).typeErased
            
            FioriSlider(
                title: AttributedString("Range Slider (0-50)"),
                lowerValue: self.$disabledLowerValue,
                upperValue: self.$disabledUpperValue,
                range: 0.0 ... 50.0,
                description: "Disabled range slider"
            ).disabled(true)
            
            FioriSlider(
                title: AttributedString("Slider (10-80)"),
                upperValue: self.$disableEditValue,
                range: 10 ... 80,
                description: "Disabled slider"
            ).disabled(true)
            
            let leadingLabel = getLetter(for: Int(self.customLowerValue))
            let trailingLabel = getLetter(for: Int(self.customUpperValue))
            let rangeFormat = (getLetter(for: 1), getLetter(for: 26))
            FioriSlider(
                title: "Letters",
                lowerValue: self.$customLowerValue,
                upperValue: self.$customUpperValue,
                range: 1 ... 26,
                description: "A simple, custom range slider to select a range of letters from lower to upper.",
                rangeFormat: rangeFormat,
                leadingAccessory: {
                    Text(leadingLabel).accessibilityHidden(true)
                },
                leadingValueFormat: leadingLabel,
                trailingAccessory: {
                    Text(trailingLabel).accessibilityHidden(true)
                },
                trailingValueFormat: trailingLabel
            )
            
            let step = 0.00001
            FioriSlider(
                lowerValue: self.$colorLowerValue,
                upperValue: self.$colorUpperValue,
                range: 0 ... 1,
                step: step,
                decimalPlaces: 5,
                description: "A custom range slider allows you to change the color of the profile image.",
                valueLabelView: {
                    ColorDemoViewStyle(lowerValue: self.$colorLowerValue, upperValue: self.$colorUpperValue)
                        .accessibilityHidden(true)
                },
                leadingAccessory: {
                    ColorPickerView(value: self.$colorLowerValue, step: step)
                },
                trailingAccessory: {
                    ColorPickerView(value: self.$colorUpperValue, step: step)
                }
            )
        }
        .listStyle(.plain)
    }
}

struct CustomSliderExample: View {
    @State private var intValue: Double = 20
    @State private var customIntValue: Double = 40
    @State private var disableValue: Double = 30
    
    @State var intLowerValue: Double = 10
    @State var intUpperValue: Double = 60
    
    @State var disabledLowerValue: Double = 5.0
    @State var disabledUpperValue: Double = 20.0
    
    @State var singleEditUpperValue: Double = 40
    
    @State var disableEditValue: Double = 20
    
    @State var isEditFieldFocused1: Bool = false
    @State var isEditFieldFocused2: Bool = false
    
    @State var customThumbLowerValue: Double = 10
    @State var customThumbUpperValue: Double = 60
    
    var body: some View {
        List {
            let title1 = "Integer value Slider"
            let description1 = "The Integer Value Slider allows you to select whole numbers within a specified range"
            FioriSlider(
                title: AttributedString(title1),
                value: self.$intValue,
                description: AttributedString(description1)
            )
            .titleStyle { configuration in
                configuration.title.foregroundStyle(.cyan)
                    .font(.fiori(forTextStyle: .title3, weight: .regular))
            }
            .valueLabelStyle { configuration in
                configuration.valueLabel.foregroundStyle(Color.preferredColor(.accentLabel6))
                    .font(.fiori(forTextStyle: .title2))
            }
            .descriptionStyle { configuration in
                configuration.description.foregroundStyle(.brown)
                    .font(.fiori(forTextStyle: .body, weight: .regular))
            }
            .leadingAccessoryStyle { configuration in
                configuration.leadingAccessory.foregroundStyle(Color.preferredColor(.accentLabel4))
                    .font(.fiori(forTextStyle: .title1))
            }
            .trailingAccessoryStyle { configuration in
                configuration.trailingAccessory.foregroundStyle(Color.red)
                    .font(.fiori(forTextStyle: .title1))
            }
            .upperThumbStyle { configuration in
                configuration.upperThumb.foregroundStyle(Color.orange)
            }
            .activeTrackStyle { configuration in
                configuration.activeTrack.foregroundStyle(Color.green)
            }
            .inactiveTrackStyle { configuration in
                configuration.inactiveTrack.foregroundStyle(Color.red)
            }
            
            FioriSlider(
                title: AttributedString("Custom Standard Slider"),
                value: self.$customIntValue,
                description: AttributedString("Customize the strand slider with thumb, track"),
                thumb: Ellipse()
            )
            .titleStyle { configuration in
                configuration.title.foregroundStyle(.brown)
                    .font(.fiori(forTextStyle: .title2))
            }
            .valueLabelStyle { configuration in
                configuration.valueLabel.foregroundStyle(Color.preferredColor(.pink6))
                    .font(.fiori(forTextStyle: .body))
            }
            .descriptionStyle { configuration in
                configuration.description.foregroundStyle(.brown)
                    .font(.fiori(forTextStyle: .body, weight: .regular))
            }
            .leadingAccessoryStyle { configuration in
                configuration.leadingAccessory.foregroundStyle(Color.preferredColor(.grey4))
                    .font(.fiori(forTextStyle: .title2))
            }
            .trailingAccessoryStyle { configuration in
                configuration.trailingAccessory.foregroundStyle(Color.orange)
                    .font(.fiori(forTextStyle: .title2))
            }
            .upperThumbStyle { configuration in
                configuration.upperThumb
                    .frame(height: 40)
                    .foregroundStyle(Color.preferredColor(.pink6))
            }
            .activeTrackStyle { configuration in
                configuration.activeTrack.foregroundStyle(Color.brown)
            }
            .inactiveTrackStyle { configuration in
                configuration.inactiveTrack.foregroundStyle(Color.black)
            }
            
            let title6 = "Disabled Slider"
            let description6 = "The slider is currently disabled."
            FioriSlider(title: AttributedString(title6), value: self.$disableValue, description: AttributedString(description6))
                .accessibilityAdjustments(title: title6, description: description6)
                .titleStyle { configuration in
                    configuration.title.foregroundStyle(.brown)
                        .font(.fiori(forTextStyle: .title2, weight: .regular))
                }
                .valueLabelStyle { configuration in
                    configuration.valueLabel.foregroundStyle(Color.preferredColor(.accentLabel6))
                        .font(.fiori(forTextStyle: .title3))
                }
                .descriptionStyle { configuration in
                    configuration.description.foregroundStyle(Color.preferredColor(.mango11))
                        .font(.fiori(forTextStyle: .title2, weight: .regular))
                }
                .leadingAccessoryStyle { configuration in
                    configuration.leadingAccessory.foregroundStyle(Color.preferredColor(.mango4))
                        .font(.fiori(forTextStyle: .title3))
                }
                .trailingAccessoryStyle { configuration in
                    configuration.trailingAccessory.foregroundStyle(Color.green)
                        .font(.fiori(forTextStyle: .title3))
                }
            
                .environment(\.isEnabled, false)
                
            let trailingEditFieldStyle = FioriSliderTextFieldStyle(borderColor: Color.yellow, focusedBorderColor: Color.black, font: Font.fiori(forTextStyle: .title2), foregroundColor: Color.blue)
            FioriSlider(
                title: "Range Slider (0 - 100)",
                lowerValue: self.$intLowerValue,
                upperValue: self.$intUpperValue,
                description: getInfoDescription(lowerValue: self.intLowerValue, upperValue: self.intUpperValue, range: 0 ... 100, decimalPlace: 0, defaultDesc: "A range slider that allows users to input integers for the lower and upper values provides flexibility in defining numeric ranges through both sliding handles and direct text input."),
                onEditFieldFocusStatusChange: {
                    self.isEditFieldFocused1 = $0
                }
            )
            .titleStyle { configuration in
                configuration.title.foregroundStyle(self.isEditFieldFocused1 ? trailingEditFieldStyle.focusedBorderColor : .brown)
                    .font(.fiori(forTextStyle: .title2, weight: .regular))
            }
            .descriptionStyle { configuration in
                configuration.description.foregroundStyle(Color.preferredColor(.mango11))
                    .font(.fiori(forTextStyle: .body, weight: .bold))
            }
            .lowerThumbStyle { configuration in
                configuration.lowerThumb.foregroundStyle(Color.green)
            }
            .upperThumbStyle { configuration in
                configuration.upperThumb.foregroundStyle(Color.orange)
            }
            .activeTrackStyle { configuration in
                configuration.activeTrack.foregroundStyle(Color.green)
            }
            .inactiveTrackStyle { configuration in
                configuration.inactiveTrack.foregroundStyle(Color.red)
            }
            .leadingAccessoryStyle(textFieldStyle: FioriSliderTextFieldStyle(borderColor: Color.orange, focusedBorderColor: trailingEditFieldStyle.focusedBorderColor, font: Font.fiori(forTextStyle: .title1), foregroundColor: Color.black))
            .trailingAccessoryStyle(textFieldStyle: trailingEditFieldStyle)
            .informationViewStyle(getInfoStyle(lowerValue: self.intLowerValue, upperValue: self.intUpperValue, range: 0 ... 100)).typeErased
            
            let singleEditableRange = 1.0 ... 70.0
            let trailingEditFieldStyle2 = FioriSliderTextFieldStyle(borderColor: Color.indigo, focusedBorderColor: Color.red)
            FioriSlider(
                title: AttributedString("Single Editable Range Slider (\(String(format: "%.0f", singleEditableRange.lowerBound)) - \(String(format: "%.0f", singleEditableRange.upperBound)))"),
                upperValue: self.$singleEditUpperValue,
                range: singleEditableRange,
                description: getInfoDescription(lowerValue: singleEditableRange.lowerBound, upperValue: self.singleEditUpperValue, range: singleEditableRange, decimalPlace: 0, defaultDesc: "The single editable slider accepts integer numbers."),
                onEditFieldFocusStatusChange: {
                    self.isEditFieldFocused2 = $0
                }
            )
            .titleStyle { configuration in
                configuration.title.foregroundStyle(self.isEditFieldFocused2 ? trailingEditFieldStyle2.focusedBorderColor : Color.black)
                    .font(.fiori(forTextStyle: .headline, weight: .black))
            }
            .descriptionStyle { configuration in
                configuration.description.foregroundStyle(.brown)
                    .font(.fiori(forTextStyle: .subheadline, weight: .regular))
            }
            .upperThumbStyle { configuration in
                configuration.upperThumb.foregroundStyle(Color.red)
            }
            .activeTrackStyle { configuration in
                configuration.activeTrack.foregroundStyle(Color.indigo)
            }
            .inactiveTrackStyle { configuration in
                configuration.inactiveTrack.foregroundStyle(Color.red)
            }
            .trailingAccessoryStyle(textFieldStyle: trailingEditFieldStyle2)
            .informationViewStyle(getInfoStyle(lowerValue: singleEditableRange.lowerBound, upperValue: self.singleEditUpperValue, range: singleEditableRange)).typeErased
            
            FioriSlider(
                title: AttributedString("Range Slider (0-50)"),
                lowerValue: self.$disabledLowerValue,
                upperValue: self.$disabledUpperValue,
                range: 0.0 ... 50.0,
                description: "Disabled range slider"
            )
            .titleStyle { configuration in
                configuration.title.foregroundStyle(.green)
                    .font(.fiori(forTextStyle: .title3, weight: .regular))
            }
            .descriptionStyle { configuration in
                configuration.description.foregroundStyle(.brown)
                    .font(.fiori(forTextStyle: .body, weight: .regular))
            }
            .lowerThumbStyle { configuration in
                configuration.lowerThumb.foregroundStyle(Color.yellow)
            }
            .upperThumbStyle { configuration in
                configuration.upperThumb.foregroundStyle(Color.orange)
            }
            .activeTrackStyle { configuration in
                configuration.activeTrack.foregroundStyle(Color.gray)
            }
            .inactiveTrackStyle { configuration in
                configuration.inactiveTrack.foregroundStyle(Color.brown)
            }
            .leadingAccessoryStyle(textFieldStyle: FioriSliderTextFieldStyle(disabledBorderColor: Color.orange))
            .trailingAccessoryStyle(textFieldStyle: FioriSliderTextFieldStyle(disabledBorderColor: Color.yellow))
            .disabled(true)
            
            FioriSlider(
                title: AttributedString("Slider (10-80)"),
                value: self.$disableEditValue,
                range: 10 ... 80,
                description: "Disabled slider"
            )
            .titleStyle { configuration in
                configuration.title.foregroundStyle(.cyan)
                    .font(.fiori(forTextStyle: .title2, weight: .regular))
            }
            .descriptionStyle { configuration in
                configuration.description.foregroundStyle(.brown)
                    .font(.fiori(forTextStyle: .footnote, weight: .bold))
            }
            .upperThumbStyle { configuration in
                configuration.upperThumb.foregroundStyle(Color.gray)
            }
            .activeTrackStyle { configuration in
                configuration.activeTrack.foregroundStyle(Color.green)
            }
            .inactiveTrackStyle { configuration in
                configuration.inactiveTrack.foregroundStyle(Color.black)
            }
            .trailingAccessoryStyle(textFieldStyle: FioriSliderTextFieldStyle(disabledBorderColor: .brown, font: Font.fiori(forTextStyle: .KPI)))
            .disabled(true)
            
            FioriSlider(
                title: AttributedString("Custom thumb range slider"),
                lowerValue: self.$customThumbLowerValue,
                upperValue: self.$customThumbUpperValue,
                lowerThumb: RoundedRectangle(cornerRadius: 20),
                upperThumb: Ellipse(),
                thumbHalfWidth: 8
            )
            .titleStyle { configuration in
                configuration.title.foregroundStyle(Color.red)
            }
            .lowerThumbStyle { configuration in
                configuration.lowerThumb
                    .frame(height: 40)
                    .foregroundStyle(Color.red)
            }
            .upperThumbStyle { configuration in
                configuration.upperThumb
                    .frame(height: 40)
                    .foregroundStyle(Color.green)
            }
            .activeTrackStyle { configuration in
                configuration.activeTrack
                    .frame(height: 8)
                    .foregroundStyle(Color.yellow)
            }
            .inactiveTrackStyle { configuration in
                configuration.inactiveTrack
                    .frame(height: 8)
                    .foregroundStyle(Color.brown)
            }
        }
        .listStyle(.plain)
    }
}

var outOfRangeValidationFormat = "The entered value '%@' is outside the possible range (%@)"

var rangeValueValidationFormat = "The lower value '%@' must be less than or equal to the upper value '%@'"

func getInfoStyle(value: Double, range: ClosedRange<Double>) -> any InformationViewStyle {
    (range ~= value) ? InformationViewFioriStyle.fiori : InformationViewErrorStyle.error
}

func getInfoDescription(_ value: Double, range: ClosedRange<Double>, decimalPlace: Int = 0, defaultDesc: String = "") -> AttributedString {
    AttributedString((range ~= value) ? defaultDesc : String(format: outOfRangeValidationFormat, String(format: "%.\(decimalPlace)f", value),
                                                             String(format: "%.\(decimalPlace)f-%.\(decimalPlace)f", range.lowerBound, range.upperBound)))
}

func getInfoStyle(lowerValue: Double, upperValue: Double, range: ClosedRange<Double>) -> any InformationViewStyle {
    let validation = !(range ~= lowerValue) || !(range ~= upperValue) || lowerValue > upperValue
    return validation ? InformationViewErrorStyle.error : InformationViewFioriStyle.fiori
}

func getInfoDescription(lowerValue: Double, upperValue: Double, range: ClosedRange<Double>, decimalPlace: Int = 0, defaultDesc: String = "") -> AttributedString {
    let rangeString = String(format: "%.\(decimalPlace)f-%.\(decimalPlace)f", range.lowerBound, range.upperBound)
    guard range ~= lowerValue else {
        return AttributedString(String(format: outOfRangeValidationFormat, String(format: "%.\(decimalPlace)f", lowerValue), rangeString))
    }
    guard range ~= upperValue else {
        return AttributedString(String(format: outOfRangeValidationFormat, String(format: "%.\(decimalPlace)f", upperValue), rangeString))
    }
    
    guard lowerValue <= upperValue else {
        return AttributedString(String(format: rangeValueValidationFormat, String(format: "%.\(decimalPlace)f", lowerValue), String(format: "%.\(decimalPlace)f", upperValue)))
    }
    
    return AttributedString(defaultDesc)
}

func getLetter(for value: Int) -> String {
    guard value > 0, value <= 26 else { return "A" }
    let unicodeValue = value + 64
    if let scalar = UnicodeScalar(unicodeValue) {
        return String(scalar)
    }
    return "A"
}

func getColor(_ value: Double) -> Color {
    let clampedValue = min(max(value, 0), 1)
    let red = (clampedValue == 0 || clampedValue == 1) ? clampedValue : 0.5 * sin(clampedValue * .pi * 2) + 0.5
    let green = (clampedValue == 0 || clampedValue == 1) ? clampedValue : 0.5 * sin(clampedValue * .pi * 2 + .pi / 2) + 0.5
    let blue = (clampedValue == 0 || clampedValue == 1) ? 0.233 : 0.5 * sin(clampedValue * .pi * 2 + .pi) + 0.5
    
    return Color(red: red, green: green, blue: blue)
}

struct ColorPickerView: View {
    @Binding var value: Double
    var step: Double
    
    var body: some View {
        getColor(self.value)
            .frame(width: 40, height: 30)
            .cornerRadius(8)
    }
}

struct ColorDemoViewStyle: View {
    @Binding var lowerValue: Double
    @Binding var upperValue: Double
    
    var body: some View {
        ZStack {
            FioriIcon.people.customer
                .font(.fiori(forTextStyle: .title1))
                .foregroundStyle(getColor(self.lowerValue))
                .background(
                    Circle().fill(getColor(self.upperValue))
                )
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(getColor(self.upperValue), lineWidth: 3)
                )
        }
    }
}

struct MyAccessibilityTextView: View {
    @State var leadingText: String = "30"
    @State var trailingText: String = "40"
    
    var body: some View {
        HStack {
            let size1 = self.calculateTextSize(isLeading: true)
            TextField("", text: self.$leadingText)
                .font(Font.fiori(forTextStyle: .body))
                .multilineTextAlignment(.center)
                .frame(width: size1.width + 32, height: size1.height + 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.preferredColor(.quaternaryLabel), lineWidth: 2)
                )
                .accessibilitySortPriority(2)
            
            GeometryReader { geometry in
                ZStack {
                    Color.clear
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .accessibilitySortPriority(4)
                    
                    Capsule()
                        .fill(Color.blue)
                        .frame(width: geometry.size.width, height: 4)
                        .accessibilityHidden(true)
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 12 * 2, height: 12 * 2)
                        .position(
                            x: geometry.size.width / 2 - 6,
                            y: geometry.size.height / 2
                        )
                        .accessibilitySortPriority(3)
                }
            }
            .frame(height: 44)
            
            let size = self.calculateTextSize(isLeading: false)
            TextField("", text: self.$trailingText)
                .font(Font.fiori(forTextStyle: .body))
                .multilineTextAlignment(.center)
                .frame(width: size.width + 32, height: size.height + 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.preferredColor(.quaternaryLabel), lineWidth: 2)
                )
                .accessibilitySortPriority(1)
        }
        .accessibilityElement(children: .contain)
    }
    
    func calculateTextSize(isLeading: Bool) -> CGSize {
        let target = isLeading ? self.leadingText : self.trailingText
        let attributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body)]
        let size = target.size(withAttributes: attributes)
        return size
    }
}
