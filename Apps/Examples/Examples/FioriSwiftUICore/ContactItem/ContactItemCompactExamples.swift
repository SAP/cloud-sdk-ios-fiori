import FioriSwiftUICore
import SwiftUI

struct ContactItemCompactExamples: ListDataProtocol {
    init(cellTapped: Binding<Bool>) {}
    init() {}
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        6
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        switch section {
        case 0:
            return "General"
        default:
            return ""
        }
    }
    
    func containAccessoryView(_ indexPath: IndexPath) -> Bool {
        false
    }
    
    func cellForRow(_ indexPath: IndexPath) -> AnyView {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            let ci = ContactItem(title: "Seann Longname", actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            
            return AnyView(ci)
            
        case (0, 1):
            let ci = ContactItem(title: "Headline example is allowd to wrap two lines ok", actionItems: ActivityItems(actionItems: [.init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            
            return AnyView(ci)
        
        case (0, 2):
            let ci = ContactItem(title: "Sean Long has a name that wraps two lines", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            
            return AnyView(ci)
            
        case (0, 3):
            let ci = ContactItem(title: "Headline example when it wrapps two lines", subtitle: "Team Lead", actionItems: ActivityItems(actionItems: [.init(type: .email), .init(type: .phone)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            
            return AnyView(ci)
            
        case (0, 4):
            let ci = ContactItem(title: "Seann Longname", subtitle: "Team Lead", actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
                .splitPercent(0.3)
            
            return AnyView(ci)
            
        case (0, 5):
            let ci = ContactItem(title: "Headline when\n wrapps 2 lines", subtitle: "Team Lead", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
                .splitPercent(0.3)
            
            return AnyView(ci)
            
        default:
            return AnyView(ContactItem(title: "Lorem ipseum dolor"))
        }
    }
}
