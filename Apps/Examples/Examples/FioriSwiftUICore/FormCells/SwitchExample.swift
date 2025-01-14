import FioriSwiftUICore
import Foundation
import SwiftUI

struct SwitchExample: View {
    @State var v1: Bool = false
    @State var v2: Bool = true
    @State var v3: Bool = true
    @State var v4: Bool = true

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
        VStack {
            SwitchView(title: "Switch", isOn: self.$v1)
            SwitchView(title: "Disabled Switch", isOn: self.$v2).disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            SwitchView(title: "Custom Style", isOn: self.$v3)
                .titleStyle(CustomTitleStyle())
                .switchStyle(CustomSwitchStyle())
            SwitchView(title: "Very long title, layout depend on title width. long long long long long long long long long long long long long long long long long long long long long long long", isOn: self.$v4)
        }
    }
}

struct SwitchExample_Previews: PreviewProvider {
    static var previews: some View {
        SwitchExample()
    }
}
