import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DateTimePickerBaseStyle: DateTimePickerStyle {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
   
    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        VStack {
            VStack(spacing: 0) {
                Group {
                    if self.dynamicTypeSize >= .accessibility3 {
                        self.configureMainStack(configuration, isVertical: true)
                    } else {
                        ViewThatFits(in: .horizontal) {
                            self.configureMainStack(configuration, isVertical: false)
                            self.configureMainStack(configuration, isVertical: true)
                        }
                    }
                }
                .animation(nil, value: configuration.pickerVisible)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.top, 8)
                
                if configuration.pickerVisible {
                    LazyVStack {
                        Divider()
                            .frame(height: 0.33)
                            .foregroundStyle(Color.preferredColor(.separatorOpaque))
                        self.showPicker(configuration)
                    }
                    .transition(.opacity.combined(with: .scale(scale: 1.0, anchor: .top)))
                }
            }
            .animation(.easeInOut(duration: 0.3), value: configuration.pickerVisible)
        }
    }
    
    func configureMainStack(_ configuration: DateTimePickerConfiguration, isVertical: Bool) -> some View {
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
                if configuration.selectedDate == Date(timeIntervalSince1970: 0.0) {
                    configuration.selectedDate = Date()
                }
                configuration.pickerVisible.toggle()
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
        } else if configuration.pickerVisible {
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
