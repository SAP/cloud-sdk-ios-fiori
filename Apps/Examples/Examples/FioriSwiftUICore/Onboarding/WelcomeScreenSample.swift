import FioriSwiftUICore
import SwiftUI

class WelcomeScreenDataModel: WelcomeScreenModel {
    var title_: String {
        "SAP Project Companion for Managers"
    }
    
    var descriptionText_: String? {
        "Please follow the instructions you received in the welcome email to start the activation process."
    }

    var primaryButton_: String? {
        "Start"
    }
  
    func clickAction() {
        print("WelcomeScreen Primary button clicked")
    }
    
    var subtitle_: String? {
        "abc@def.com"
    }
    
    var footnote_: String? {
        "Want to explore?"
    }
    
    var actionTitle_: String? {
        "Try Demo"
    }
    
    var icon_: Image? {
        Image("SAPLogo")
    }
}

struct WelcomeScreenSample: View {
    private var model = WelcomeScreenDataModel()
    
    public init() {}

    var body: some View {
        VStack {
            WelcomeScreen(title: model.title_, descriptionText: model.descriptionText_, primaryButton: model.primaryButton_, subtitle: model.subtitle_, footnote: model.footnote_, actionTitle: model.actionTitle_, icon: model.icon_, clickActionClosure: model.clickAction)
                .footnoteModifier { $0.font(.headline).foregroundColor(.green) }
                .subtitleModifier { $0.hidden() }
        }
    }
}

struct WelcomeScreenSample_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenSample()
    }
}
