import FioriSwiftUICore
import FioriThemeManager
import Foundation
import SwiftUI

struct ValuePickerExample: View {
    let valueOptions: [AttributedString] = ["1", "20", "300", "123456789999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999", "40", "55555555", "6", "777", "eight"]
    @State var negativeIndex: Int = -1
    @State var selectedIndex0: Int = 0
    @State var selectedIndex2: Int = 2
    @State var selectedIndex4: Int = 4

    @State var isRequired = false
    @State var isTrackingLiveChanges = true
    @State var stateIndex: Int = 0
    @State var stateArray: [ControlState] = [.normal, .disabled, .readOnly]
    @State var showsErrorMessage = false
    @State var isCustomTheming = false

    struct CustomValuePickerStyle: ValuePickerStyle {
        func makeBody(_ configuration: ValuePickerConfiguration) -> some View {
            ValuePicker(configuration)
                .valueLabelStyle { c in
                    c.valueLabel
                        .lineLimit(2)
                        .font(.fiori(forTextStyle: .callout))
                        .foregroundStyle(Color.preferredColor(.green7))
                }
                .titleStyle { c in
                    c.title
                        .lineLimit(2)
                        .font(.fiori(forTextStyle: .title3))
                        .foregroundStyle(Color.preferredColor(.indigo7))
                        .background(Color.preferredColor(.grey2))
                }
                .mandatoryFieldIndicatorStyle { c in
                    c.mandatoryFieldIndicator
                        .font(.fiori(forTextStyle: .largeTitle))
                        .foregroundStyle(Color.preferredColor(.red8))
                }
        }
    }

    var body: some View {
        List {
            Section {
                Toggle("Mandatory", isOn: self.$isRequired)
                Toggle("Is Tracking Live Changes", isOn: self.$isTrackingLiveChanges)
                Picker("Control State", selection: self.$stateIndex) {
                    ForEach(0 ..< self.stateArray.count, id: \.self) { index in
                        let state = self.stateArray[index]
                        Text(self.valueForState(state: state))
                    }
                }
                Toggle("Show Error Message", isOn: self.$showsErrorMessage)
                Toggle("Theming", isOn: self.$isCustomTheming)
            }
            Section {
                ValuePicker(title: "Picker Title(Default Style)", isRequired: self.isRequired, options: self.valueOptions, selectedIndex: self.$negativeIndex, isTrackingLiveChanges: self.isTrackingLiveChanges, controlState: self.stateArray[self.stateIndex])
                
                ValuePicker(title: "Picker Title (Long String) Long long long long long long long long long long long long long long long long long long title", isRequired: self.isRequired,
                            options: self.valueOptions, selectedIndex: self.$selectedIndex2, isTrackingLiveChanges: self.isTrackingLiveChanges, controlState: self.stateArray[self.stateIndex])
                    .informationView(isPresented: self.$showsErrorMessage, description: AttributedString("Please choose one available data")).informationViewStyle(.error)
                
                ValuePicker(title: "Picker Always Expanded", isRequired: self.isRequired, options: self.valueOptions, selectedIndex: self.$selectedIndex4, isTrackingLiveChanges: self.isTrackingLiveChanges, alwaysShowPicker: true, controlState: self.stateArray[self.stateIndex]).informationView(isPresented: self.$showsErrorMessage, description: AttributedString("Please choose one available data"))
                    .informationViewStyle(.informational)
                
                ValuePicker(title: "Picker Title 2 lines (Custom Style: First line Second line)", isRequired: self.isRequired,
                            options: self.valueOptions, selectedIndex: self.$selectedIndex0, isTrackingLiveChanges: self.isTrackingLiveChanges, controlState: self.stateArray[self.stateIndex])
                    .valuePickerStyle(CustomValuePickerStyle())
            }
        }.navigationTitle("Value Picker")
            .ifApply(self.isCustomTheming) {
                $0.onAppear { self.customTheming(Color.brown, Color.red) }
            }
            .ifApply(!self.isCustomTheming) {
                $0.onAppear { self.resetTheming() }
            }
    }
    
    func valueForState(state: ControlState) -> String {
        var stateString = ""
        switch state {
        case .disabled:
            stateString = "Disabled"
        case .readOnly:
            stateString = "Read Only"
        default:
            stateString = "Normal"
        }
        return stateString
    }
    
    func customTheming(_ expandedColor: Color, _ contractedColor: Color) {
        self.resetTheming()

        ThemeManager.shared.setColor(expandedColor, for: .primaryLabel, variant: .dark)
        ThemeManager.shared.setColor(contractedColor, for: .tintColor, variant: .dark)
    }
    
    func resetTheming() {
        StyleSheetSettings.reset()
        ThemeManager.shared.setPalette(PaletteVersion.latest.palette)
    }
}

struct ValuePickerExample_Previews: PreviewProvider {
    static var previews: some View {
        ValuePickerExample()
    }
}
