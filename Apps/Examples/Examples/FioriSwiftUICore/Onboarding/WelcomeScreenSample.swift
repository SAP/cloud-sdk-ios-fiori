import FioriSwiftUICore
import SwiftUI

class WelcomeScreenDataModel: WelcomeScreenModel {
    @State var isPressed: Bool = false
    var title_: String = "SAP Project Companion for Managers"
    var descriptionText_: String? = "Please follow the instructions you received in the welcome email to start the activation process."
    var textFilled_: Binding<String>?
    var actionText_: String? = "Start"
    var subtitle_: String? = "abc@def.com"
    var footnote_: String? = "Want to explore?"
    var icon_: Image? = Image("SAPLogo")
    var secondaryActionText_: String? = "Try Demo"
    var userInput: String = ""
    
    func didSelectAction() {
        print("WelcomeScreen Primary button clicked")
        self.isPressed.toggle()
    }
    
    func didSelectSecondaryAction() {
        UIApplication.shared.open(URL(string: "http://www.google.com")!)
    }
    
    func onCommit() {
        print("TextField commit")
    }
    
    func updateValue(value: String) {
        self.userInput = value
    }
}

struct WelcomeScreenSample: View {
    private var model = WelcomeScreenDataModel()
    public init() {}
    
    var body: some View {
        VStack {
            WelcomeScreen(title: model.title_, descriptionText: model.descriptionText_, actionText: model.actionText_, subtitle: model.subtitle_, footnote: model.footnote_, secondaryActionText: model.secondaryActionText_, icon: model.icon_, didSelectAction: model.didSelectAction, didSelectSecondaryAction: model.didSelectSecondaryAction)
                .subtitleModifier { $0.hidden() }
                .textFilledModifier { $0.hidden() }
        }
    }
}

struct WelcomeScreenCustomized: View {
    private var model = WelcomeScreenDataModel()
    public init() {}
    
    var body: some View {
        VStack {
            WelcomeScreen(title: model.title_, descriptionText: model.descriptionText_, actionText: model.actionText_, subtitle: model.subtitle_, footnote: model.footnote_, secondaryActionText: model.secondaryActionText_, icon: model.icon_, didSelectAction: model.didSelectAction, didSelectSecondaryAction: model.didSelectSecondaryAction)
                .footnoteModifier { $0.font(.headline).foregroundColor(.green) }
                .subtitleModifier { $0.hidden() }
                .textFilledModifier { $0.hidden() }
                .actionTextModifier { $0.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)) }
        }
    }
}

struct WelcomeScreenDiscoveryService: View {
    @State var userInput: String = ""
    @State var actionDisabled: Bool = true
    private var model = WelcomeScreenDataModel()
    public init() {}
    
    var body: some View {
        let binding = Binding(
            get: { self.userInput },
            set: {
                self.userInput = $0
                model.updateValue(value: $0)
                if $0.isEmpty {
                    actionDisabled = true
                } else {
                    actionDisabled = false
                }
            }
        )
        VStack {
            WelcomeScreen(title: model.title_, descriptionText: model.descriptionText_, textFilled: binding, actionText: model.actionText_, subtitle: model.subtitle_, footnote: model.footnote_, secondaryActionText: model.secondaryActionText_, icon: model.icon_, didSelectAction: model.didSelectAction, didSelectSecondaryAction: model.didSelectSecondaryAction)
                .footnoteModifier { $0.font(.headline).foregroundColor(.green) }
                .subtitleModifier { $0.hidden() }
                .actionTextModifier { content in
                    content.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
                        .disabled(actionDisabled)
                }
                .textFilledModifier { $0.disableAutocorrection(true) }
        }
    }
}

struct WelcomeScreenSample_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenSample()
    }
}
