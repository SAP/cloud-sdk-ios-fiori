import FioriSwiftUICore
import SwiftUI

struct InformationViewExample: View {
    @State var isDisabled = false
    
    var body: some View {
        List {
            Text("Default Fiori style, no icon")
                .informationView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"))
                .disabled(self.isDisabled)

            Text("Error style")
                .informationView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"))
                .informationViewStyle(.error)
                .disabled(self.isDisabled)
            
            Text("Warning style")
                .informationView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"))
                .informationViewStyle(.warning)
                .disabled(self.isDisabled)
            
            Text("Informational style")
                .informationView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"))
                .informationViewStyle(.informational)
                .disabled(self.isDisabled)
            
            Text("Success style")
                .informationView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"))
                .informationViewStyle(.success)
                .disabled(self.isDisabled)
            
            Text("Customized icon")
                .informationView(isPresented: Binding(get: { true }, set: { _ in }), icon: Image(systemName: "heart"), description: AttributedString("test message"))
                .disabled(self.isDisabled)

            Text("Customized font and color")
                .informationView(isPresented: Binding(get: { true }, set: { _ in }), icon: Image(systemName: "diamond"), description: AttributedString("test message"))
                .informationViewStyle(.fiori)
                .iconStyle(content: { iconConfiguration in
                    iconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(.tintColor))
                })
                .descriptionStyle(content: { descriptionConfiguration in
                    descriptionConfiguration.description
                        .foregroundStyle(Color.preferredColor(.criticalLabel))
                        .font(.fiori(forTextStyle: .title2))
                })
            
            Spacer()
            
            Toggle("Disabled", isOn: self.$isDisabled)
        }
    }
}
