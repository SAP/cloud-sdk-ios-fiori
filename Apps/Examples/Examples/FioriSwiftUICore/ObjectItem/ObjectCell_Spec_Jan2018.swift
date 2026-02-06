import FioriSwiftUICore
import SwiftUI

struct ObjectCell_Spec_Jan2018: ObjectItemListDataProtocol {
    init(cellTapped: Binding<Bool>) {}
    init() {}
    
    func numberOfSections() -> Int {
        5
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 3
        default:
            return 1
        }
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        switch section {
        case 0:
            return "Page 8: Alignment- Headline label only"
        case 1:
            return "Page 9: Regular View"
        case 2:
            return "Page 10: Icon Stack-Padding"
        case 3:
            return "Page 11: Profile Image Variations"
        default:
            return ""
        }
    }
    
    func containAccessoryView(_ indexPath: IndexPath) -> Bool {
        true
    }
    
    func cellForRow(_ indexPath: IndexPath) -> AnyView {
        let oi: any View
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            oi = ObjectItem(title: "Lorem ipseum dolor",
                            footnote: "Words\nSeparated\nNewLineChars and this is Just some really long text that is here dont worry about it too much",
                            description: "Some description",
                            status: .both("Some status", Image(systemName: "paperplane")),
                            substatus: TextOrIcon.text("some substatus"))
                .footnoteStyle {
                    Footnote($0)
                        .lineLimit(4)
                }
                .statusStyle(.positiveLabel)
        case (0, 1):
            oi = ObjectItem(title: {
                Text("Lorem ipseum dolor")
            }, footnote: {
                Text("NewLineChars and this is Just some really long text that is here dont worry about it too much\nWords\nSeparated")
                    .lineLimit(4)
            }, description: {
                Text("Some description")
            }, status: {
                Text("Some status")
            }, substatus: {
                Text("some substatus").font(.system(size: 32))
            })
        case (0, 2):
            oi = ObjectItem(title: {
                Text("John Jacob Jingleheimer Schmidt")
            }, description: {
                Text("Description is one line of text without wrapping")
            }, status: {
                Text("Available").foregroundColor(.preferredColor(.negativeLabel))
            }, detailImage: {
                Image("ProfilePic").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
            .splitPercent(0.5)
        case (1, 0):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, description: {
                Text("Customer discussed he needs a table to accommodate a family of 7.")
            }, status: {
                Text("Available").foregroundColor(.preferredColor(.positiveLabel))
            }, detailImage: {
                Image("ProfilePic").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
            .splitPercent(0.5)
        case (1, 1):
            oi = ObjectItem(title: {
                Text("No Description Set")
            }, subtitle: {
                Text("Three Phase Pad Mounted Transformer (533423)")
            }, footnote: {
                Text("1000 - Hamburg, MECHANIK")
            }, status: {
                Image(systemName: "exclamationmark.square.fill").accessibilityLabel("Warning")
            }, substatus: {
                Text("Scheduled")
            }, detailImage: {
                Image("oski").resizable().frame(width: 45, height: 45)
            })
        case (1, 2):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, footnote: {
                Text("San Carlos, CA. USA")
            }, description: {
                Text("Customer discussed he needs a and chair to table to accommodate a big family.  This is really important so they can all eat dinner at the same time.")
            }, status: {
                Text("This is a long status")
            }, substatus: {
                Image(systemName: "checkmark.circle.fill").foregroundColor(.preferredColor(.tertiaryLabel))
            }, detailImage: {
                Image("ProfilePic").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
            .splitPercent(0.5)
        case (2, 0):
            oi = ObjectItem(title: {
                Text("Rouja Pakiman")
            }, subtitle: {
                Text("Java Developer")
            }, footnote: {
                Text("San Carlos, CA. USA")
            }, description: {
                Text("Customer discussed he needs a and chair to table to accommodate a big family.  This is really important so they can all eat dinner at the same time.")
            }, status: {
                Text("This is a long status").foregroundColor(.preferredColor(.positiveLabel))
            }, substatus: {
                Image(systemName: "checkmark.circle.fill").foregroundColor(.preferredColor(.tertiaryLabel))
            }, detailImage: {
                Image("ProfilePic").resizable().frame(width: 45, height: 45).clipShape(Circle())
            })
            .splitPercent(0.5)
        case (3, 0):
            oi = ObjectItem(title: "Multi-profile image needs to be developed")
            
        case (4, 0):
            oi = ObjectItem(title: "Headline")
        default:
            oi = ObjectItem(title: "Lorem ipseum dolor")
        }
        
        return oi.typeErased
    }
}
