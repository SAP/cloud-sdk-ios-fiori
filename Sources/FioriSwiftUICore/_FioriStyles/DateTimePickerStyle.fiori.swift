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
public struct DateTimePickerBaseStyle: DateTimePickerStyle {
    @State var dateString: String = "No date selected"
    @State var pickerVisible: Bool = false
    
    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        // Add default layout here
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
            // Add default style for its content
            // .background()
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let dateTimePickerConfiguration: DateTimePickerConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                // Add default style for Title
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
