import Combine
import FioriSwiftUICore
import SwiftUI

class WelcomeScreenDataModel: WelcomeScreenModel, ObservableObject {
    // Changes in nested observable object will not trigger refresh. Need to send notification by explicitly calling `send()`
    @Published var textInput: TextInputModel?
    lazy var action: ActionModel? = {
        ActionDataModel { [unowned self] in
            print("Primary button clicked: \(self.textInput!.textInputValue)")
        }
    }()

    lazy var secondaryAction: ActionModel? = {
        SecondaryActionDataModel { [unowned self] in
            UIApplication.shared.open(URL(string: "http://www.google.com")!)
        }
    }()

    var title: String = "SAP Project Companion for Managers"
    var descriptionText: String? = "Please follow the instructions you received in the welcome email to start the activation process."
    var subtitle: String? = "abc@def.com"
    var footnote: String? = "Want to explore?"
    var icon: Image? = Image("SAPLogo")
    
    var cancellable: AnyCancellable?
    
    init() {
        let inputModel = TextInputDataModel()
        
        self.cancellable = inputModel.objectWillChange.sink { [weak self] in
            self?.objectWillChange.send()
        }
        
        self._textInput = Published(wrappedValue: inputModel)
    }
}

extension WelcomeScreenDataModel {
    class TextInputDataModel: TextInputModel, ObservableObject {
        @Published var textInputValue: String = ""
        
        var onCommit: (() -> Void)? = {
            print("TextInputField commit")
        }
    }
    
    struct ActionDataModel: ActionModel {
        let actionText: String? = "Start"
        
        let didSelectAction: (() -> Void)?
    }
    
    struct SecondaryActionDataModel: ActionModel {
        let actionText: String? = "Try Demo"
        
        let didSelectAction: (() -> Void)?
    }
}

struct WelcomeScreenSample: View {
    @StateObject var model = WelcomeScreenDataModel()

    public init() {}
    
    var body: some View {
        VStack {
            WelcomeScreen(model: model)
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
                .actionTextModifier { content in
                    content.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
                        .disabled(model.textInput?.textInputValue.isEmpty ?? true)
                }
                .textInputModifier { $0.disableAutocorrection(true) }
        }
    }
}

struct WelcomeScreenSample_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenSample()
    }
}
