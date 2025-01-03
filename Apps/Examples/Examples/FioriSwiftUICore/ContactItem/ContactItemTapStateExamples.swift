import FioriSwiftUICore
import SwiftUI

struct ContactItemViewModel: _ContactItemModel, Identifiable {
    var title: String
    var subtitle: String?
    var descriptionText: String?
    var detailImage: Image?
    var actionItemsData: [ActivityItemDataType]?
    func didSelectActivityItem(_ activityItem: ActivityItemDataType) {}
    
    var actionItems: (any _ActivityItemsModel)?
    
    let id = UUID()
    
    struct ContactItemDataModel: _ActivityItemsModel {
        let actionItems: [ActivityItemDataType]?
        let didSelectActivityItem: ((ActivityItemDataType) -> Void)?
    }
    
    init(title: String, subtitle: String? = nil, descriptionText: String? = nil, detailImage: Image? = nil, actionItemsData: [ActivityItemDataType]? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.descriptionText = descriptionText
        self.detailImage = detailImage
        self.actionItemsData = actionItemsData
        self.actionItems = ContactItemDataModel(actionItems: actionItemsData, didSelectActivityItem: self.didSelectActivityItem)
    }
}

struct ContactItemTapStateExamples: View {
    var _isNewObjectItem = false
    
    let models: [ContactItemViewModel] = [ContactItemViewModel(title: "Seann Longname", detailImage: Image("person_square4").resizable(), actionItemsData: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)]),
                                          ContactItemViewModel(title: "Seann Longname", subtitle: "Team Lead", detailImage: Image("person_square4").resizable(), actionItemsData: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)])]
    @State var singleSelection: UUID?
    
    var body: some View {
        List(self.models, selection: self.$singleSelection) { model in
            if self._isNewObjectItem {
                ContactItem {
                    Text(model.title)
                } subtitle: {
                    Text(model.subtitle ?? "")
                } description: {
                    Text(model.descriptionText ?? "")
                } detailImage: {
                    Group {
                        if let detailImage = model.detailImage {
                            detailImage
                        } else {
                            EmptyView()
                        }
                    }
                } activityItems: {
                    ActivityItems(activityItems: model.actionItemsData ?? [])
                        .activityItemsStyle { conf in
                            conf.activityItems
                                .foregroundColor(.red)
                                .font(.fiori(forTextStyle: .headline).weight(.bold))
                        }
                }
                .titleStyle { conf in
                    conf.title
                        .foregroundStyle(Color.green)
                        .font(.fiori(forTextStyle: .headline).weight(.bold))
                }
                .subtitleStyle(content: { conf in
                    conf.subtitle
                        .foregroundStyle(Color.blue)
                        .font(.fiori(forTextStyle: .headline).weight(.bold))
                })
                .descriptionStyle { conf in
                    conf.description
                        .foregroundStyle(Color.yellow)
                        .font(.fiori(forTextStyle: .headline).weight(.bold))
                }
                .detailImageStyle { conf in
                    conf.detailImage
                        .backgroundStyle(Color.red)
                        .font(.fiori(forTextStyle: .headline).weight(.bold))
                }
            } else {
                _ContactItem(model: model)
            }
        }
        .navigationBarItems(trailing: EditButton())
        .navigationBarTitle("Tap State Examples", displayMode: .inline)
    }
}
