import Combine
import FioriSwiftUICore
import SwiftUI

class ActivationScreenDataModel: ActivationScreenModel, ObservableObject {
    // Changes in nested observable object will not trigger refresh. Need to send notification by explicitly calling `send()`
    @Published var textInput: TextInputModel?
    lazy var action: _ActionModel? = ActionDataModel { [unowned self] in
        print("ActivationScreen Primary button clicked, email: \(self.textInput!.textInputValue)")
    }

    lazy var secondaryAction: _ActionModel? = SecondaryActionDataModel { [unowned self] in
        print("call barcode scanner")
    }
    
    var title: String = "Activation"
    var descriptionText: String? = "If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding. "
    var footnote: String? = "Or"
    
    var cancellable: AnyCancellable?
    
    init() {
        let inputModel = TextInputDataModel()
        
        self.cancellable = inputModel.objectWillChange.sink { [weak self] in
            self?.objectWillChange.send()
        }
        
        self._textInput = Published(wrappedValue: inputModel)
    }
}

extension ActivationScreenDataModel {
    class TextInputDataModel: TextInputModel, ObservableObject {
        @Published var textInputValue: String = ""
        
        var onCommit: (() -> Void)? = {
            print("TextInputField commit")
        }
    }
    
    struct ActionDataModel: _ActionModel {
        let actionText: String? = "Next"
        
        let didSelectAction: (() -> Void)?
    }
    
    struct SecondaryActionDataModel: _ActionModel {
        let actionText: String? = "Scan"
        
        let didSelectAction: (() -> Void)?
    }
}

struct ActivationScreenSample: View {
    @ObservedObject var model = ActivationScreenDataModel()
    public init() {}
    
    var body: some View {
        VStack {
            ActivationScreen(model: model)
                .actionModifier { $0.disabled(model.textInput!.textInputValue.isEmpty) }
                .textInputModifier { $0.autocapitalization(.none) }
        }
    }
}

struct ActivationScreenCustomizedSample: View {
    @ObservedObject var model = ActivationScreenDataModel()
    public init() {}
    
    var body: some View {
        VStack {
            ActivationScreen(model: model)
                .footnoteModifier { $0.font(.fiori(forTextStyle: .headline)).foregroundColor(.green) }
                .actionModifier { $0.disabled(model.textInput!.textInputValue.isEmpty) }
                .textInputModifier { $0.padding(.top, 8)
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
