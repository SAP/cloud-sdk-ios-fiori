import Combine
import FioriSwiftUICore
import SwiftUI

class ActivationScreenDataModel: _ActivationScreenModel, ObservableObject {
    // Changes in nested observable object will not trigger refresh. Need to send notification by explicitly calling `send()`
    @Published var textInput: _TextInputModel?
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
    class TextInputDataModel: _TextInputModel, ObservableObject {
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
    var isNewActivationScreen = false
    @State var inputText: String = ""
    var showsIllustratedMessage = false

    public init() {}
    
    public init(isNewActivationScreen: Bool = false, showsIllustratedMessage: Bool = false) {
        self.isNewActivationScreen = isNewActivationScreen
        self.showsIllustratedMessage = showsIllustratedMessage
    }
    
    var body: some View {
        VStack {
            if self.isNewActivationScreen == false {
                _ActivationScreen(model: self.model)
                    .actionModifier { $0.disabled(self.model.textInput!.textInputValue.isEmpty) }
                    .textInputModifier { $0.autocapitalization(.none) }
            } else {
                ActivationScreen(title: "Activation",
                                 descriptionText: "If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding.",
                                 footnote: "Or",
                                 action: FioriButton(title: "Use your email", action: { _ in
                                     print("ActivationScreen Primary button clicked, email: \(self.inputText)")
                                 }),
                                 secondaryAction: FioriButton(title: "Scan", action: { _ in
                                     print("call barcode scanner")
                                 }),
                                 illustratedMessage: IllustratedMessage(detailImage: {
                                     Image("IllustrationImage").resizable(resizingMode: .stretch)
                                 }, title: {
                                     Text("Activation")
                                 }, description: {
                                     Text("If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding.")
                                         .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                                 }, detailImageSize: .large),
                                 inputText: self.$inputText,
                                 showsIllustratedMessage: self.showsIllustratedMessage)
            }
        }
    }
}

struct ActivationScreenCustomizedSample: View {
    @ObservedObject var model = ActivationScreenDataModel()
    var isNewActivationScreen = false
    @State var inputText: String = ""
    var showsIllustratedMessage = false

    public init() {}
    
    public init(isNewActivationScreen: Bool = false, showsIllustratedMessage: Bool = false) {
        self.isNewActivationScreen = isNewActivationScreen
        self.showsIllustratedMessage = showsIllustratedMessage
    }
    
    var body: some View {
        VStack {
            if self.isNewActivationScreen == false {
                _ActivationScreen(model: self.model)
                    .footnoteModifier { $0.font(.fiori(forTextStyle: .headline)).foregroundColor(.green) }
                    .actionModifier { $0.disabled(self.model.textInput!.textInputValue.isEmpty) }
                    .textInputModifier { $0.padding(.top, 8)
                        .border(Color(UIColor.separator))
                    }
            } else {
                ActivationScreen(title: {
                    Text("Activation")
                        .foregroundStyle(.red)
                }, descriptionText: {
                    Text("If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding.")
                        .foregroundStyle(.blue)
                        .font(.fiori(forTextStyle: .subheadline))
                }, footnote: {
                    Text("Or")
                        .foregroundStyle(.green)
                        .font(.fiori(forTextStyle: .headline))
                }, action: {
                    FioriButton(title: "Use Your Email", action: { _ in
                        print("ActivationScreen Primary button clicked, email: \(self.inputText)")
                    })
                }, secondaryAction: {
                    Image(systemName: "qrcode.viewfinder")
                        .font(.largeTitle)
                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                        .padding(6)
                        .onTapGesture {
                            print("Camera is tapped")
                        }
                }, illustratedMessage: {
                    IllustratedMessage(detailImage: {
                        Image("IllustrationImage").resizable(resizingMode: .stretch)
                    }, title: {
                        Text("Activation")
                    }, description: {
                        Text("If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding.")
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    }, detailImageSize: .large)
                },
                inputText: self.$inputText,
                showsIllustratedMessage: self.showsIllustratedMessage)
            }
        }
    }
}

struct ActivationScreenSample_Previews: PreviewProvider {
    static var previews: some View {
        ActivationScreenSample()
    }
}
