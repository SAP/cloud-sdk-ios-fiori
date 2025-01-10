import FioriSwiftUICore
import SwiftUI

struct ContactItemCompactExamples: ObjectItemListDataProtocol {
    var isNewObjectItem = false
    
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
        if self.isNewObjectItem {
            switch (indexPath.section, indexPath.row) {
            case (0, 0):
                let item = ContactItem(title: "Seann Longname", activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                
                return item.typeErased
                
            case (0, 1):
                let item = ContactItem(title: "Headline example is allowed to wrap two lines ok", activityItems: [.init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                
                return item.typeErased
            
            case (0, 2):
                let item = ContactItem(title: "Sean Long has a name that wraps two lines", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                
                return item.typeErased
                
            case (0, 3):
                let item = ContactItem(title: "Headline example when it wraps two lines", subtitle: "Team Lead", activityItems: [.init(type: .email, didSelectActivityItem: {
                    print("tap email")
                }), .init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                })])
                
                return item.typeErased
                
            case (0, 4):
                let item = ContactItem(title: "Seann Longname", subtitle: "Team Lead", activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(0.3)
                
                return item.typeErased
                
            case (0, 5):
                let item = ContactItem(title: "Headline when\n wraps 2 lines", subtitle: "Team Lead", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(0.3)
                .activityItemsStyle { conf in
                    conf.activityItems
                        .foregroundColor(.red)
                        .font(.fiori(forTextStyle: .headline).weight(.bold))
                }
                .titleStyle { conf in
                    conf.title
                        .foregroundStyle(Color.red)
                        .font(.fiori(forTextStyle: .headline).weight(.bold))
                        .lineLimit(nil)
                }
                .subtitleStyle(content: { conf in
                    conf.subtitle
                        .foregroundStyle(Color.green)
                        .font(.fiori(forTextStyle: .headline).weight(.bold))
                        .lineLimit(nil)
                })
                .descriptionStyle { conf in
                    conf.description
                        .foregroundStyle(Color.blue)
                        .font(.fiori(forTextStyle: .headline).weight(.bold))
                        .lineLimit(nil)
                }
                .detailImageStyle { conf in
                    conf.detailImage
                        .backgroundStyle(Color.yellow)
                        .font(.fiori(forTextStyle: .headline).weight(.bold))
                        .clipShape(Rectangle())
                }
                
                return item.typeErased
                
            default:
                return ContactItem(title: "Lorem ipseum dolor").typeErased
            }
        } else {
            switch (indexPath.section, indexPath.row) {
            case (0, 0):
                let ci = _ContactItem(title: "Seann Longname", actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                
                return AnyView(ci)
                
            case (0, 1):
                let ci = _ContactItem(title: "Headline example is allowed to wrap two lines ok", actionItems: _ActivityItems(actionItems: [.init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                
                return AnyView(ci)
                
            case (0, 2):
                let ci = _ContactItem(title: "Sean Long has a name that wraps two lines", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                
                return AnyView(ci)
                
            case (0, 3):
                let ci = _ContactItem(title: "Headline example when it wraps two lines", subtitle: "Team Lead", actionItems: _ActivityItems(actionItems: [.init(type: .email), .init(type: .phone)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                
                return AnyView(ci)
                
            case (0, 4):
                let ci = _ContactItem(title: "Seann Longname", subtitle: "Team Lead", actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(0.3)
                
                return AnyView(ci)
                
            case (0, 5):
                let ci = _ContactItem(title: "Headline when\n wraps 2 lines", subtitle: "Team Lead", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(0.3)
                
                return AnyView(ci)
                
            default:
                return AnyView(_ContactItem(title: "Lorem ipseum dolor"))
            }
        }
    }
}
