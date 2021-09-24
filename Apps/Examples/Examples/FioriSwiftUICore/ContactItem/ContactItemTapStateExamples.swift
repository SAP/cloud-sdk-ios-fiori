import FioriSwiftUICore
import SwiftUI

struct ContactItemViewModel: ContactItemModel, Identifiable {
    var title: String
    var subtitle: String?
    var descriptionText: String?
    var detailImage: Image?
    var actionItems: [ActivityItemDataType]?
    func didSelectActivityItem(_ activityItem: ActivityItemDataType) {}
    
    let id = UUID()
}

struct ContactItemTapStateExamples: View {
    let models: [ContactItemViewModel] = [ContactItemViewModel(title: "Seann Longname", detailImage: Image("person_square4").resizable(), actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)]),
                                          ContactItemViewModel(title: "Seann Longname", subtitle: "Team Lead", detailImage: Image("person_square4").resizable(), actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)])]
    @State var singleSelection: UUID?
    
    var body: some View {
        List(models, selection: $singleSelection) { model in
            ContactItem(model: model)
        }
        .navigationBarItems(trailing: EditButton())
        .navigationBarTitle("Tap State Examples", displayMode: .inline)
    }
}
