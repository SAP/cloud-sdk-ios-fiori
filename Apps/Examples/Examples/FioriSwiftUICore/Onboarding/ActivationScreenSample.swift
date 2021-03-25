import FioriSwiftUICore
import SwiftUI

class ActivationScreenDataModel: ActivationScreenModel {
    var title_: String = "Activation"
    var descriptionText_: String? = "If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding. "
    var primaryActionText_: String? = "Next"
    var textFilled_: String? = "abc@def.com"
    var footnote_: String? = "Or"
    var secondaryActionText_: String? = "Scan"
    
    func didSelectPrimaryAction() {
        print("ActivationScreen Primary button clicked")
    }
    
    func didSelectSecondaryAction() {
        print("call barcode scanner")
    }
    
    func onCommit() {
        print("TextField commit")
    }
    
    func onChange(changed: Bool) {
        print("TextField changed")
    }
}

struct ActivationScreenSample: View {
    private var model = ActivationScreenDataModel()
    
    public init() {}
    
    var body: some View {
        VStack {
            ActivationScreen(title: model.title_, descriptionText: model.descriptionText_, textFilled: model.textFilled_, primaryActionText: model.primaryActionText_, footnote: model.footnote_, secondaryActionText: model.secondaryActionText_, onCommitClosure: model.onCommit, didSelectPrimaryActionClosure: model.didSelectPrimaryAction, didSelectSecondaryActionClosure: model.didSelectSecondaryAction)
                .footnoteModifier { $0.font(.headline).foregroundColor(.green) }
                .textFilledModifier { $0.disableAutocorrection(true) }
        }
    }
}

struct ActivationScreenSample_Previews: PreviewProvider {
    static var previews: some View {
        ActivationScreenSample()
    }
}
