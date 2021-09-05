import FioriSwiftUICore
import SwiftUI

class WelcomeScreenDataModel: WelcomeScreenModel, ObservableObject {
    @Published var textInputValue_: String = ""
    var title: String = "SAP Project Companion for Managers"
    var descriptionText: String? = "Please follow the instructions you received in the welcome email to start the activation process."

    var actionText: String? = "Start"
    var subtitle: String? = "abc@def.com"
    var footnote: String? = "Want to explore?"
    var icon: Image? = Image("SAPLogo")
    var secondaryActionText: String? = "Try Demo"
    
    func didSelectAction() {
        print("WelcomeScreen Primary button clicked: ", self.textInputValue_)
    }
    
    func didSelectSecondaryAction() {
        UIApplication.shared.open(URL(string: "http://www.google.com")!)
    }
    
    func onCommit() {
        print("TextField commit")
    }
}

struct WelcomeScreenSample: View {
    @ObservedObject var model = WelcomeScreenDataModel()

    public init() {}
    
    var body: some View {
        VStack {
            WelcomeScreen(model: model)
                .subtitleModifier { $0.hidden() }
                .textInputValueModifier { $0.hidden() }
        }
    }
}

struct WelcomeScreenCustomized: View {
    @ObservedObject var model = WelcomeScreenDataModel()
    public init() {}
    
    var body: some View {
        VStack {
            WelcomeScreen(model: model)
                .footnoteModifier { $0.font(.headline).foregroundColor(.green) }
                .subtitleModifier { $0.hidden() }
                .textInputValueModifier { $0.hidden() }
                .actionTextModifier { $0.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)) }
        }
    }
}

struct WelcomeScreenDiscoveryService: View {
    @ObservedObject var model = WelcomeScreenDataModel()
    public init() {}
    
    var body: some View {
        VStack {
            WelcomeScreen(model: model)
                .footnoteModifier { $0.font(.headline).foregroundColor(.green) }
                .subtitleModifier { $0.hidden() }
                .actionTextModifier { content in
                    content.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
                        .disabled(model.textInputValue_.isEmpty)
                }
                .textInputValueModifier { $0.disableAutocorrection(true) }
        }
    }
}

struct WelcomeScreenSample_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenSample()
    }
}
