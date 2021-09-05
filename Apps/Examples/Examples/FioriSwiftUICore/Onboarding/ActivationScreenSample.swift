import FioriSwiftUICore
import SwiftUI

class ActivationScreenDataModel: ActivationScreenModel, ObservableObject {
    @Published var textInputValue_: String = ""
    var title: String = "Activation"
    var descriptionText: String? = "If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding. "
    var actionText: String? = "Next"
    var footnote: String? = "Or"
    var secondaryActionText: String? = "Scan"
    
    func didSelectAction() {
        print("ActivationScreen Primary button clicked, email:", self.textInputValue_)
    }
    
    func didSelectSecondaryAction() {
        print("call barcode scanner")
    }
    
    func onCommit() {
        print("TextField commit: ", self.textInputValue_)
    }
}

struct ActivationScreenSample: View {
    @ObservedObject var model = ActivationScreenDataModel()
    public init() {}
    
    var body: some View {
        VStack {
            ActivationScreen(model: model)
                .actionTextModifier { $0.disabled(model.textInputValue_.isEmpty) }
                .textInputValueModifier { $0.autocapitalization(.none) }
        }
    }
}

struct ActivationScreenCustomizedSample: View {
    @ObservedObject var model = ActivationScreenDataModel()
    public init() {}
    
    var body: some View {
        VStack {
            ActivationScreen(model: model)
                .footnoteModifier { $0.font(.headline).foregroundColor(.green) }
                .actionTextModifier { $0.disabled(model.textInputValue_.isEmpty) }
                .textInputValueModifier { $0.padding(.top, 8)
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
