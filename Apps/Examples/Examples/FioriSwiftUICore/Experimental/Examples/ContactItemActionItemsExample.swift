import FioriSwiftUICore
import SwiftUI

struct ContactItemActionItemsExample: View {
    @ObservedObject var viewModel = ContactItemActionItemsExampleViewModel()
    @State private var useCompositeControl = false
    var body: some View {
        VStack {
            ScrollView {
                ExpHeaderView("Action Items", subtitle: "Option: ViewBuilder init - arbitrary use", desc: "pass an arbitrary view to represent actionItems")

                ContactItem {
                    Text("Title")
                } subtitle: {
                    Text("SubTitle")
                } descriptionText: {
                    Text("Description")
                } detailImage: {
                    EmptyView()
                } actionItems: {
                    LibraryPreviewData.Person.laurelosborn.actionItemsView
                }
                .exampleHighlighting()

                ExpHeaderView(nil, subtitle: "Option: ViewBuilder init - SDK reuse", desc: "pass an SDK standard composite view (control / container) to represent actionItems", back: .green, textColor: .white)
                
                ContactItem {
                    Text("Title")
                } subtitle: {
                    Text("SubTitle")
                } descriptionText: {
                    Text("Description")
                } actionItems: {
                    if useCompositeControl {
                        // equivalent to `ActivityItems(model: viewModel)`
                        ActivityItems(actionItems: viewModel.actionItems?.actionItems) { selectedActivity in
                            self.viewModel.selectedActivity = selectedActivity
                        }
                    } else {
                        ActivityControlLayoutContainer(viewModel.actionItems?.actionItems ?? []) { activity in
                            ActivityButtonView(activity) {
                                self.viewModel.selectedActivity = activity
                            }
                        }
                    }
                }
                .exampleHighlighting()

                ExpHeaderView(nil, subtitle: "Option: Type-based init", desc: "SDK will internally choose and initialize the control handling action items")

                ContactItem(title: viewModel.title, subtitle: viewModel.subtitle, descriptionText: viewModel.descriptionText,
                            detailImage: viewModel.detailImage, actionItems: viewModel.actionItems != nil ? ActivityItems(model: viewModel.actionItems!) : nil)
                    .exampleHighlighting()

                ExpHeaderView(nil, subtitle: "Option: Protocol/Model-based init", desc: "conform your model to protocol `ContactItemModel`")

                ContactItem(model: viewModel)
                    .exampleHighlighting()

                    .alert(isPresented: $viewModel.showingAlert, content: {
                        Alert(title: Text("Important message"), message: Text("Sending email to \(viewModel.selectedActivity?.data ?? "unknown")"), dismissButton: .default(Text("Got it!")))
                    })
            }
        }
    }
}

// MARK: Port

class ContactItemActionItemsExampleViewModel: ObservableObject {
    var model = LibraryPreviewData.Person.laurelosborn
    
    lazy var actionItems: ActivityItemsModel? = {
        let items: [ActivityItemDataType] = [
            .init(type: .email, data: "Laurel@example.com"),
            .init(type: .email, data: "Laurel@contoso.com")
        ]
        
        return ActivityItemsDataModel(actionItems: items) { activityItem in
            switch activityItem.type {
            case .email:
                print("send email to \(activityItem.data ?? "unknown")")
                self.selectedActivity = activityItem
            default:
                print("don't know how to handle this activity")
            }
        }
    }()
    
    @Published var showingAlert = false
    @Published var selectedActivity: ActivityItemDataType? = nil {
        didSet {
            self.showingAlert.toggle()
        }
    }
}

extension ContactItemActionItemsExampleViewModel: ContactItemModel, ActionItemsComponent {
    var title: String { self.model.title }
    var subtitle: String? { self.model.subtitle }
    var descriptionText: String? { self.model.descriptionText }
    var detailImage: Image? { self.model.detailImage }
    
    struct ActivityItemsDataModel: ActivityItemsModel {
        let actionItems: [ActivityItemDataType]?
        let didSelectActivityItem: ((ActivityItemDataType) -> Void)?
    }
}

// MARK: Preview

struct ContactItemActionItemsExample_Previews: PreviewProvider {
    static var previews: some View {
        ContactItemActionItemsExample()
    }
}
