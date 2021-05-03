import FioriSwiftUICore
import SwiftUI

class ActivationScreenDataModel: ActivationScreenModel {
    var title_: String = "Activation"
    var descriptionText_: String? = "If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding. "
    var actionText_: String? = "Next"
    var textFilled_: Binding<String>?
    var footnote_: String? = "Or"
    var secondaryActionText_: String? = "Scan"
    var userInput: String = ""
    
    func didSelectAction() {
        print("ActivationScreen Primary button clicked, email:", self.userInput)
    }
    
    func didSelectSecondaryAction() {
        print("call barcode scanner")
    }
    
    func onCommit() {
        print("TextField commit")
    }
    
    func updateValue(value: String) {
        self.userInput = value
    }
}

struct ActivationScreenSample: View {
    @State var userInput: String = ""
    private var model = ActivationScreenDataModel()
    public init() {}
    
    var body: some View {
        let binding = Binding(
            get: { self.userInput },
            set: {
                self.userInput = $0
                model.updateValue(value: $0)
            }
        )
        VStack {
            ActivationScreen(title: model.title_, descriptionText: model.descriptionText_, textFilled: binding, actionText: model.actionText_, footnote: model.footnote_, secondaryActionText: model.secondaryActionText_, onCommit: model.onCommit, didSelectAction: model.didSelectAction, didSelectSecondaryAction: model.didSelectSecondaryAction)
                .actionTextModifier { $0.disabled(userInput.isEmpty) }
                .textFilledModifier { $0.autocapitalization(.none) }
        }
    }
}

struct ActivationScreenCustomizedSample: View {
    @State var userInput: String = ""
    private var model = ActivationScreenDataModel()
    public init() {}
    
    var body: some View {
        let binding = Binding(
            get: { self.userInput },
            set: {
                self.userInput = $0
                model.updateValue(value: $0)
            }
        )
        VStack {
            ActivationScreen(title: model.title_, descriptionText: model.descriptionText_, textFilled: binding, actionText: model.actionText_, footnote: model.footnote_, secondaryActionText: model.secondaryActionText_, onCommit: model.onCommit, didSelectAction: model.didSelectAction, didSelectSecondaryAction: model.didSelectSecondaryAction)
                .footnoteModifier { $0.font(.headline).foregroundColor(.green) }
                .actionTextModifier { $0.disabled(userInput.isEmpty) }
                .textFilledModifier { $0.padding(.top, 8)
                    .border(Color(UIColor.separator))
                }
        }
    }
}

struct ActivationScreenSample_Previews: PreviewProvider {
    static var previews: some View {
        ActivationScreenSample()
    }
}
