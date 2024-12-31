import FioriSwiftUICore
import SwiftUI

struct KeyValueItemExample: View {
    @State var isRequired: Bool = false
    @State var isEmptyValue: Bool = false
    @State var showsErrorMessage = false
    @State var state: ControlState = .normal
    @State var axis: Axis = .horizontal
    
    struct CustomKeyValueItemStyle: KeyValueItemStyle {
        func makeBody(_ configuration: KeyValueItemConfiguration) -> some View {
            KeyValueItem(configuration)
                .keyStyle { c in
                    c.key
                        .lineLimit(2)
                        .font(.fiori(forTextStyle: .callout))
                        .foregroundStyle(Color.preferredColor(.green7))
                }
                .valueStyle { c in
                    c.value
                        .lineLimit(2)
                        .font(.fiori(forTextStyle: .title3))
                        .foregroundStyle(Color.preferredColor(.indigo7))
                        .background(Color.preferredColor(.red3))
                }
                .mandatoryFieldIndicatorStyle { c in
                    c.mandatoryFieldIndicator
                        .font(.fiori(forTextStyle: .largeTitle))
                        .foregroundStyle(Color.preferredColor(.blue8))
                }
        }
    }
    
    var body: some View {
        List {
            Section {
                Toggle("Allow Empty Value", isOn: self.$isEmptyValue)
                Toggle("Mandatory Field", isOn: self.$isRequired)
                Picker("Control State", selection: self.$state) {
                    Text("Normal").tag(ControlState.normal)
                    Text("Disabled").tag(ControlState.disabled)
                    Text("Readonly").tag(ControlState.readOnly)
                }
                Picker("Axis", selection: self.$axis) {
                    Text("Horizontal").tag(Axis.horizontal)
                    Text("Vertical").tag(Axis.vertical)
                }
            }
            Section {
                Text("Key Value Item (Default Style)")
                KeyValueItem(
                    key: { Text("Key 1") },
                    value: { self.valueView("Value 1") },
                    isRequired: self.isRequired,
                    controlState: self.state,
                    axis: self.axis
                )
                
                Divider().background(Color.gray)
                Text("Key Value Item (Long String)")
                KeyValueItem(
                    key: { Text("Long long long long long long long long long long long long long long long long long long Key") },
                    value: { self.valueView("Long long long long long long Value") },
                    isRequired: self.isRequired,
                    controlState: self.state,
                    axis: self.axis
                )
                
                Divider().background(Color.gray)
                Text("Key Value Item 2 lines (Custom Style)")
                KeyValueItem(
                    key: { Text("Long long long long long long long long long long long long long long long long long long long long long Key") },
                    value: { self.valueView("Value") },
                    isRequired: self.isRequired,
                    controlState: self.state,
                    axis: self.axis
                ).keyValueItemStyle(CustomKeyValueItemStyle())
            }
        }
    }
    
    @ViewBuilder
    func valueView(_ valueString: String) -> some View {
        if self.isEmptyValue {
            EmptyView()
        } else {
            Text(valueString)
        }
    }
    
    struct KeyValueItemExample_Previews: PreviewProvider {
        static var previews: some View {
            KeyValueItemExample()
        }
    }
}
