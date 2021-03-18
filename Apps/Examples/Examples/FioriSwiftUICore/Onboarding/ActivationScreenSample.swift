import FioriSwiftUICore
import SwiftUI

class ActivationScreenDataModel: ActivationScreenModel {
    var title_: String {
        "Activation"
    }
    
    var descriptionText_: String? {
        "If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding. "
    }
    
    var primaryActionLabel_: String? {
        "Next"
    }
    
    func didSelectPrimaryAction() {
        print("ActivationScreen Primary button clicked")
    }
    
    var subtitle_: String? {
        "abc@def.com"
    }
    
    var footnote_: String? {
        "Or"
    }
    
    var secondaryActionText_: String? {
        "Scan"
    }

    func didSelectSecondaryAction() {
        print("call barcode scanner")
    }
}

struct ActivationScreenSample: View {
    private var model = ActivationScreenDataModel()
    
    public init() {}
    
    var body: some View {
        VStack {
            ActivationScreen(title: model.title_, descriptionText: model.descriptionText_, subtitle: model.subtitle_, primaryActionLabel: model.primaryActionLabel_, footnote: model.footnote_, secondaryActionText: model.secondaryActionText_, didSelectPrimaryActionClosure: model.didSelectPrimaryAction, didSelectSecondaryActionClosure: model.didSelectSecondaryAction)
                .footnoteModifier { $0.font(.headline).foregroundColor(.green) }
                .subtitleModifier { $0.hidden() }
        }
    }
}

struct ActivationScreenSample_Previews: PreviewProvider {
    static var previews: some View {
        ActivationScreenSample()
    }
}
