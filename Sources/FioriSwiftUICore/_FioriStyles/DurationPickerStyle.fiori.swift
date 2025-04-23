import FioriThemeManager
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
public struct DurationPickerBaseStyle: DurationPickerStyle {
    @State var pickerVisible: Bool = false
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    public func makeBody(_ configuration: DurationPickerConfiguration) -> some View {
        VStack {
            if self.dynamicTypeSize >= .accessibility3 {
                self.configureMainStack(configuration, isVertical: true)
            } else {
                ViewThatFits(in: .horizontal) {
                    self.configureMainStack(configuration, isVertical: false)
                    self.configureMainStack(configuration, isVertical: true)
                }
            }
            if self.pickerVisible {
                Divider()
                    .frame(height: 0.33)
                    .foregroundStyle(Color.preferredColor(.separatorOpaque))
                self.showPicker(configuration)
            }
        }
    }
    
    func configureMainStack(_ configuration: DurationPickerConfiguration, isVertical: Bool) -> some View {
        let mainStack = isVertical ? AnyLayout(VStackLayout(alignment: .leading, spacing: 3)) : AnyLayout(HStackLayout())
        return mainStack {
            configuration.title
            if !isVertical {
                Spacer()
            } else {
                Divider().hidden()
            }
            ValueLabel(valueLabel: AttributedString(self.getValueLabel(configuration)))
                .foregroundStyle(self.getFontColor(configuration))
                .font(.fiori(forTextStyle: .body))
                .accessibilityLabel(self.getValueLabel(configuration))
        }
        .accessibilityElement(children: .combine)
        .contentShape(Rectangle())
        .ifApply(configuration.controlState != .disabled && configuration.controlState != .readOnly) {
            $0.onTapGesture(perform: {
                self.pickerVisible.toggle()
            })
        }
    }

    func getValueLabel(_ configuration: DurationPickerConfiguration) -> String {
        let formatter = NSLocalizedString("%d Hrs %d Min", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        let hour = configuration.selection / 60
        let minute = configuration.selection % 60

        return String(format: formatter, hour, minute)
    }
    
    func getFontColor(_ configuration: DurationPickerConfiguration) -> Color {
        if configuration.controlState == .disabled {
            return .preferredColor(.separator)
        } else if self.pickerVisible {
            return .preferredColor(.tintColor)
        } else {
            return .preferredColor(.primaryLabel)
        }
    }
    
    func showPicker(_ configuration: DurationPickerConfiguration) -> some View {
        DurationPickerViewWrapper(selection: configuration.$selection, maximumMinutes: configuration.maximumMinutes, minimumMinutes: configuration.minimumMinutes, minuteInterval: configuration.minuteInterval, measurementFormatter: configuration.measurementFormatter)
            .frame(width: 232, height: 204)
            .background(Color.preferredColor(.primaryBackground))
            .foregroundColor(Color.preferredColor(.primaryLabel))
            .setOnChange(of: configuration.selection) {
                _ = self.getValueLabel(configuration)
            }
    }
}

// Default fiori styles
extension DurationPickerFioriStyle {
    struct ContentFioriStyle: DurationPickerStyle {
        func makeBody(_ configuration: DurationPickerConfiguration) -> some View {
            DurationPicker(configuration)
            // Add default style for its content
            // .background()
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let durationPickerConfiguration: DurationPickerConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(self.durationPickerConfiguration.controlState == .disabled ? .quaternaryLabel : .primaryLabel))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        }
    }
    
    struct ValueLabelFioriStyle: ValueLabelStyle {
        let durationPickerConfiguration: DurationPickerConfiguration

        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
            // Add default style for ValueLabel
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct FormViewFioriStyle: FormViewStyle {
        let durationPickerConfiguration: DurationPickerConfiguration

        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
            // Add default style for FormView
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}

/// The key for measurement formatter of duration picker in the environment.
struct MeasurementFormatterKey: EnvironmentKey {
    static var defaultValue: MeasurementFormatter = .init()
}

public extension EnvironmentValues {
    /// The formatter for duration picker.
    var measurementFormatter: MeasurementFormatter {
        get {
            self[MeasurementFormatterKey.self]
        }
        set {
            self[MeasurementFormatterKey.self] = newValue
        }
    }
}

public extension View {
    /// Set measurement formatter for duration picker.
    /// ```swift
    /// @State var selection: Int = 0
    /// var formatter: MeasurementFormatter {
    /// let formatter = MeasurementFormatter()
    ///     formatter.locale = Locale(identifier: "zh-CN")
    ///     formatter.unitStyle = .long
    ///     formatter.unitOptions = .providedUnit
    ///     return formatter
    /// }
    /// DurationPicker(selection: self.$selection, maximumMinutes: 124, minimumMinutes: 60, minuteInterval: 2)
    ///     .measurementFormatter(self.formatter)
    /// ```
    /// - Parameter formatter: The measurement formatter for duration picker.
    /// - Returns: A view with specified measurement formatter.
    func measurementFormatter(_ formatter: MeasurementFormatter) -> some View {
        environment(\.measurementFormatter, formatter)
    }
}
