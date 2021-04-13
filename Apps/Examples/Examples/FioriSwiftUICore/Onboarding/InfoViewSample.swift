import FioriSwiftUICore
import SwiftUI

class InfoViewDataModel: InfoViewModel {
    var title_: String = "SAP BTP SDK for iOS"
    var descriptionText_: String? = "SAP BTP SDK for iOS enables you to quickly develop your own native apps, with Swift. The SDK extends the standard Swift Apple iOS frameworks with the reusable UI components from the SAP Fiori for iOS Design Language, and provides APIs which seamlessly integrate apps with SAP BTP services. "
    
    var actionText_: String? = "Next"
    var secondaryActionText_: String? = "Start Tutorial"
    
    func didSelectAction() {
        print("InfoView Primary button clicked")
    }
    
    func didSelectSecondaryAction() {
        print("InfoView secondary button clicked")
    }
}

struct InfoViewSample: View {
    private var model = InfoViewDataModel()
    
    public init() {}
    
    var body: some View {
        VStack {
            InfoView(title: model.title_, descriptionText: model.descriptionText_, actionText: model.actionText_, secondaryActionText: model.secondaryActionText_, didSelectAction: model.didSelectAction, didSelectSecondaryAction: model.didSelectSecondaryAction)
                .descriptionTextModifier { $0.font(.subheadline).foregroundColor(.blue) }
                .actionTextModifier { $0.foregroundColor(.blue) }
        }
    }
}

struct InfoViewSample_Previews: PreviewProvider {
    static var previews: some View {
        InfoViewSample()
    }
}
