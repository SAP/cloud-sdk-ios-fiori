import FioriSwiftUICore
import SwiftUI

struct ContactItemActionItemsExample: View {
    @ObservedObject var viewModel = ContactItemActionItemsExampleViewModel()
    @State private var useCompositeControl = false
    var body: some View {
        VStack {
            ScrollView {
                ExpHeaderView("Action Items", subtitle: "Option: Single ViewBuilder prop", desc: "pass a custom composite view to represent actionItems")

                ContactItem {
                    Text("Title")
                } subtitle: {
                    Text("SubTitle")
                } footnote: {
                    Text("Footnote")
                } descriptionText: {
                    Text("Description")
                } detailImage: {
                    EmptyView()
                } actionItems: {
                    LibraryPreviewData.Person.laurelosborn.actionItems
                }
                .exampleHighlighting()

                ExpHeaderView(nil, subtitle: "Option: Model-based Init Default implementation", desc: "difficult for view event handling")

                ContactItem(model: viewModel)
                    .exampleHighlighting()

                ExpHeaderView(nil, subtitle: "Option: Composite Control / Container", desc: "pass a standard composite view to represent actionItems", back: .green, textColor: .white)

                ContactItem {
                    Text("Title")
                } subtitle: {
                    Text("SubTitle")
                } footnote: {
                    Text("Footnote")
                } descriptionText: {
                    Text("Description")
                } detailImage: {
                    EmptyView()
                } actionItems: {
                    if useCompositeControl {
                        ActivityItems(model: viewModel)
                    } else {
                        ActivityControlLayoutContainer(viewModel.activityItems_) { activity in
                            ActivityButtonView(activity) {
                                self.viewModel.selectedActivity = activity
                            }
                        }
                    }
                }
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
    @Published var selectedActivity: ActivityItem? = nil {
        didSet {
            self.showingAlert.toggle()
        }
    }
}

extension ContactItemActionItemsExampleViewModel: ContactItemModel, ActivityItemsComponent {
    var title_: String { self.model.title_ }
    var subtitle_: String? { self.model.subtitle_ }
    var footnote_: String? { self.model.footnote_ }
    var descriptionText_: String? { self.model.descriptionText_ }
    var detailImage_: Image? { self.model.detailImage_ }
    var activityItems_: [ActivityItem] {
        let activities: [ActivityItem] = [ActivityItem.email, .init(type: .email, data: "cba@gmail.com")]
        return activities
    }
}

extension ContactItemActionItemsExampleViewModel: ActivityItemsBehavior {
    func didSelect(_ activityItem: ActivityItem) {
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
