import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DateTimePickerBaseStyle: DateTimePickerStyle {
    @State var pickerVisible: Bool = false
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
   
    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        VStack {
            if self.dynamicTypeSize >= .accessibility3 {
                self.configureMainStack(configuration, isVertical: true)
            } else {
                ViewThatFits {
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
    
    func configureMainStack(_ configuration: DateTimePickerConfiguration, isVertical: Bool) -> some View {
        let mainStack = isVertical ? AnyLayout(VStackLayout(alignment: .leading, spacing: 3)) : AnyLayout(HStackLayout())
        return mainStack {
            HStack(spacing: 0) {
                configuration.title
            }
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
                if configuration.selectedDate == Date(timeIntervalSince1970: 0.0) {
                    configuration.selectedDate = Date()
                }
                self.pickerVisible.toggle()
            })
        }
    }

    func getValueLabel(_ configuration: DateTimePickerConfiguration) -> String {
        if configuration.selectedDate != Date(timeIntervalSince1970: 0.0) {
            let formattedDate = configuration.selectedDate.formatted(date: configuration.dateStyle, time: .omitted)
            let formattedTime = configuration.selectedDate.formatted(date: .omitted, time: configuration.timeStyle)
            if configuration.pickerComponents == .date {
                return formattedDate
            } else if configuration.pickerComponents == .hourAndMinute {
                return formattedTime
            } else {
                return formattedDate + "   " + formattedTime
            }
        }
        return configuration.noDateSelectedString ?? NSLocalizedString("No date selected", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
    }
    
    func getFontColor(_ configuration: DateTimePickerConfiguration) -> Color {
        if configuration.controlState == .disabled {
            return .preferredColor(.separator)
        } else if self.pickerVisible {
            return .preferredColor(.tintColor)
        } else {
            return .preferredColor(.primaryLabel)
        }
    }
    
    func showPicker(_ configuration: DateTimePickerConfiguration) -> some View {
        DatePicker("", selection: configuration.$selectedDate, displayedComponents: configuration.pickerComponents)
            .datePickerStyle(.graphical)
            .setOnChange(of: configuration.selectedDate) {
                _ = self.getValueLabel(configuration)
            }
    }
}

// Default fiori styles
extension DateTimePickerFioriStyle {
    struct ContentFioriStyle: DateTimePickerStyle {
        func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
            DateTimePicker(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let dateTimePickerConfiguration: DateTimePickerConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(self.dateTimePickerConfiguration.controlState == .disabled ? .quaternaryLabel : .primaryLabel))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        }
    }
    
    struct ValueLabelFioriStyle: ValueLabelStyle {
        let dateTimePickerConfiguration: DateTimePickerConfiguration
    
        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
        }
    }
    
    struct FormViewFioriStyle: FormViewStyle {
        let dateTimePickerConfiguration: DateTimePickerConfiguration
        
        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}

public extension DateTimePicker {
    init(title: AttributedString,
         valueLabel: AttributedString? = nil,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         selectedDate: Binding<Date>,
         pickerComponents: DatePicker.Components = [.date, .hourAndMinute],
         dateStyle: Date.FormatStyle.DateStyle = .abbreviated,
         timeStyle: Date.FormatStyle.TimeStyle = .shortened,
         noDateSelectedString: String? = nil)
    {
        self.init(title: {
            Group {
                if let mandatoryField = mandatoryFieldIndicator, isRequired {
                    switch mandatoryField {
                    case .text(let attributedString):
                        Text(title) + Text(attributedString).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field"))
                    case .icon(let image):
                        Text(title) + Text(image).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field"))
                    case .both(let attributedString, let image):
                        Text(title) + Text(attributedString) + Text(image).accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field"))
                    }
                } else {
                    Text(title)
                }
            }.typeErased
        }, valueLabel: { OptionalText(valueLabel) }, controlState: controlState, errorMessage: errorMessage, selectedDate: selectedDate, pickerComponents: pickerComponents, dateStyle: dateStyle, timeStyle: timeStyle, noDateSelectedString: noDateSelectedString)
    }
}
