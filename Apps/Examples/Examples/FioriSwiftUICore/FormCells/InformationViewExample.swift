import FioriSwiftUICore
import SwiftUI

struct InformationViewExample: View {
    var body: some View {
        List {
            Text("Default Fiori style, no icon")
                .informationView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"))

            Text("Error style")
                .informationView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"))
                .informationViewStyle(.error)
            
            Text("Warning style")
                .informationView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"))
                .informationViewStyle(.warning)
            
            Text("Informational style")
                .informationView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"))
                .informationViewStyle(.informational)
            
            Text("Success style")
                .informationView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"))
                .informationViewStyle(.success)
            
            Text("Customized icon")
                .informationView(isPresented: Binding(get: { true }, set: { _ in }), icon: Image(systemName: "heart"), description: AttributedString("test message"))

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
        }
    }
}
