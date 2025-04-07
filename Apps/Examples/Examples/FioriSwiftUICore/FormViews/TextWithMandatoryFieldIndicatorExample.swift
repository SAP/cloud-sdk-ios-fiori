//
//  TextWithMandatoryFieldIndicatorExample.swift
//  Examples
//
//  Created by Zhang, Hengyi (external - Project) on 2025/4/7.
//  Copyright © 2025 SAP. All rights reserved.
//
import FioriSwiftUICore
import SwiftUI

struct TextWithMandatoryFieldIndicatorExample: View {
    @State private var isLongText = false
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
                Toggle(isOn: self.$isLongText) {
                    Text("Long text")
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
                    TextWithMandatoryFieldIndicator(text: self.textStr(), isRequired: self.showMandatoryField, mandatoryFieldIndicator: self.customizedMandatoryField())
                        .textWithMandatoryFieldIndicatorStyle { conf in
                            TextWithMandatoryFieldIndicator(conf)
                                .foregroundStyle(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.quaternaryLabel))
                                .font(.fiori(forTextStyle: .headline))
                        }
                } else {
                    TextWithMandatoryFieldIndicator(text: self.textStr(), isRequired: self.showMandatoryField)
                        .textWithMandatoryFieldIndicatorStyle { conf in
                            TextWithMandatoryFieldIndicator(conf)
                                .foregroundStyle(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.quaternaryLabel))
                                .font(.fiori(forTextStyle: .headline))
                        }
                }
            }
            
            Section {
                if self.isCustomizedMandatory {
                    TextWithMandatoryFieldIndicator(text: self.textStr(), isRequired: self.showMandatoryField, mandatoryFieldIndicator: self.customizedMandatoryField())
                        .textWithMandatoryFieldIndicatorStyle { conf in
                            TextWithMandatoryFieldIndicator(conf)
                                .foregroundStyle(self.isEnabled ? Color.blue : Color.preferredColor(.quaternaryLabel))
                                .font(.fiori(forTextStyle: .headline))
                        }
                } else {
                    TextWithMandatoryFieldIndicator(text: self.textStr(), isRequired: self.showMandatoryField)
                        .textWithMandatoryFieldIndicatorStyle { conf in
                            TextWithMandatoryFieldIndicator(conf)
                                .foregroundStyle(self.isEnabled ? Color.blue : Color.preferredColor(.quaternaryLabel))
                                .font(.fiori(forTextStyle: .headline))
                        }
                }
            }
        }
        .navigationTitle("TextWithMandatoryFieldIndicator Example")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func textStr() -> AttributedString {
        var textStr = AttributedString()
        if self.isLongText {
            textStr += "This is long long long long long long long long long long long long long text"
        } else {
            textStr += "Normal text"
        }
        
        if self.isCustomizedMandatory {
            textStr += ", Customized Mandatory"
        } else {
            textStr += ", Default Mandatory"
        }
        return textStr
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
