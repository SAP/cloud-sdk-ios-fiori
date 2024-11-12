import FioriSwiftUICore
import SwiftUI

class InfoViewDataModel: InfoViewModel {
    var title: String = "SAP BTP SDK for iOS"
    var descriptionText: String? = "SAP BTP SDK for iOS enables you to quickly develop your own native apps, with Swift. The SDK extends the standard Swift Apple iOS frameworks with the reusable UI components from the SAP Fiori for iOS Design Language, and provides APIs which seamlessly integrate apps with SAP BTP services. "
    var showLoadingIndicator: Bool? = true
    var loadingIndicatorText: String? = ""
    
    lazy var action: _ActionModel? = ActionDataModel { [unowned self] in
        print("InfoView Primary button clicked")
    }

    lazy var secondaryAction: _ActionModel? = SecondaryActionDataModel { [unowned self] in
        print("InfoView secondary button clicked")
    }
    
    func didSelectAction() {
        print("InfoView Primary button clicked")
    }
    
    func didSelectSecondaryAction() {
        print("InfoView secondary button clicked")
    }
}

extension InfoViewDataModel {
    struct ActionDataModel: _ActionModel {
        let actionText: String? = "Next"
        
        let didSelectAction: (() -> Void)?
    }
    
    struct SecondaryActionDataModel: _ActionModel {
        let actionText: String? = "Start Tutorial"
        
        let didSelectAction: (() -> Void)?
    }
}

struct InfoViewSample: View {
    private var model = InfoViewDataModel()
    
    public init() {}
    
    var body: some View {
        VStack {
            InfoView(model: self.model)
        }
    }
}

struct InfoViewWithLoadingLabel: View {
    private var model = InfoViewDataModel()
    
    public init() {
        self.model.loadingIndicatorText = "Loading..."
    }
    
    var body: some View {
        VStack {
            InfoView(model: self.model)
        }
    }
}

struct InfoViewCustomized: View {
    private var model = InfoViewDataModel()
    
    public init() {}
    
    var body: some View {
        VStack {
            InfoView(model: self.model)
                .descriptionTextModifier { $0.font(.fiori(forTextStyle: .subheadline)).foregroundColor(.blue) }
                .actionModifier { $0.foregroundColor(.blue) }
                .loadingIndicatorViewStyle(CustomLoadingStyle())
        }
    }
}

struct CustomLoadingStyle: LoadingIndicatorViewStyle {
    func makeBody(_ configuration: LoadingIndicatorViewConfiguration) -> some View {
        LoadingIndicatorView(configuration)
            .indicatorTint(Color.pink)
            .indicatorControlSize(.large)
            .indicatorPosition(.bottom)
    }
}

struct InfoViewSample_Previews: PreviewProvider {
    static var previews: some View {
        InfoViewSample()
    }
}
