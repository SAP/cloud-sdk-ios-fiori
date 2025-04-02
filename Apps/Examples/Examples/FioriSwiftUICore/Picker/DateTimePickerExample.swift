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
    @State var isRequired = false
    @State var showsErrorMessage = false
    @State var customizedMandatoryIndicator = false
    @State var isEnabled = true
    
    struct CustomTitleStyle: TitleStyle {
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .title3))
                .foregroundStyle(Color.preferredColor(.indigo7))
        }
    }
    
    func mandatoryField() -> TextOrIcon? {
        var indicator = AttributedString("*")
        if self.customizedMandatoryIndicator {
            indicator = AttributedString("##")
            indicator.foregroundColor = self.isEnabled ? Color.green : .preferredColor(.quaternaryLabel)
        } else {
            indicator.foregroundColor = .preferredColor(self.isEnabled ? .primaryLabel : .quinaryLabel)
        }
        indicator.font = .headline
        return .text(indicator)
    }
    
    struct CustomValueLabelStyle: ValueLabelStyle {
        func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
            ValueLabel(configuration)
                .font(.fiori(forTextStyle: .callout))
                .foregroundStyle(Color.preferredColor(.green7))
        }
    }
    
    var body: some View {
        List {
            Toggle("Mandatory Field", isOn: self.$isRequired)
            Toggle("Customized Mandatory Indicator", isOn: self.$customizedMandatoryIndicator)
            Toggle("Enabled", isOn: self.$isEnabled)
            Toggle("Show Error/Hint message", isOn: self.$showsErrorMessage)
            Section(header: Text("")) {
                DateTimePicker(title: "Default", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.isRequired, controlState: self.isEnabled ? .normal : .disabled, selectedDate: self.$s1)
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("The Date should be before December."))
                    .informationViewStyle(.informational)
                DateTimePicker(title: "Date only", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.isRequired, controlState: self.isEnabled ? .normal : .disabled, selectedDate: self.$s2, pickerComponents: [.date])
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("The Date should be before December."))
                    .informationViewStyle(.error)
                DateTimePicker(title: "Time only", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.isRequired, controlState: self.isEnabled ? .normal : .disabled, selectedDate: self.$s3, pickerComponents: [.hourAndMinute])
                DateTimePicker(title: "Numeric Date Style", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.isRequired, controlState: self.isEnabled ? .normal : .disabled, selectedDate: self.$s4, pickerComponents: [.date], dateStyle: .numeric)
                DateTimePicker(title: "Long long long long long long label", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.isRequired, controlState: self.isEnabled ? .normal : .disabled, selectedDate: self.$s5)
                DateTimePicker(title: "Custom Style", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.isRequired, controlState: self.isEnabled ? .normal : .disabled, selectedDate: self.$s6)
                    .titleStyle(CustomTitleStyle())
                    .valueLabelStyle(CustomValueLabelStyle())
            }
            Section(header: Text("Disabled")) {
                DateTimePicker(title: "In Disabled Mode", controlState: .disabled, selectedDate: self.$s7)
                    .disabled(true)
            }
            Section(header: Text("Read Only")) {
                DateTimePicker(title: "In Read-Only Mode", controlState: .readOnly, selectedDate: self.$s7, pickerComponents: [.date])
            }
        }
    }
}

struct DateTimePickerExample_Previews: PreviewProvider {
    static var previews: some View {
        DateTimePickerExample()
    }
}
