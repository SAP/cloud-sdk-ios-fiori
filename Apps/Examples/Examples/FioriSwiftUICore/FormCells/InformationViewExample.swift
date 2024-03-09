import FioriSwiftUICore
import SwiftUI

struct InformationViewExample: View {
    var body: some View {
        List {
            Text("Default Fiori style, no icon")
                .informationView(description: AttributedString("test message"), isPresented: Binding(get: { true }, set: { _ in }))

            Text("Error style")
                .informationView(description: AttributedString("test message"), isPresented: Binding(get: { true }, set: { _ in }))
                .informationViewStyle(.error)
            
            Text("Warning style")
                .informationView(description: AttributedString("test message"), isPresented: Binding(get: { true }, set: { _ in }))
                .informationViewStyle(.warning)
            
            Text("Informational style")
                .informationView(description: AttributedString("test message"), isPresented: Binding(get: { true }, set: { _ in }))
                .informationViewStyle(.informational)
            
            Text("Success style")
                .informationView(description: AttributedString("test message"), isPresented: Binding(get: { true }, set: { _ in }))
                .informationViewStyle(.success)
            
            Text("Customized icon")
                .informationView(icon: Image(systemName: "heart"), description: AttributedString("test message"), isPresented: Binding(get: { true }, set: { _ in }))

            Text("Customized font and color")
                .informationView(icon: Image(systemName: "diamond"), description: AttributedString("test message"), isPresented: Binding(get: { true }, set: { _ in }))
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
