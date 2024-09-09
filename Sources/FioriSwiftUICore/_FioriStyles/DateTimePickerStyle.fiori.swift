import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DateTimePickerBaseStyle: DateTimePickerStyle {
    @State var dateString: String = "No date selected"
    @State var pickerVisible: Bool = false
    
    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        VStack {
            HStack {
                configuration.title
                Spacer()
                ValueLabel(valueLabel: AttributedString(self.dateString))
                    .foregroundStyle(Color.preferredColor(self.pickerVisible ? .tintColor : .primaryLabel))
                    .font(.fiori(forTextStyle: .body))
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            .contentShape(Rectangle())
            .onTapGesture(perform: {
                self.pickerVisible.toggle()
            })
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
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
        }
    }
    
    struct ValueLabelFioriStyle: ValueLabelStyle {
        let dateTimePickerConfiguration: DateTimePickerConfiguration
    
        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
        }
    }
}
