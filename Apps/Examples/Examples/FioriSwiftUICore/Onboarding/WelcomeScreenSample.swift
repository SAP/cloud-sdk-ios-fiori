import FioriSwiftUICore
import SwiftUI

class WelcomeScreenDataModel: WelcomeScreenModel {
    var title_: String {
        "SAP Project Companion for Managers"
    }
    
    var descriptionText_: String? {
        "Please follow the instructions you received in the welcome email to start the activation process."
    }
    
    var primaryActionLabel_: String? {
        "Start"
    }
    
    func didSelectPrimaryAction() {
        print("WelcomeScreen Primary button clicked")
    }
    
    var subtitle_: String? {
        "abc@def.com"
    }
    
    var footnote_: String? {
        "Want to explore?"
    }
    
    var icon_: Image? {
        Image("SAPLogo")
    }
    
    var secondaryActionText_: String? {
        "Try Demo"
    }
    
    func didSelectSecondaryAction() {
        UIApplication.shared.open(URL(string: "http://www.google.com")!)
    }
}

struct WelcomeScreenSample: View {
    private var model = WelcomeScreenDataModel()
    
    public init() {}
    
    var body: some View {
        VStack {
            WelcomeScreen(title: model.title_, descriptionText: model.descriptionText_, primaryActionLabel: model.primaryActionLabel_, subtitle: model.subtitle_, footnote: model.footnote_, secondaryActionText: model.secondaryActionText_, icon: model.icon_, didSelectPrimaryActionClosure: model.didSelectPrimaryAction, didSelectSecondaryActionClosure: model.didSelectSecondaryAction)
                .footnoteModifier { $0.font(.headline).foregroundColor(.green) }
//                .subtitleModifier { $0.hidden() }
        }
    }
}

struct WelcomeScreenSample_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenSample()
    }
}
