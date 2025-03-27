import FioriSwiftUICore
import SwiftUI

struct TitleWithOptionalMandatoryFieldExample: View {
    @State private var isLongTitle = false
    @State private var showMandatoryField = false
    @State private var isCustomizedMandatory = false
    @State private var isEnabled = true
    @State private var mandatoryType = 0
    
    @State private var mandatoryTypeOptions = ["text", "icon", "both"]
    
    private func customizedMandatoryFieldText() -> AttributedString {
        var customizedMandatoryField = AttributedString("#")
        customizedMandatoryField.font = .subheadline
        customizedMandatoryField.foregroundColor = self.isEnabled ? .red : .preferredColor(.quaternaryLabel)
        return customizedMandatoryField
    }
        
    var body: some View {
        List {
            Section {
                Toggle(isOn: self.$isEnabled) {
                    Text("Enabled")
                }
                Toggle(isOn: self.$isLongTitle) {
                    Text("Long title")
                }
                Toggle(isOn: self.$showMandatoryField) {
                    Text("Mandatory Field")
                }
                if self.showMandatoryField {
                    Toggle(isOn: self.$isCustomizedMandatory) {
                        Text("Customized Mandatory")
                    }
                    
                    if self.isCustomizedMandatory {
                        Picker("Customized Mandatory Type", selection: self.$mandatoryType) {
                            ForEach(self.mandatoryTypeOptions.indices, id: \.self) { index in
                                Text(self.mandatoryTypeOptions[index]).tag(index)
                            }
                        }
                    }
                }
            }
            
            Section {
                if self.isCustomizedMandatory {
                    TitleWithOptionalMandatoryField(title: self.title(), isRequired: self.showMandatoryField, mandatoryField: self.customizedMandatoryField())
                        .titleWithOptionalMandatoryFieldStyle { conf in
                            TitleWithOptionalMandatoryField(conf)
                                .foregroundStyle(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.quaternaryLabel))
                        }
                } else {
                    TitleWithOptionalMandatoryField(title: self.title(), isRequired: self.showMandatoryField)
                        .titleWithOptionalMandatoryFieldStyle { conf in
                            TitleWithOptionalMandatoryField(conf)
                                .foregroundStyle(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.quaternaryLabel))
                        }
                }
            }
            
            Section {
                if self.isCustomizedMandatory {
                    TitleWithOptionalMandatoryField(title: self.title(), isRequired: self.showMandatoryField, mandatoryField: self.customizedMandatoryField())
                        .titleWithOptionalMandatoryFieldStyle { conf in
                            TitleWithOptionalMandatoryField(conf)
                                .foregroundStyle(self.isEnabled ? Color.blue : Color.preferredColor(.quaternaryLabel))
                        }
                } else {
                    TitleWithOptionalMandatoryField(title: self.title(), isRequired: self.showMandatoryField)
                        .titleWithOptionalMandatoryFieldStyle { conf in
                            TitleWithOptionalMandatoryField(conf)
                                .foregroundStyle(self.isEnabled ? Color.blue : Color.preferredColor(.quaternaryLabel))
                        }
                }
            }
        }
        .navigationTitle("TitleWithOptionalMandatoryField Example")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func title() -> AttributedString {
        var title = AttributedString()
        if self.isLongTitle {
            title += "This is long long long long long long long long long long long long long title"
        } else {
            title += "Normal title"
        }
        
        if self.isCustomizedMandatory {
            title += ", Customized Mandatory"
        } else {
            title += ", Default Mandatory"
        }
        return title
    }
    
    func customizedMandatoryField() -> TextOrIcon? {
        if self.isCustomizedMandatory {
            if self.mandatoryType == 0 {
                return TextOrIcon.text(self.customizedMandatoryFieldText())
            } else if self.mandatoryType == 1 {
                return TextOrIcon.icon(Image(systemName: "person"))
            } else {
                return TextOrIcon.both(self.customizedMandatoryFieldText(), Image(systemName: "person"))
            }
        } else {
            return nil
        }
    }
}
