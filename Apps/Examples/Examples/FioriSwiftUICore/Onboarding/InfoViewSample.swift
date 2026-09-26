import FioriSwiftUICore
import SwiftUI

class InfoViewDataModel {
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
    @State var showLoadingView: Bool = true
    private var model = InfoViewDataModel()
    
    public init() {}
    
    var body: some View {
        VStack {
            if self.showLoadingView {
                // Initially only show the title and the loading indicator.
                let loadingIndicator = LoadingIndicator(title: "", isPresented: self.$showLoadingView)
                
                InfoView(title: AttributedString(self.model.title), loadingIndicator: loadingIndicator)
            } else {
                // After a few seconds, show the full InfoView without the loading indicator.
                InfoView(title: AttributedString(self.model.title), descriptionText: AttributedString(self.model.descriptionText ?? ""), action: FioriButton(title: "Next", action: { _ in
                    print("InfoView Primary button clicked")
                }), secondaryAction: FioriButton(title: "Start Tutorial", action: { _ in
                    print("InfoView secondary button clicked")
                }))
            }
        }
        .task {
            // Wait for a few seconds, then hide the loading indicator
            // and switch to the InfoView without the loading indicator.
            try? await Task.sleep(nanoseconds: 3 * 1_000_000_000)
            self.showLoadingView = false
        }
    }
}

struct InfoViewWithLoadingLabel: View {
    @State var showLoadingView: Bool = true
    private var model = InfoViewDataModel()
    
    public init() {
        self.model.loadingIndicatorText = "Loading..."
    }
    
    var body: some View {
        VStack {
            if self.showLoadingView {
                // Initially only show the title and the loading indicator.
                let loadingIndicator = LoadingIndicator(title: {
                    Text(AttributedString(self.model.loadingIndicatorText ?? ""))
                        .font(.fiori(forTextStyle: .body))
                }, progress: { ProgressView() }, isPresented: self.$showLoadingView)
                
                InfoView(title: { Text(AttributedString(self.model.title)) },
                         loadingIndicator: { loadingIndicator })
            } else {
                // After a few seconds, show the full InfoView without the loading indicator.
                InfoView(title: AttributedString(self.model.title),
                         descriptionText: AttributedString(self.model.descriptionText ?? ""),
                         action: FioriButton(title: "Next", action: { _ in
                             print("InfoView Primary button clicked")
                         }),
                         secondaryAction: FioriButton(title: "Start Tutorial", action: { _ in
                             print("InfoView secondary button clicked")
                         }))
            }
        }
        .task {
            // Wait for a few seconds, then hide the loading indicator
            // and switch to the InfoView without the loading indicator.
            try? await Task.sleep(nanoseconds: 3 * 1_000_000_000)
            self.showLoadingView = false
        }
    }
}

struct InfoViewCustomized: View {
    @State var showLoadingView: Bool = true
    private var model = InfoViewDataModel()
    
    public init() {}
    
    var body: some View {
        VStack {
            if self.showLoadingView {
                // Initially only show the title and the loading indicator.
                let loadingIndicator = LoadingIndicator(title: { Text("") }, progress: { ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .red)) }, isPresented: self.$showLoadingView)
                
                InfoView(title: { Text(AttributedString(self.model.title)) },
                         loadingIndicator: { loadingIndicator })
            } else {
                // After a few seconds, show the full InfoView without the loading indicator.
                InfoView(title: { Text(AttributedString(self.model.title)) },
                         descriptionText: { Text(AttributedString(self.model.descriptionText ?? "")).foregroundColor(.blue) },
                         action: {
                             FioriButton(title: "Next") { _ in
                                 print("InfoView Primary button clicked")
                             }
                         },
                         secondaryAction: {
                             Button("Start Tutorial") {
                                 print("InfoView secondary button clicked")
                             }
                         })
            }
        }
        .task {
            // Wait for a few seconds, then hide the loading indicator
            // and switch to the InfoView without the loading indicator.
            try? await Task.sleep(nanoseconds: 3 * 1_000_000_000)
            self.showLoadingView = false
        }
    }
}

struct InfoViewSample_Previews: PreviewProvider {
    static var previews: some View {
        InfoViewSample()
    }
}
