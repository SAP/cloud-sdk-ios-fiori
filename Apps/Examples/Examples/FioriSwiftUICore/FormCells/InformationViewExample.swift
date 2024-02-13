import FioriSwiftUICore
import SwiftUI

struct InformationViewExample: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("Basic style, no icon")
                    .showInformationView(informationViewText: AttributedString("test message"))
                    .informationViewStyle(.base)
                
                Text("Basic style, no icon")
                    .showInformationView(informationViewText: AttributedString("test message"))
                    .informationViewStyle(.base)
            }
            .background(Color.preferredColor(.tertiaryBackground))
            VStack {
                Text("Default Style")
                    .font(.headline)
                Text("Fiori style")
                    .showInformationView(informationViewText: AttributedString("test message"))
                    .informationViewStyle(.fiori)
                
                Text("Error style")
                    .showInformationView(informationViewText: AttributedString("test message"))
                    .informationViewStyle(.error)
                
                Text("Warning style")
                    .showInformationView(informationViewText: AttributedString("test message"))
                    .informationViewStyle(.warning)
                
                Text("Informational style")
                    .showInformationView(informationViewText: AttributedString("test message"))
                    .informationViewStyle(.informational)
                
                Text("Success style")
                    .showInformationView(informationViewText: AttributedString("test message"))
                    .informationViewStyle(.success)
            }
            .background(Color.preferredColor(.secondaryBackground))
            VStack {
                Text("Customized Style")
                    .font(.headline)
                Text("Basic style")
                    .showInformationView(informationViewIcon: Image(systemName: "heart"), informationViewText: AttributedString("test message"))
                    .informationViewStyle(.base)
                
                Text("Fiori style")
                    .showInformationView(informationViewIcon: Image(systemName: "diamond"), informationViewText: AttributedString("test message"))
                    .informationViewStyle(.fiori)
                    .informationViewIconStyle(content: { informationViewIconConfiguration in
                        informationViewIconConfiguration.informationViewIcon
                            .foregroundStyle(Color.preferredColor(.tintColor))
                    })
                    .informationViewTextStyle(content: { informationViewTextConfiguration in
                        informationViewTextConfiguration.informationViewText
                            .foregroundStyle(Color.preferredColor(.criticalLabel))
                            .font(.fiori(forTextStyle: .title2))
                        })
            }
            .background(Color.preferredColor(.quarternaryFill))
            Spacer()
        }
    }
}
