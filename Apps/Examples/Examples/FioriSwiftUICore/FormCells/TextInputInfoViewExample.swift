import FioriSwiftUICore
import SwiftUI

struct TextInputInfoViewExample: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Default Fiori style, no icon")
                .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"), counter: AttributedString("10/100"))

            Text("Default Fiori style, no message")
                .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), counter: AttributedString("10/100"))

            Text("Default Fiori style, no counter")
                .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"))

            Text("Error style")
                .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message, long messag  long message  long message  long message  long message  long message long message  long message"), counter: AttributedString("12/10"))
                .textInputInfoViewStyle(.error)
            
            Text("Warning style")
                .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message, long messag  long message  long message  long message  long message  long message long message  long message"), counter: AttributedString("10/10"))
                .textInputInfoViewStyle(.warning)
            
            Text("Informational style")
                .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"), counter: AttributedString("0/10"))
                .textInputInfoViewStyle(.informational)
            
            Text("Success style")
                .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), description: AttributedString("test message"), counter: AttributedString("10/100"))
                .textInputInfoViewStyle(.success)
            
            Text("Customized icon")
                .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), icon: Image(systemName: "heart"), description: AttributedString("test message, long messag  long message  long message  long message  long message  long message long message  long message"), counter: AttributedString("10/100"))

            Text("Customized font and color")
                .textInputInfoView(isPresented: Binding(get: { true }, set: { _ in }), icon: Image(systemName: "diamond"), description: AttributedString("test message"), counter: AttributedString("10/100"))
                .iconStyle(content: { iconConfiguration in
                    iconConfiguration.icon
                        .foregroundStyle(Color.preferredColor(.tintColor))
                })
                .descriptionStyle(content: { descriptionConfiguration in
                    descriptionConfiguration.description
                        .foregroundStyle(Color.preferredColor(.criticalLabel))
                        .font(.fiori(forTextStyle: .title2))
                })
                .counterStyle(content: { counterConfiguration in
                    counterConfiguration.counter
                        .foregroundStyle(Color.preferredColor(.criticalLabel))
                        .font(.fiori(forTextStyle: .title2))
                })
            
            Spacer()
        }
        .padding()
    }
}
