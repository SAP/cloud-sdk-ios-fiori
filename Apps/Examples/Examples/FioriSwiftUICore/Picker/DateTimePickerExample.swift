import FioriSwiftUICore
import Foundation
import SwiftUI

struct DateTimePickerExample: View {
    @State var s1: Date = .init(timeIntervalSince1970: 0.0)
    @State var s2: Date = .init()
    @State var s3: Date = .init()
    @State var s4: Date = .init()
    @State var s5: Date = .now
    @State var s6: Date = .now
    @State var s7: Date = .now
    @State var limitedDate: Date = .now
    @State var isRequired = false
    @State var showsErrorMessage = false
    @State var showAINotice: Bool = false
    @State var pickerVisible = false
    @State var pickerVisible1 = false
    @State var pickerVisible2 = false
    @State var pickerVisible3 = false
    @State var pickerVisible4 = false
    @State var pickerVisible5 = false
    @State var limitedDatePickerVisible = false
    
    // Limit the selectable dates from last seven days to next seven days
    var limitDateRange: ClosedRange<Date> = Date(timeIntervalSinceNow: -60 * 60 * 24 * 7) ... Date(timeIntervalSinceNow: 60 * 60 * 24 * 7)
    
    struct CustomTitleStyle: TitleStyle {
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .title3))
                .foregroundStyle(Color.preferredColor(.indigo7))
        }
    }
    
    struct CustomValueLabelStyle: ValueLabelStyle {
        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
                .font(.fiori(forTextStyle: .callout))
                .foregroundStyle(Color.preferredColor(.green7))
        }
    }
    
    var masterPickerVisibleBinding: Binding<Bool> {
        Binding {
            [self.pickerVisible, self.pickerVisible1, self.pickerVisible2, self.pickerVisible3, self.pickerVisible4, self.pickerVisible5].allSatisfy { $0 }
        } set: { newValue in
            self.pickerVisible = newValue
            self.pickerVisible1 = newValue
            self.pickerVisible2 = newValue
            self.pickerVisible3 = newValue
            self.pickerVisible4 = newValue
            self.pickerVisible5 = newValue
        }
    }
    
    func mandatoryFieldIndicator() -> TextOrIcon {
        var indicator = AttributedString("*")
        indicator.font = .fiori(forTextStyle: .title3)
        indicator.foregroundColor = Color.preferredColor(.indigo7)
        return .text(indicator)
    }
    
    var body: some View {
        List {
            Toggle("Mandatory Field", isOn: self.$isRequired)
            Toggle("Show Error/Hint message", isOn: self.$showsErrorMessage)
            Toggle("AI Notice", isOn: self.$showAINotice)
            Toggle("Picker Visible", isOn: self.masterPickerVisibleBinding)
            Section(header: Text("")) {
                DateTimePicker(title: "Default", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selectedDate: self.$s1, pickerVisible: self.$pickerVisible)
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("The Date should be before December."))
                    .informationViewStyle(.informational)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
                DateTimePicker(title: "Date only", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selectedDate: self.$s2, pickerComponents: [.date], pickerVisible: self.$pickerVisible1)
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("The Date should be before December."))
                    .informationViewStyle(.error)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
                DateTimePicker(title: "Time only", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selectedDate: self.$s3, pickerComponents: [.hourAndMinute], pickerVisible: self.$pickerVisible2)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
                DateTimePicker(title: "Numeric Date Style", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selectedDate: self.$s4, pickerComponents: [.date], dateStyle: .numeric, pickerVisible: self.$pickerVisible3)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
                DateTimePicker(title: "Long long long long long long label", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selectedDate: self.$s5, pickerVisible: self.$pickerVisible4)
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("The Date should be before December."))
                    .informationViewStyle(.error)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
                DateTimePicker(title: "Custom Style", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selectedDate: self.$s6, pickerVisible: self.$pickerVisible5)
                    .titleStyle(CustomTitleStyle())
                    .valueLabelStyle(CustomValueLabelStyle())
            }
            Section(header: Text("Disabled")) {
                DateTimePicker(title: "In Disabled Mode", controlState: .disabled, selectedDate: self.$s7, pickerVisible: self.$pickerVisible)
                    .disabled(true)
            }
            Section(header: Text("Read Only")) {
                DateTimePicker(title: "In Read-Only Mode", controlState: .readOnly, selectedDate: self.$s7, pickerComponents: [.date], pickerVisible: self.$pickerVisible)
            }
            Section {
                DateTimePicker(title: "Limit Selectable Dates", range: self.limitDateRange, selectedDate: self.$limitedDate, pickerVisible: self.$limitedDatePickerVisible)
            } header: {
                Text("Range")
                    .textCase(.none)
            }
        }
    }
}

struct DateTimePickerExample_Previews: PreviewProvider {
    static var previews: some View {
        DateTimePickerExample()
    }
}
