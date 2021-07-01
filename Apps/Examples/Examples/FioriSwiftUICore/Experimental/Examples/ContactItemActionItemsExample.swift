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
                    LibraryPreviewData.Person.laurelosborn.actionItems
                }
                .exampleHighlighting()

                ExpHeaderView(nil, subtitle: "Option: ViewBuilder init - SDK reuse", desc: "pass an SDK standard composite view (control / container) to represent actionItems", back: .green, textColor: .white)

                ContactItem {
                    Text("Title")
                } subtitle: {
                    Text("SubTitle")
                } descriptionText: {
                    Text("Description")
                } detailImage: {
                    EmptyView()
                } actionItems: {
                    if useCompositeControl {
                        // equivalent to `ActivityItems(model: viewModel)`
                        ActivityItems(actionItems: viewModel.actionItems_ ?? []) { selectedActivity in
                            self.viewModel.selectedActivity = selectedActivity
                        }
                    } else {
                        ActivityControlLayoutContainer(viewModel.actionItems_!) { activity in
                            ActivityButtonView(activity) {
                                self.viewModel.selectedActivity = activity
                            }
                        }
                    }
                }
                .exampleHighlighting()

                ExpHeaderView(nil, subtitle: "Option: Type-based init", desc: "SDK will internally choose and initialize the control handling action items")

                ContactItem(title: viewModel.title_, subtitle: viewModel.subtitle_, descriptionText: viewModel.descriptionText_,
                            detailImage: viewModel.detailImage_, actionItems: viewModel.actionItems_, didSelectActivityItem: viewModel.didSelectActivityItem(_:))
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
    
    @Published var showingAlert = false
    @Published var selectedActivity: ActivityItemDataType? = nil {
        didSet {
            self.showingAlert.toggle()
        }
    }
}

extension ContactItemActionItemsExampleViewModel: ContactItemModel, ActionItemsComponent {
    var title_: String { self.model.title_ }
    var subtitle_: String? { self.model.subtitle_ }
    var descriptionText_: String? { self.model.descriptionText_ }
    var detailImage_: Image? { self.model.detailImage_ }

    var actionItems_: [ActivityItemDataType]? {
        let activities: [ActivityItemDataType] = [
            .init(type: .email, data: "Laurel@example.com"),
            .init(type: .email, data: "Laurel@contoso.com")
        ]
        return activities
    }

    func didSelectActivityItem(_ activityItem: ActivityItemDataType) {
        switch activityItem.type {
        case .email:
            print("send email to \(activityItem.data ?? "unknown")")
            self.selectedActivity = activityItem
        default:
            print("don't know how to handle this activity")
        }
    }
}

// MARK: Preview

struct ContactItemActionItemsExample_Previews: PreviewProvider {
    static var previews: some View {
        ContactItemActionItemsExample()
    }
}
