import FioriSwiftUICore
import SwiftUI

struct SingleActionLongFollowButton: ListDataProtocol {
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
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            let oi = ObjectItem(title: isLongText ? longHeadline : "Cafe Food Title That Is So Long It Has To Wrap",
                                footnote: "3493 followers",
                                actionText: self.isLongText ? longText : "Follow") {
                print("Tapped Follow")
            }
            
            return AnyView(oi)
            
        case (0, 1):
            let oi = ObjectItem(title: isLongText ? longHeadline : "Hybris",
                                footnote: "2290 followers",
                                actionText: self.isLongText ? longText : "Follow") {
                print("Tapped Follow")
            }
            
            return AnyView(oi)
            
        case (0, 2):
            let oi = ObjectItem(title: {
                Text(isLongText ? longHeadline : "Cafe Food Title That Is So Long It Has To Wrap")
            }, footnote: {
                Text("3493 followers")
            }, actionText: {
                Button {
                    print("Tapped Follow")
                } label: {
                    Text(isLongText ? longText : "Follow")
                }.buttonStyle(PlainButtonStyle())
            })
            
            return AnyView(oi)
        
        case (0, 3):
            let oi = ObjectItem(title: isLongText ? longHeadline : "Successfactors",
                                footnote: "1000 followers",
                                actionText: self.isLongText ? longText : "Follow") {
                print("Tapped Follow")
            }
            return AnyView(oi)
            
        case (0, 4):
            let oi = ObjectItem(title: isLongText ? longHeadline : "Tennis @ SAP",
                                footnote: "2290 followers",
                                actionText: self.isLongText ? longText : "Follow") {
                print("Tapped Follow")
            }
            return AnyView(oi)
            
        case (0, 5):
            let oi = ObjectItem(title: isLongText ? longHeadline : "SAP.io",
                                footnote: "537 followers",
                                actionText: self.isLongText ? longText : "Follow") {
                print("Tapped Follow")
            }
            return AnyView(oi)
            
        case (1, 0):
            let oi = ObjectItem(title: {
                Text(isLongText ? longHeadline : "Cafe Food Title That Is So Long It Has To Wrap")
            }, footnote: {
                Text("3493 followers")
            }, actionText: {
                Button {
                    print("Tapped Follow")
                } label: {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra libero et mauris gravida tempor.")
                }.buttonStyle(PlainButtonStyle())
            })
            
            return AnyView(oi)
            
        default:
            return AnyView(ObjectItem(title: "test"))
        }
    }
}
