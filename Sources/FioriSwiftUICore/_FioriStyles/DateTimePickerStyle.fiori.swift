import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DateTimePickerBaseStyle: DateTimePickerStyle {
    @State var dateString: String = NSLocalizedString("No date selected", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
    @State var pickerVisible: Bool = false
    
    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        VStack {
            HStack {
                HStack(spacing: 0) {
                    configuration.title
                    if configuration.isRequired {
                        configuration.mandatoryFieldIndicator
                    }
                    Spacer()
                }
                Spacer()
                ValueLabel(valueLabel: AttributedString(self.getValueLabel(configuration)))
                    .foregroundStyle(self.getFontColor(configuration))
                    .font(.fiori(forTextStyle: .body))
            }
            .padding(.vertical, 12)
            .contentShape(Rectangle())
            .ifApply(configuration.controlState != .disabled && configuration.controlState != .readOnly) {
                $0.onTapGesture(perform: {
                    if configuration.selectedDate == Date(timeIntervalSince1970: 0.0) {
                        configuration.selectedDate = Date()
                    }
                    self.pickerVisible.toggle()
                })
            }
            if self.pickerVisible {
                Divider()
                    .frame(height: 0.33)
                    .foregroundStyle(Color.preferredColor(.separatorOpaque))
                    .padding(.leading, 16)
                self.showPicker(configuration)
            }
        }
        .accessibilityElement()
    }
    
    func getValueLabel(_ configuration: DateTimePickerConfiguration) -> String {
        if configuration.selectedDate != Date(timeIntervalSince1970: 0.0) {
            let formattedDate = configuration.selectedDate.formatted(date: .abbreviated, time: .omitted)
            let formattedTime = configuration.selectedDate.formatted(date: .omitted, time: .shortened)
            if configuration.pickerComponents == .date {
                return formattedDate
            } else if configuration.pickerComponents == .hourAndMinute {
                return formattedTime
            } else {
                return formattedDate + "   " + formattedTime
            }
        }
        return self.dateString
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
        let picker = DatePicker("", selection: configuration.$selectedDate, displayedComponents: configuration.pickerComponents)
            .datePickerStyle(.graphical)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .onChange(of: configuration.selectedDate, perform: { _ in
                self.formatDate(configuration)
            })
        return picker
    }
    
    func formatDate(_ configuration: DateTimePickerConfiguration) {
        let formattedDate = configuration.selectedDate.formatted(date: .abbreviated, time: .omitted)
        let formattedTime = configuration.selectedDate.formatted(date: .omitted, time: .shortened)
        if configuration.pickerComponents == .date {
            self.dateString = formattedDate
        } else if configuration.pickerComponents == .hourAndMinute {
            self.dateString = formattedTime
        } else {
            self.dateString = formattedDate + "   " + formattedTime
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
                .foregroundStyle(Color.preferredColor(self.dateTimePickerConfiguration.controlState == .disabled ? .separator : .primaryLabel))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        }
    }
    
    struct ValueLabelFioriStyle: ValueLabelStyle {
        let dateTimePickerConfiguration: DateTimePickerConfiguration
    
        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
        }
    }
    
    struct MandatoryFieldIndicatorFioriStyle: MandatoryFieldIndicatorStyle {
        let dateTimePickerConfiguration: DateTimePickerConfiguration
        
        func makeBody(_ configuration: MandatoryFieldIndicatorConfiguration) -> some View {
            MandatoryFieldIndicator(configuration)
                .foregroundStyle(Color.preferredColor(self.dateTimePickerConfiguration.controlState == .disabled ? .separator : .primaryLabel))
        }
    }
    
    struct FormViewFioriStyle: FormViewStyle {
        let dateTimePickerConfiguration: DateTimePickerConfiguration
        
        func makeBody(_ configuration: FormViewConfiguration) -> some View {
            FormView(configuration)
        }
    }
}
