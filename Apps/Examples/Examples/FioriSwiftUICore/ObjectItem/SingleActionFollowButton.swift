import FioriSwiftUICore
import SwiftUI

struct SingleActionFollowButton: ObjectItemListDataProtocol {
    var isLongText = false
    var isNewObjectItem = false
    
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
            if self.isNewObjectItem {
                oi = ObjectItem(title: self.isLongText ? AttributedString(stringLiteral: longHeadline) : "Cafe Food Title That Is So Long It Has To Wrap",
                                footnote: "3493 followers",
                                action: FioriButton(title: AttributedString(stringLiteral: self.isLongText ? longText : "Follow"), action: { _ in print("Tapped Follow") }))
            } else {
                oi = _ObjectItem(title: self.isLongText ? longHeadline : "Cafe Food Title That Is So Long It Has To Wrap",
                                 footnote: "3493 followers",
                                 action: _Action(actionText: self.isLongText ? longText : "Follow", didSelectAction: {
                                     print("Tapped Follow")
                                 }))
            }
            
        case (0, 1):
            if self.isNewObjectItem {
                oi = ObjectItem(title: self.isLongText ? AttributedString(stringLiteral: longHeadline) : "Hybris",
                                footnote: "2290 followers",
                                action: FioriButton(title: AttributedString(stringLiteral: self.isLongText ? longText : "Follow"), action: { _ in print("Tapped Follow") }))
            } else {
                oi = _ObjectItem(title: self.isLongText ? longHeadline : "Hybris",
                                 footnote: "2290 followers",
                                 action: _Action(actionText: self.isLongText ? longText : "Follow", didSelectAction: {
                                     print("Tapped Follow")
                                 }))
            }
            
        case (0, 2):
            if self.isNewObjectItem {
                oi = ObjectItem(title: {
                    Text(isLongText ? longHeadline : "Cafe Food Title That Is So Long It Has To Wrap")
                }, footnote: {
                    Text("3493 followers")
                }, action: { FioriButton(title: AttributedString(stringLiteral: self.isLongText ? longText : "Follow"), action: { _ in print("Tapped Follow") }) })
                    .buttonStyle(PlainButtonStyle())
            } else {
                oi = _ObjectItem(title: {
                    Text(isLongText ? longHeadline : "Cafe Food Title That Is So Long It Has To Wrap")
                }, footnote: {
                    Text("3493 followers")
                }, action: {
                    Button {
                        print("Tapped Follow")
                    } label: {
                        Text(isLongText ? longText : "Follow")
                            .font(.callout)
                            .lineLimit(2)
                            .foregroundColor(Color.preferredColor(.tintColor))
                            .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
                            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.preferredColor(.tintColor), lineWidth: 1))
                    }
                    .buttonStyle(PlainButtonStyle())
                })
            }
            
        case (0, 3):
            if self.isNewObjectItem {
                oi = ObjectItem(title: self.isLongText ? AttributedString(stringLiteral: longHeadline) : "Successfactors",
                                footnote: "1000 followers",
                                action: FioriButton(title: AttributedString(stringLiteral: self.isLongText ? longText : "Follow"), action: { _ in print("Tapped Follow") }))
            } else {
                oi = _ObjectItem(title: self.isLongText ? longHeadline : "Successfactors",
                                 footnote: "1000 followers",
                                 action: _Action(actionText: self.isLongText ? longText : "Follow", didSelectAction: {
                                     print("Tapped Follow")
                                 }))
            }
            
        case (0, 4):
            if self.isNewObjectItem {
                oi = ObjectItem(title: self.isLongText ? AttributedString(stringLiteral: longHeadline) : "Tennis @ SAP",
                                footnote: "2290 followers",
                                action: FioriButton(title: AttributedString(stringLiteral: self.isLongText ? longText : "Follow"), action: { _ in print("Tapped Follow") }))
            } else {
                oi = _ObjectItem(title: self.isLongText ? longHeadline : "Tennis @ SAP",
                                 footnote: "2290 followers",
                                 action: _Action(actionText: self.isLongText ? longText : "Follow", didSelectAction: {
                                     print("Tapped Follow")
                                 }))
            }
            
        case (0, 5):
            if self.isNewObjectItem {
                oi = ObjectItem(title: self.isLongText ? AttributedString(stringLiteral: longHeadline) : "SAP.io",
                                footnote: "537 followers",
                                action: FioriButton(title: AttributedString(stringLiteral: self.isLongText ? longText : "Follow"), action: { _ in print("Tapped Follow") }))
            } else {
                oi = _ObjectItem(title: self.isLongText ? longHeadline : "SAP.io",
                                 footnote: "537 followers",
                                 action: _Action(actionText: self.isLongText ? longText : "Follow", didSelectAction: {
                                     print("Tapped Follow")
                                 }))
            }
            
        case (1, 0):
            if self.isNewObjectItem {
                oi = ObjectItem(title: {
                    Text(isLongText ? longHeadline : "Cafe Food Title That Is So Long It Has To Wrap")
                }, footnote: {
                    Text("3493 followers")
                }, action: { FioriButton(action: { _ in print("Tapped Follow") }, label: { _ in Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra libero et mauris gravida tempor.") }) })
                    .buttonStyle(PlainButtonStyle())
            } else {
                oi = _ObjectItem(title: {
                    Text(isLongText ? longHeadline : "Cafe Food Title That Is So Long It Has To Wrap")
                }, footnote: {
                    Text("3493 followers")
                }, action: {
                    Button {
                        print("Tapped Follow")
                    } label: {
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra libero et mauris gravida tempor.")
                            .font(.callout)
                            .lineLimit(2)
                            .foregroundColor(Color.preferredColor(.tintColor))
                            .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
                            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.preferredColor(.tintColor), lineWidth: 1))
                    }.buttonStyle(PlainButtonStyle())
                })
            }
            
        default:
            oi = _ObjectItem(title: "test")
        }
        
        return oi.typeErased
    }
}
