import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct FilterFormViewExamples: View {
    let valueOptions: [AttributedString] = ["itemShort", "itemLong", "item222222222222222222", "itemSuperLongLabelDescription", "itemShort2"]
    let sortValueOptions: [AttributedString] = ["Received", "Started", "Hold", "Transfer", "Completed", "Pending Review Pending Pending Pending Pending Pending", "Accepted Medium", "Pending", "Completed Medium"]
    
    let priorityOptions: [AttributedString] = ["High", "Medium", "Low"]
    let numberOptions: [AttributedString] = ["1", "2", "3", "4"]
    
    @State private var showMandatoryField = false
    @State private var customizedMandatoryIndicator = false
    @State private var isEnabled = true
    
    @State private var multiSelectionEmptySelectionValue: [Int] = [1, 2]
    @State private var multiSelectionNonEmptySelectionValue: [Int] = [1, 2]
    @State private var singleSelectionEmptySelectionValue: [Int] = []
    @State private var singleSelectionNonEmptySelectionValue: [Int] = []
    @State private var singleSelectionNonEmptySelectionDisabledValue: [Int] = [1]
    @State private var singleSelectionNonEmptySelectionCustomizedColorValue: [Int] = []
    
    @State private var prioritySelectionValue: [Int] = [0]
    @State private var numberSelectionValue: [Int] = [0]
    @State private var trySixSelectionValue: [Int] = [0]
    @State private var trySevenSelectionValue: [Int] = [0]
    @State private var sortFilterSelectionValue: [Int] = [0]
    @State private var sortFilterFixedSelectionValue: [Int] = [0]
    @State private var sortFilterEmptyTitleSelectionValue: [Int] = [0]
    
    func mandatoryField() -> TextOrIcon? {
        if self.customizedMandatoryIndicator {
            return .text("#")
        } else {
            return .text("*")
        }
    }
    
    var body: some View {
        List {
            Toggle(isOn: self.$showMandatoryField) {
                Text("Mandatory Field")
                    .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                    .foregroundStyle(Color.preferredColor(.primaryLabel))
            }
            .tint(Color.preferredColor(.tintColor))
            Toggle(isOn: self.$customizedMandatoryIndicator) {
                Text("Customized Mandatory Indicator")
                    .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                    .foregroundStyle(Color.preferredColor(.primaryLabel))
            }
            .tint(Color.preferredColor(.tintColor))
            Toggle(isOn: self.$isEnabled) {
                Text("Enabled")
                    .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                    .foregroundStyle(Color.preferredColor(.primaryLabel))
            }
            .tint(Color.preferredColor(.tintColor))
            
            FilterFormView(title: "MultiSelection, EmptySelection", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.showMandatoryField, options: self.valueOptions, errorMessage: "Validation Message", isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$multiSelectionEmptySelectionValue, buttonSize: .fixed, onValueChange: { value in
                print("MultiSelection, EmptySelection value change: \(value)")
            })
            .mandatoryFieldIndicatorStyle { conf in
                conf.mandatoryFieldIndicator
                    .foregroundStyle(self.mandatoryFieldIndicatorColor())
            }
            .informationViewStyle(.success)
            
            FilterFormView(title: "MultiSelection, Non-EmptySelection", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.showMandatoryField, options: self.valueOptions, errorMessage: "Validation Message", isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: false, value: self.$multiSelectionNonEmptySelectionValue, buttonSize: .fixed)
                .mandatoryFieldIndicatorStyle { conf in
                    conf.mandatoryFieldIndicator
                        .foregroundStyle(self.mandatoryFieldIndicatorColor())
                }
            
            FilterFormView(title: "SingleSelection, EmptySelection", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.showMandatoryField, options: self.valueOptions, errorMessage: "Validation Message", isEnabled: self.isEnabled, allowsMultipleSelection: false, allowsEmptySelection: true, value: self.$singleSelectionEmptySelectionValue, buttonSize: .fixed)
                .mandatoryFieldIndicatorStyle { conf in
                    conf.mandatoryFieldIndicator
                        .foregroundStyle(self.mandatoryFieldIndicatorColor())
                }
            
            FilterFormView(title: "SingleSelection, Non-EmptySelection", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.showMandatoryField, options: self.valueOptions, errorMessage: "Validation Message", isEnabled: self.isEnabled, allowsMultipleSelection: false, allowsEmptySelection: false, value: self.$singleSelectionNonEmptySelectionValue, buttonSize: .fixed)
                .mandatoryFieldIndicatorStyle { conf in
                    conf.mandatoryFieldIndicator
                        .foregroundStyle(self.mandatoryFieldIndicatorColor())
                }
            
            FilterFormView(title: "SingleSelection, Non-EmptySelection, Disabled", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.showMandatoryField, options: self.valueOptions, errorMessage: "Validation Message", isEnabled: false, allowsMultipleSelection: false, allowsEmptySelection: false, value: self.$singleSelectionNonEmptySelectionDisabledValue, buttonSize: .fixed)
                .mandatoryFieldIndicatorStyle { conf in
                    conf.mandatoryFieldIndicator
                        .foregroundStyle(self.mandatoryFieldIndicatorColor())
                }
            
            FilterFormView(title: {
                Text("SingleSelection, Non-EmptySelection, Customized Color, Font")
                    .foregroundStyle(self.isEnabled ? Color.red : .yellow)
            }, mandatoryFieldIndicator: {
                TextOrIconView(self.mandatoryField())
                    .foregroundStyle(self.isEnabled ? Color.green : .preferredColor(.quaternaryLabel))
            }, isRequired: self.showMandatoryField, options: self.valueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: false, allowsEmptySelection: false, value: self.$singleSelectionNonEmptySelectionCustomizedColorValue, buttonSize: .fixed)
                .mandatoryFieldIndicatorStyle { conf in
                    conf.mandatoryFieldIndicator
                        .foregroundStyle(self.mandatoryFieldIndicatorColor())
                }
                .filterFormOptionAttributes([
                    .enabledUnselected: [
                        .foregroundColor: Color.green,
                        .strokeColor: Color.yellow,
                        .font: Font.fiori(forTextStyle: .caption1)
                    ],
                    .enabledSelected: [
                        .foregroundColor: Color.red,
                        .strokeColor: Color.orange,
                        .font: Font.fiori(forTextStyle: .caption1)
                    ]
                ])
            
            FilterFormView(title: "Priority", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.showMandatoryField, options: self.priorityOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$prioritySelectionValue, buttonSize: .flexibleByMaxChip)
                .mandatoryFieldIndicatorStyle { conf in
                    conf.mandatoryFieldIndicator
                        .foregroundStyle(self.mandatoryFieldIndicatorColor())
                }
            
            FilterFormView(title: "Number", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.showMandatoryField, options: self.numberOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$numberSelectionValue, buttonSize: .flexibleByMaxChip)
                .mandatoryFieldIndicatorStyle { conf in
                    conf.mandatoryFieldIndicator
                        .foregroundStyle(self.mandatoryFieldIndicatorColor())
                }
            
            FilterFormView(title: "SingleSelection, Non-EmptySelection, flexible, same size", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.showMandatoryField, options: self.valueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$trySixSelectionValue, buttonSize: .flexibleByMaxChip)
                .mandatoryFieldIndicatorStyle { conf in
                    conf.mandatoryFieldIndicator
                        .foregroundStyle(self.mandatoryFieldIndicatorColor())
                }
            
            FilterFormView(title: "SingleSelection, Non-EmptySelection, flexible", mandatoryFieldIndicator: self.mandatoryField(), isRequired: self.showMandatoryField, options: self.valueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$trySevenSelectionValue, buttonSize: .flexible)
                .mandatoryFieldIndicatorStyle { conf in
                    conf.mandatoryFieldIndicator
                        .foregroundStyle(self.mandatoryFieldIndicatorColor())
                }
            
            FilterFormView(title: "Sort Filter, MultiSelection, EmptySelection, flexible, no mandatory", mandatoryFieldIndicator: self.mandatoryField(), isRequired: false, options: self.sortValueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$sortFilterSelectionValue, buttonSize: .flexible)
                .mandatoryFieldIndicatorStyle { conf in
                    conf.mandatoryFieldIndicator
                        .foregroundStyle(self.mandatoryFieldIndicatorColor())
                }
                .filterFormOptionMinTouchHeight(50)
                .filterFormOptionCornerRadius(16)
                .filterFormOptionTitleSpacing(4)
                .filterFormOptionPadding(EdgeInsets(top: 4, leading: 9, bottom: 4, trailing: 9))
                .filterFormOptionAttributes([
                    .enabledUnselected: [
                        .strokeWidth: 1.0,
                        .strokeColor: Color.preferredColor(.separator),
                        .foregroundColor: Color.preferredColor(.tertiaryLabel),
                        .backgroundColor: Color.preferredColor(.tertiaryFill),
                        .font: Font.system(.body)
                    ],
                    .enabledSelected: [
                        .strokeWidth: 1.0,
                        .strokeColor: Color.preferredColor(.tintColor),
                        .foregroundColor: Color.preferredColor(.tintColor),
                        .backgroundColor: Color.preferredColor(.secondaryGroupedBackground),
                        .font: Font.system(.body)
                    ]
                ])
            
            FilterFormView(title: "Sort Filter, MultiSelection, EmptySelection, fixed, no mandatory", mandatoryFieldIndicator: self.mandatoryField(), isRequired: false, options: self.sortValueOptions, errorMessage: nil, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$sortFilterFixedSelectionValue, buttonSize: .fixed)
                .mandatoryFieldIndicatorStyle { conf in
                    conf.mandatoryFieldIndicator
                        .foregroundStyle(self.mandatoryFieldIndicatorColor())
                }
                .filterFormOptionMinTouchHeight(50)
                .filterFormOptionCornerRadius(16)
                .filterFormOptionTitleSpacing(4)
                .filterFormOptionPadding(EdgeInsets(top: 4, leading: 9, bottom: 4, trailing: 9))
                .filterFormOptionsItemSpacing(16)
                .filterFormOptionsLineSpacing(10)
                .filterFormOptionAttributes([
                    .enabledUnselected: [
                        .strokeWidth: 1.0,
                        .strokeColor: Color.preferredColor(.separator),
                        .foregroundColor: Color.preferredColor(.tertiaryLabel),
                        .backgroundColor: Color.preferredColor(.tertiaryFill),
                        .font: Font.system(.body)
                    ],
                    .enabledSelected: [
                        .strokeWidth: 1.0,
                        .strokeColor: Color.preferredColor(.tintColor),
                        .foregroundColor: Color.preferredColor(.tintColor),
                        .backgroundColor: Color.preferredColor(.secondaryGroupedBackground),
                        .font: Font.system(.body)
                    ]
                ])
            
            // Empty title and mandatory
            FilterFormView(title: {
                EmptyView()
            }, mandatoryFieldIndicator: {
                EmptyView()
            }, isRequired: false, options: self.sortValueOptions, isEnabled: self.isEnabled, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$sortFilterEmptyTitleSelectionValue, buttonSize: .flexible)
                .filterFormOptionMinTouchHeight(50)
                .filterFormOptionCornerRadius(16)
                .filterFormOptionTitleSpacing(4)
                .filterFormOptionPadding(EdgeInsets(top: 4, leading: 9, bottom: 4, trailing: 9))
                .filterFormOptionAttributes([
                    .enabledUnselected: [
                        .strokeWidth: 1.0,
                        .strokeColor: Color.preferredColor(.separator),
                        .foregroundColor: Color.preferredColor(.tertiaryLabel),
                        .backgroundColor: Color.preferredColor(.tertiaryFill),
                        .font: Font.system(.body)
                    ],
                    .enabledSelected: [
                        .strokeWidth: 1.0,
                        .strokeColor: Color.preferredColor(.tintColor),
                        .foregroundColor: Color.preferredColor(.tintColor),
                        .backgroundColor: Color.preferredColor(.secondaryGroupedBackground),
                        .font: Font.system(.body)
                    ]
                ])
        }
        .listStyle(.plain)
    }
    
    func mandatoryFieldIndicatorColor() -> Color {
        if !self.isEnabled {
            return .preferredColor(.quaternaryLabel)
        } else {
            return self.customizedMandatoryIndicator ? Color.red : Color.preferredColor(.primaryLabel)
        }
    }
}

#Preview {
    FilterFormViewExamples()
}
