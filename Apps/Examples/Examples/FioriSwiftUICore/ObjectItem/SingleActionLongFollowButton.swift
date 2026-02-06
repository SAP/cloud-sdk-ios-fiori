import FioriSwiftUICore
import SwiftUI

struct SingleActionLongFollowButton: ObjectItemListDataProtocol {
    var isLongText = true
    
    init(cellTapped: Binding<Bool>) {}
    init() {}
    
    func numberOfSections() -> Int {
        2
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return 6
        default:
            return 1
        }
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        switch section {
        case 0:
            return "Toggle Buttons"
        case 1:
            return "Standard Buttons"
        default:
            return ""
        }
    }
    
    func containAccessoryView(_ indexPath: IndexPath) -> Bool {
        false
    }
    
    func cellForRow(_ indexPath: IndexPath) -> AnyView {
        let longText = "TEXT CAN WRAP TEXT CAN WRAP TEXT CAN WRAP TEXT CAN WRAP TEXT CAN WRAP TEXT CAN WRAP TEXT CAN WRAP TEXT CAN WRAP TEXT CAN WRAP TEXT CAN WRAP TEXT CAN WRAP TEXT CAN WRAP "
        let longHeadline = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra libero et mauris gravida tempor."
        
        let oi: any View
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            oi = ObjectItem(title: self.isLongText ? AttributedString(stringLiteral: longHeadline) : "Cafe Food Title That Is So Long It Has To Wrap",
                            footnote: "3493 followers",
                            action: FioriButton(title: AttributedString(stringLiteral: self.isLongText ? longText : "Follow"), action: { _ in print("Tapped Follow") }))
        case (0, 1):
            oi = ObjectItem(title: self.isLongText ? AttributedString(stringLiteral: longHeadline) : "Hybris",
                            footnote: "2290 followers",
                            action: FioriButton(title: AttributedString(stringLiteral: self.isLongText ? longText : "Follow"), action: { _ in print("Tapped Follow") }))
        case (0, 2):
            oi = ObjectItem(title: {
                Text(self.isLongText ? longHeadline : "Cafe Food Title That Is So Long It Has To Wrap")
            }, footnote: {
                Text("3493 followers")
            }, action: { FioriButton(action: { _ in print("Tapped Follow") }, label: { _ in Text(self.isLongText ? longText : "Follow") }) })
                .buttonStyle(PlainButtonStyle())
        case (0, 3):
            oi = ObjectItem(title: self.isLongText ? AttributedString(stringLiteral: longHeadline) : "Successfactors",
                            footnote: "1000 followers",
                            action: FioriButton(title: AttributedString(stringLiteral: self.isLongText ? longText : "Follow"), action: { _ in print("Tapped Follow") }))
        case (0, 4):
            oi = ObjectItem(title: self.isLongText ? AttributedString(stringLiteral: longHeadline) : "Tennis @ SAP",
                            footnote: "2290 followers",
                            action: FioriButton(title: AttributedString(stringLiteral: self.isLongText ? longText : "Follow"), action: { _ in print("Tapped Follow") }))
        case (0, 5):
            oi = ObjectItem(title: self.isLongText ? AttributedString(stringLiteral: longHeadline) : "SAP.io",
                            footnote: "537 followers",
                            action: FioriButton(title: AttributedString(stringLiteral: self.isLongText ? longText : "Follow"), action: { _ in print("Tapped Follow") }))
        case (1, 0):
            oi = ObjectItem(title: {
                Text(self.isLongText ? longHeadline : "Cafe Food Title That Is So Long It Has To Wrap")
            }, footnote: {
                Text("3493 followers")
            }, action: { FioriButton(action: { _ in print("Tapped Follow") }, label: { _ in Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra libero et mauris gravida tempor.") }) })
                .buttonStyle(PlainButtonStyle())
        default:
            oi = ObjectItem(title: "test")
        }
        
        return oi.typeErased
    }
}
