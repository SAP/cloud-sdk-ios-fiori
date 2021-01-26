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

                ExpHeaderView(nil, subtitle: "Option: ViewBuilder init - SDK reuse", desc: "pass an SDK standard composite view (control / container) to represent actionItems", back: .green, textColor: .white)

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
                        // equivalent to `ActivityItems(model: viewModel)`
                        ActivityItems(items: viewModel.activityItems_) { selectedActivity in
                            self.viewModel.selectedActivity = selectedActivity
                        }
                    } else {
                        ActivityControlLayoutContainer(viewModel.activityItems_) { activity in
                            ActivityButtonView(activity) {
                                self.viewModel.selectedActivity = activity
                            }
                        }

                        // offer optional action handler which is backed by onTapGesture ??
//                        ActivityControlLayoutContainer(viewModel.activityItems_, action: viewModel.didSelect) { activity in
//                            Text(activity.id.uuidString)
//                        }
                    }
                }
                .exampleHighlighting()

                ExpHeaderView(nil, subtitle: "Option: Type-based init", desc: "CodeGen changes needed to handle behavior protocol; optionally pass items via function builder")

                ContactItem(title: "TitleString", subtitle: "SubtitleString", footnote: nil, descriptionText: nil, detailImage: nil, actionItems: [.init(type: .email, data: "address@gmail.com")], actionItemHandler: { selectedActivity in
                    self.viewModel.selectedActivity = selectedActivity
                }).exampleHighlighting()

                ExpHeaderView(nil, subtitle: "Option: Protocol/Model-based init", desc: "CodeGen changes needed to handle behavior protocol")

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
