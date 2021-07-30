import FioriSwiftUICore
import SwiftUI

struct ContactItemViewModel: ContactItemModel, Identifiable {
    var title_: String
    var subtitle_: String?
    var descriptionText_: String?
    var detailImage_: Image?
    var actionItems_: [ActivityItemDataType]?
    func didSelectActivityItem(_ activityItem: ActivityItemDataType) {}
    
    let id = UUID()
}

struct ContactItemTapStateExamples: View {
    let models: [ContactItemViewModel] = [ContactItemViewModel(title_: "Seann Longname", detailImage_: Image("person_square4").resizable(), actionItems_: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)]),
                                          ContactItemViewModel(title_: "Seann Longname", subtitle_: "Team Lead", detailImage_: Image("person_square4").resizable(), actionItems_: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)])]
    @State var singleSelection: UUID?
    
    var body: some View {
        List(models, selection: $singleSelection) { model in
            ContactItem(model: model)
        }
        .navigationBarItems(trailing: EditButton())
        .navigationBarTitle("Tap State Examples", displayMode: .inline)
    }
}
