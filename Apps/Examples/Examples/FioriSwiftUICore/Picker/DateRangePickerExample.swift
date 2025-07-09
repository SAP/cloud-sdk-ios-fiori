import FioriSwiftUICore
import Foundation
import SwiftUI

struct DateRangePickerExample: View {
    @State private var isRequired = false
    @State private var customizedMandatoryIndicator = false
    @State private var showsErrorMessage = false
    @State private var showAINotice: Bool = false
    @State private var pickerVisible0 = false
    @State private var pickerVisible1 = false
    @State private var pickerVisible2 = false
    @State private var pickerVisible3 = false
    @State private var pickerVisible4 = false
    @State private var pickerVisible5 = false
    
    // Limit the selectable dates from last seven days to next seven days
    private var limitDateRange: Range<Date> = Date(timeIntervalSinceNow: -60 * 60 * 24 * 7) ..< Date(timeIntervalSinceNow: 60 * 60 * 24 * 7)
    
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
    
    var managePickerVisibleBinding: Binding<Bool> {
        Binding {
            [self.pickerVisible0, self.pickerVisible1, self.pickerVisible2, self.pickerVisible3, self.pickerVisible4, self.pickerVisible5].allSatisfy { $0 }
        } set: { newValue in
            self.pickerVisible0 = newValue
            self.pickerVisible1 = newValue
            self.pickerVisible2 = newValue
            self.pickerVisible3 = newValue
            self.pickerVisible4 = newValue
            self.pickerVisible5 = newValue
        }
    }
    
    func mandatoryFieldIndicator(_ disabled: Bool = false) -> TextOrIcon {
        var indicator = AttributedString(self.customizedMandatoryIndicator ? "#" : "*")
        if self.customizedMandatoryIndicator, !disabled {
            indicator.font = .fiori(forTextStyle: .title3)
            indicator.foregroundColor = Color.preferredColor(.indigo7)
        }
        return .text(indicator)
    }
    
    @State var selectedRange0: ClosedRange<Date>?
    @State var selectedRange1: ClosedRange<Date>? = Date.now ... Date(timeIntervalSinceNow: 24 * 60 * 60 * 2)
    @State var selectedRange2: ClosedRange<Date>?
    @State var selectedRange3: ClosedRange<Date>? = Date.now ... Date(timeIntervalSinceNow: 24 * 60 * 60 * 80)
    @State var selectedRange4: ClosedRange<Date>? = Date.now ... Date(timeIntervalSinceNow: 24 * 60 * 60 * 10)
    @State var selectedRange5: ClosedRange<Date>? = Date.now ... Date.now
    
    let customizedDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter
    }()
    
    var body: some View {
        List {
            Toggle("Mandatory Field", isOn: self.$isRequired)
                .tint(Color.preferredColor(.tintColor))
            if self.isRequired {
                Toggle("Customized Mandatory Indicator", isOn: self.$customizedMandatoryIndicator)
                    .tint(Color.preferredColor(.tintColor))
            }
            Toggle("Show Error/Hint message", isOn: self.$showsErrorMessage)
                .tint(Color.preferredColor(.tintColor))
            Toggle("AI Notice", isOn: self.$showAINotice)
                .tint(Color.preferredColor(.tintColor))
            Toggle("Picker Visible", isOn: self.managePickerVisibleBinding)
                .tint(Color.preferredColor(.tintColor))
            Section(header: Text("")) {
                DateRangePicker(title: "Range Selection Long Title Long Title Long Title Long Title Long Title Long Title0", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selectedRange: self.$selectedRange0, pickerVisible: self.$pickerVisible0)
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("This is information error message."))
                    .informationViewStyle(.error)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
                
                DateRangePicker(title: "Range Selection1", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selectedRange: self.$selectedRange1, pickerVisible: self.$pickerVisible1)
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("This is information hint message."))
                    .informationViewStyle(.informational)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
                    .titleStyle(CustomTitleStyle())
                    .valueLabelStyle(CustomValueLabelStyle())
                
                DateRangePicker(title: "Limit inclusive range of selectable dates", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, range: self.limitDateRange, selectedRange: self.$selectedRange2, noRangeSelectedString: "Please select range", pickerVisible: self.$pickerVisible2)
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("This is information warning message."))
                    .informationViewStyle(.warning)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
                
                DateRangePicker(title: "Customized Date Formatter", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selectedRange: self.$selectedRange3, rangeFormatter: self.customizedDateFormatter, pickerVisible: self.$pickerVisible3)
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("This is information success message."))
                    .informationViewStyle(.success)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
                
                DateRangePicker(title: "Custom Locale In Simple Chinese", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selectedRange: self.$selectedRange4, pickerVisible: self.$pickerVisible4)
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("This is information hint message."))
                    .informationViewStyle(.informational)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
                    .environment(\.locale, Locale(identifier: "zh-Hans"))
            
                DateRangePicker(title: "Range Selection in Disabled Control State", mandatoryFieldIndicator: self.mandatoryFieldIndicator(true), isRequired: self.isRequired, controlState: .disabled, selectedRange: self.$selectedRange5, pickerVisible: self.$pickerVisible5)
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("This is information success message."))
                    .informationViewStyle(.success)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
            }
        }
        .onChange(of: self.selectedRange0) { _, newValue in
            print("selectedRange0 new Value:\(self.getValueLabel(newValue))")
        }
        .onChange(of: self.selectedRange1) { _, newValue in
            print("selectedRange1 new Value:\(self.getValueLabel(newValue))")
        }
        .onChange(of: self.selectedRange2) { _, newValue in
            print("selectedRange2 new Value:\(self.getValueLabel(newValue))")
        }
        .onChange(of: self.selectedRange3) { _, newValue in
            print("selectedRange3 new Value:\(self.getValueLabel(newValue))")
        }
        .onChange(of: self.selectedRange4) { _, newValue in
            print("selectedRange4 new Value:\(self.getValueLabel(newValue))")
        }
        .onChange(of: self.selectedRange5) { _, newValue in
            print("selectedRange5 new Value:\(self.getValueLabel(newValue))")
        }
        .navigationTitle("Date Range Picker")
    }

    private func getValueLabel(_ selectedRange: ClosedRange<Date>?) -> String {
        if let startDate = selectedRange?.lowerBound,
           let endDate = selectedRange?.upperBound
        {
            let valueDescDateFormatter = DateFormatter()
            valueDescDateFormatter.timeZone = Calendar.current.timeZone
            valueDescDateFormatter.locale = Calendar.current.locale
            valueDescDateFormatter.dateStyle = .short
            valueDescDateFormatter.timeStyle = .none
            let startDateStr = valueDescDateFormatter.string(from: startDate)
            let endDateStr = valueDescDateFormatter.string(from: endDate)
            
            return "\(startDateStr) – \(endDateStr)"
        } else {
            return "No range selected"
        }
    }
}

struct DateRangePickerExample_Previews: PreviewProvider {
    static var previews: some View {
        DateRangePickerExample()
    }
}
