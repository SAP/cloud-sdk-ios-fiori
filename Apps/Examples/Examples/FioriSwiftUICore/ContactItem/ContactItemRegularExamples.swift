import FioriSwiftUICore
import SwiftUI

struct ContactItemRegularExamples: ListDataProtocol {
    init(cellTapped: Binding<Bool>) {}
    init() {}
    
    func numberOfSections() -> Int {
        2
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        12
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        switch section {
        case 0:
            return "splitPercent"
        case 1:
            return "splitPercent(nil)"
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
            let ci = ContactItem(title: "Headline only example", descriptionText: "One line of text description is baseline aligned.", actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(0.355)
            
            return AnyView(ci)
            
        case (0, 1):
            let ci = ContactItem(title: "Sean Long", descriptionText: "Single line of text is baseline aligned and expands.", detailImage: Image("person_square4"), actionItems: ActivityItems(actionItems: [.init(type: .email), .init(type: .detail), .init(type: .custom(Image(systemName: "power")))], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(0.3)
            
            return AnyView(ci)
        
        case (0, 2):
            let ci = ContactItem(title: "Headline only example", subtitle: "Team Lead", descriptionText: "One line of text in description is centered here.", actionItems: ActivityItems(actionItems: [.init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(0.355)
            
            return AnyView(ci)
            
        case (0, 3):
            let ci = ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Description is always centered as this example here", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(0.3)
            
            return AnyView(ci)
            
        case (0, 4):
            let ci = ContactItem {
                Text("Sean Long")
            } subtitle: {
                Text("Team Lead")
            } descriptionText: {
                Text("Description is always centered and this example shows the text that is set to truncate after two lines. Description is always centered and this example shows the text that is set to truncate after two lines").lineLimit(2)
            } detailImage: {
                Image("person_square4").resizable()
            } actionItems: {
                ActivityControlLayoutContainer([.init(type: .phone, data: "(925)123-4567"),
                                                .init(type: .email, data: "Laurel@contoso.com"),
                                                .init(type: .message)])
                { activity in
                    ActivityButtonView(activity) {
                        print("\(activity.data ?? "nil")")
                    }
                }
            }.splitPercent(0.3)
            
            return AnyView(ci)
            
        case (0, 5):
            let ci = ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should. Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(0.3)
            
            return AnyView(ci)
            
        case (0, 6):
            let ci = ContactItem(title: "Headline example is allowd to wrap two lines ok", descriptionText: "One line of text in description is centered here.", actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(0.4)
            
            return AnyView(ci)
            
        case (0, 7):
            let ci = ContactItem(title: "Sean Long name that wraps two lines", descriptionText: "Text is centered like this example and expands here.", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(0.34)
            
            return AnyView(ci)
            
        case (0, 8):
            let ci = ContactItem(title: "Headline example when text wraps two lines", subtitle: "Team Lead", descriptionText: "One line of text in description is centered here.", actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(0.36)
            
            return AnyView(ci)
            
        case (0, 9):
            let ci = ContactItem(title: "Headline example wraps two lines", subtitle: "Team Lead", descriptionText: "Description is always centered and this example shows the text that is set to truncate at two lines", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(0.3)
            
            return AnyView(ci)
            
        case (0, 10):
            let ci = ContactItem(title: "Headline example wraps two lines", subtitle: "Team Lead", descriptionText: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should.", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(0.3)
            
            return AnyView(ci)
            
        case (0, 11):
            let ci = ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should.", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message), .init(type: .email), .init(type: .detail), .init(type: .custom(Image(systemName: "power")))], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            
            return AnyView(ci)
            
        case (1, 0):
            let ci = ContactItem(title: "Headline only example", descriptionText: "One line of text description is baseline aligned.", actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(nil)
            
            return AnyView(ci)
            
        case (1, 1):
            let ci = ContactItem(title: "Sean Long", descriptionText: "Single line of text is baseline aligned and expands.", detailImage: Image("person_square4"), actionItems: ActivityItems(actionItems: [.init(type: .email), .init(type: .detail), .init(type: .custom(Image(systemName: "power")))], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(nil)
            
            return AnyView(ci)
        
        case (1, 2):
            let ci = ContactItem(title: "Headline only example", subtitle: "Team Lead", descriptionText: "One line of text in description is centered here.", actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(nil)
            
            return AnyView(ci)
            
        case (1, 3):
            let ci = ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Description is always centered as this example here", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(nil)
            
            return AnyView(ci)
            
        case (1, 4):
            let ci = ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Description is always centered and this example shows the text that is set to truncate after two lines", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(nil)

            return AnyView(ci)
            
        case (1, 5):
            let ci = ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should. Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(nil)
            
            return AnyView(ci)
            
        case (1, 6):
            let ci = ContactItem(title: "Headline example is allowd to wrap two lines ok", descriptionText: "One line of text in description is centered here.", actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(nil)
            
            return AnyView(ci)
            
        case (1, 7):
            let ci = ContactItem(title: "Sean Long name that wraps two lines", descriptionText: "Text is centered like this example and expands here.", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(nil)
            
            return AnyView(ci)
            
        case (1, 8):
            let ci = ContactItem(title: "Headline example when text wraps two lines", subtitle: "Team Lead", descriptionText: "One line of text in description is centered here.", actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(nil)
            
            return AnyView(ci)
            
        case (1, 9):
            let ci = ContactItem {
                Text("Sean Long")
            } subtitle: {
                Text("Team Lead")
            } descriptionText: {
                Text("Description is always centered and this example shows the text that is set to truncate after two lines. Description is always centered and this example shows the text that is set to truncate after two lines").lineLimit(2)
            } detailImage: {
                Image("person_square4").resizable()
            } actionItems: {
                ActivityControlLayoutContainer([.init(type: .phone, data: "(925)123-4567"),
                                                .init(type: .email, data: "Laurel@contoso.com"),
                                                .init(type: .message)])
                { activity in
                    ActivityButtonView(activity) {
                        print("\(activity.data ?? "nil")")
                    }
                }
            }.splitPercent(nil)
            
            return AnyView(ci)
            
        case (1, 10):
            let ci = ContactItem(title: "Headline example wraps two lines", subtitle: "Team Lead", descriptionText: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should.", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(nil)
            
            return AnyView(ci)
            
        case (1, 11):
            let ci = ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should.", detailImage: Image("person_square4").resizable(), actionItems: ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message), .init(type: .email), .init(type: .detail), .init(type: .custom(Image(systemName: "power")))], didSelectActivityItem: { dataType in
                print("\(dataType)")
            }))
            .splitPercent(nil)
            
            return AnyView(ci)
            
        default:
            return AnyView(ContactItem(title: "Lorem ipseum dolor"))
        }
    }
}
