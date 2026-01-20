import FioriSwiftUICore
import Foundation
import SwiftUI

struct SwitchExample: View {
    @State var v1: Bool = true
    @State var v2: Bool = true
    @State var v3: Bool = true
    @State var v4: Bool = true
    @State var v5: Bool = true
    @State var v6: Bool = true
    @State var v7: Bool = false
    @State var v8: Bool = false

    struct CustomTitleStyle: TitleStyle {
        @Environment(\.isEnabled) var isEnabled
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .title3))
                .foregroundStyle(Color.preferredColor(self.isEnabled ? .indigo7 : .grey5))
        }
    }
    
    struct CustomSwitchStyle: SwitchStyle {
        func makeBody(_ configuration: SwitchConfiguration) -> some View {
            Switch(configuration)
                .tint(Color.preferredColor(.mango5))
        }
    }
    
    var body: some View {
        List {
            Group {
                SwitchView(title: "Switch", isOn: self.$v5)
                SwitchView(title: "Disabled Switch On", isOn: self.$v1).disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                SwitchView(title: "Disabled Switch Off", isOn: self.$v8, controlState: .disabled)
                SwitchView(title: "Custom Style", isOn: self.$v6, description: "Custom SwitchView")
                    .titleStyle(CustomTitleStyle())
                    .switchStyle(CustomSwitchStyle())
                SwitchView(title: "Very long title, layout depend on title width. long long long long long long long long long long long long long long long long long long long long long long long", isOn: self.$v7)
                SwitchView(title: "Label", isOn: self.$v2, controlState: .readOnly)
                SwitchView(title: "Notification", isOn: self.$v3, description: "Read-only field", controlState: .readOnly)
                SwitchView(title: "Custom Style", isOn: self.$v4, stateLabel: self.v4 ? "Open" : "Close", description: "Locked by your organization", controlState: .readOnly)
                    .stateLabelStyle(content: { config in
                        config.stateLabel
                            .foregroundStyle(.red)
                    })
                    .titleStyle(content: { config in
                        config.title
                            .foregroundStyle(.cyan)
                    })
                    .informationViewStyle(.warning)
            }
            .padding(EdgeInsets(top: 9, leading: 20, bottom: 9, trailing: 20))
        }
    }
}

struct SwitchExample_Previews: PreviewProvider {
    static var previews: some View {
        SwitchExample()
    }
}
