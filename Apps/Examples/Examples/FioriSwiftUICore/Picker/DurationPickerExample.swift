import FioriSwiftUICore
import SwiftUI

struct DurationPickerExample: View {
    @State var selection1: Int = 0
    @State var selection2: Int = 244
    @State var selection3: Int = 100
    @State var selection4: Int = 0
    @State var selection5: Int = 0
    @State var selection6: Int = 0
    @State var selection7: Int = 0
    @State var isRequired = false
    @State var showsErrorMessage = false
    @State var showAINotice: Bool = false

    var formatter: MeasurementFormatter {
        let formatter = MeasurementFormatter()
        formatter.locale = Locale(identifier: "zh-CN")
        formatter.unitStyle = .long
        formatter.unitOptions = .providedUnit
        return formatter
    }
    
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

            Section {
                DurationPicker(title: "Default", selection: self.$selection1)
                
                DurationPicker(title: "MinuteInterval", selection: self.$selection2, minimumMinutes: 1, minuteInterval: 2)
                
                DurationPicker(title: "Measurement Formatter", selection: self.$selection3, maximumMinutes: 124, minimumMinutes: 60, minuteInterval: 2)
                    .measurementFormatter(self.formatter)
                
                DurationPicker(title: "Measurement Formatter", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selection: self.$selection4)
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("Some error message."))
                    .informationViewStyle(.informational)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
                
                DurationPicker(title: "Long long long long long long long long label", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selection: self.$selection5)
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("Some error message."))
                    .informationViewStyle(.error)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
                
                DurationPicker(title: "Custom Style", mandatoryFieldIndicator: self.mandatoryFieldIndicator(), isRequired: self.isRequired, selection: self.$selection6)
                    .titleStyle(CustomTitleStyle())
                    .valueLabelStyle(CustomValueLabelStyle())
            } header: {
                Text("")
            }
            Section {
                DurationPicker(title: "In Disabled Mode", controlState: .disabled, selection: self.$selection7)
                    .disabled(true)
            } header: {
                Text("Disabled")
            }
            Section {
                DurationPicker(title: "In Read-Only Mode", controlState: .readOnly, selection: self.$selection7)
            } header: {
                Text("Read Only")
            }
        }
    }
}

struct DurationPickerExample_Previews: PreviewProvider {
    static var previews: some View {
        DurationPickerExample()
    }
}
