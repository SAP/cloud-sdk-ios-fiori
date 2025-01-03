import FioriSwiftUICore
import SwiftUI

struct ContactItemRegularExamples: ObjectItemListDataProtocol {
    var isNewObjectItem: Bool = false
    
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
        if self.isNewObjectItem {
            switch (indexPath.section, indexPath.row) {
            case (0, 0):
                let item = ContactItem(title: "Headline only example", description: "One line of text description is baseline aligned.", activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(0.355)
                
                return item.typeErased
                
            case (0, 1):
                let item = ContactItem(title: "Sean Long", description: "Single line of text is baseline aligned and expands.", detailImage: Image("person_square4"), activityItems: [.init(type: .email, didSelectActivityItem: {
                    print("tap email")
                }), .init(type: .detail, didSelectActivityItem: {
                    print("tap detail")
                }), .init(type: .custom(Image(systemName: "power")), didSelectActivityItem: {
                    print("tap power")
                })])
                .splitPercent(0.3)
                
                return item.typeErased
                
            case (0, 2):
                let item = ContactItem(title: "Headline only example", subtitle: "Team Lead", description: "One line of text in description is centered here.", activityItems: [.init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(0.355)
                
                return item.typeErased
            case (0, 3):
                let item = ContactItem(title: "Sean Long", subtitle: "Team Lead", description: "Description is always centered as this example here", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(0.3)
                
                return item.typeErased
                
            case (0, 4):
                let item = ContactItem {
                    Text("Sean Long")
                } subtitle: {
                    Text("Team Lead")
                } description: {
                    Text("Description is always centered and this example shows the text that is set to truncate after two lines. Description is always centered and this example shows the text that is set to truncate after two lines").lineLimit(2)
                } detailImage: {
                    Image("person_square4").resizable()
                } activityItems: {
                    ActivityControlLayoutContainer([.init(type: .phone, data: "(925)123-4567"),
                                                    .init(type: .email, data: "Laurel@contoso.com"),
                                                    .init(type: .message)])
                    { activity in
                        ActivityButtonView(activity) {
                            print("\(activity.data ?? "nil")")
                        }
                    }
                }
                .splitPercent(0.3)
                
                return item.typeErased
                
            case (0, 5):
                let item = ContactItem(title: "Sean Long", subtitle: "Team Lead", description: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should. Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
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
                        .lineLimit(nil)
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
                        .lineLimit(nil)
                        .font(.fiori(forTextStyle: .headline).weight(.bold))
                })
                .descriptionStyle { conf in
                    conf.description
                        .foregroundStyle(Color.blue)
                        .font(.fiori(forTextStyle: .headline).weight(.bold))
                        .lineLimit(nil)
                }
                .detailImageStyle { conf in
                    conf.detailImage
                        .border(Color.yellow, width: 1)
                }
                
                return item.typeErased
                
            case (0, 6):
                let item = ContactItem(title: "Headline example is allowed to wrap two lines ok", description: "One line of text in description is centered here.", activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(0.4)
                
                return item.typeErased
                
            case (0, 7):
                let item = ContactItem(title: "Sean Long name that wraps two lines", description: "Text is centered like this example and expands here.", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(0.34)
                
                return item.typeErased
                
            case (0, 8):
                let item = ContactItem(title: "Headline example when text wraps two lines", subtitle: "Team Lead", description: "One line of text in description is centered here.", activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(0.36)
                
                return item.typeErased
                
            case (0, 9):
                let item = ContactItem(title: "Headline example wraps two lines", subtitle: "Team Lead", description: "Description is always centered and this example shows the text that is set to truncate at two lines", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(0.3)
                
                return item.typeErased
                
            case (0, 10):
                let item = ContactItem(title: "Headline example wraps two lines", subtitle: "Team Lead", description: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should.", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(0.3)
                
                return item.typeErased
                
            case (0, 11):
                let item = ContactItem(title: "Sean Long", subtitle: "Team Lead", description: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should.", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                }), .init(type: .email, didSelectActivityItem: {
                    print("tap email")
                }), .init(type: .detail, didSelectActivityItem: {
                    print("tap detail")
                }), .init(type: .custom(Image(systemName: "power")), didSelectActivityItem: {
                    print("tap power")
                })])
                
                return item.typeErased
                
            case (1, 0):
                let item = ContactItem(title: "Headline only example", description: "One line of text description is baseline aligned.", activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(nil)
                
                return item.typeErased
                
            case (1, 1):
                let item = ContactItem(title: "Sean Long", description: "Single line of text is baseline aligned and expands.", detailImage: Image("person_square4"), activityItems: [.init(type: .email, didSelectActivityItem: {
                    print("tap email")
                }), .init(type: .detail, didSelectActivityItem: {
                    print("tap detail")
                }), .init(type: .custom(Image(systemName: "power")), didSelectActivityItem: {
                    print("tap power")
                })])
                .splitPercent(nil)
                
                return item.typeErased
            
            case (1, 2):
                let item = ContactItem(title: "Headline only example", subtitle: "Team Lead", description: "One line of text in description is centered here.", activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(nil)
                
                return item.typeErased
                
            case (1, 3):
                let item = ContactItem(title: "Sean Long", subtitle: "Team Lead", description: "Description is always centered as this example here", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(nil)
                
                return item.typeErased
                
            case (1, 4):
                let item = ContactItem(title: "Sean Long", subtitle: "Team Lead", description: "Description is always centered and this example shows the text that is set to truncate after two lines", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(nil)

                return item.typeErased
                
            case (1, 5):
                let item = ContactItem(title: "Sean Long", subtitle: "Team Lead", description: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should. Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(nil)
                
                return item.typeErased
                
            case (1, 6):
                let item = ContactItem(title: "Headline example is allowed to wrap two lines ok", description: "One line of text in description is centered here.", activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                
                return item.typeErased
                
            case (1, 7):
                let item = ContactItem(title: "Sean Long name that wraps two lines", description: "Text is centered like this example and expands here.", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(nil)
                
                return item.typeErased
                
            case (1, 8):
                let item = ContactItem(title: "Headline example when text wraps two lines", subtitle: "Team Lead", description: "One line of text in description is centered here.", activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(nil)
                
                return item.typeErased
                
            case (1, 9):
                let item = ContactItem {
                    Text("Sean Long")
                } subtitle: {
                    Text("Team Lead")
                } description: {
                    Text("Description is always centered and this example shows the text that is set to truncate after two lines. Description is always centered and this example shows the text that is set to truncate after two lines").lineLimit(2)
                } detailImage: {
                    Image("person_square4").resizable()
                } activityItems: {
                    ActivityControlLayoutContainer([.init(type: .phone, data: "(925)123-4567"),
                                                    .init(type: .email, data: "Laurel@contoso.com"),
                                                    .init(type: .message)])
                    { activity in
                        ActivityButtonView(activity) {
                            print("\(activity.data ?? "nil")")
                        }
                    }
                }
                .splitPercent(nil)
                
                return item.typeErased
                
            case (1, 10):
                let item = ContactItem(title: "Headline example wraps two lines", subtitle: "Team Lead", description: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should.", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                })])
                .splitPercent(nil)
                
                return item.typeErased
                
            case (1, 11):
                let item = ContactItem(title: "Sean Long", subtitle: "Team Lead", description: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should.", detailImage: Image("person_square4").resizable(), activityItems: [.init(type: .phone, didSelectActivityItem: {
                    print("tap phone")
                }), .init(type: .videoCall, didSelectActivityItem: {
                    print("tap videoCall")
                }), .init(type: .message, didSelectActivityItem: {
                    print("tap message")
                }), .init(type: .email, didSelectActivityItem: {
                    print("tap email")
                }), .init(type: .detail, didSelectActivityItem: {
                    print("tap detail")
                }), .init(type: .custom(Image(systemName: "power")), didSelectActivityItem: {
                    print("tap power")
                })])
                .splitPercent(nil)
                
                return item.typeErased
            default:
                //
                return ContactItem(title: "Lorem ipseum dolor").typeErased
            }
        } else {
            switch (indexPath.section, indexPath.row) {
            case (0, 0):
                let ci = _ContactItem(title: "Headline only example", descriptionText: "One line of text description is baseline aligned.", actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(0.355)
                
                return AnyView(ci)
                
            case (0, 1):
                let ci = _ContactItem(title: "Sean Long", descriptionText: "Single line of text is baseline aligned and expands.", detailImage: Image("person_square4"), actionItems: _ActivityItems(actionItems: [.init(type: .email), .init(type: .detail), .init(type: .custom(Image(systemName: "power")))], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(0.3)
                
                return AnyView(ci)
                
            case (0, 2):
                let ci = _ContactItem(title: "Headline only example", subtitle: "Team Lead", descriptionText: "One line of text in description is centered here.", actionItems: _ActivityItems(actionItems: [.init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(0.355)
                
                return AnyView(ci)
                
            case (0, 3):
                let ci = _ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Description is always centered as this example here", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(0.3)
                
                return AnyView(ci)
                
            case (0, 4):
                let ci = _ContactItem {
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
                let ci = _ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should. Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(0.3)
                
                return AnyView(ci)
                
            case (0, 6):
                let ci = _ContactItem(title: "Headline example is allowed to wrap two lines ok", descriptionText: "One line of text in description is centered here.", actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(0.4)
                
                return AnyView(ci)
                
            case (0, 7):
                let ci = _ContactItem(title: "Sean Long name that wraps two lines", descriptionText: "Text is centered like this example and expands here.", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(0.34)
                
                return AnyView(ci)
                
            case (0, 8):
                let ci = _ContactItem(title: "Headline example when text wraps two lines", subtitle: "Team Lead", descriptionText: "One line of text in description is centered here.", actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(0.36)
                
                return AnyView(ci)
                
            case (0, 9):
                let ci = _ContactItem(title: "Headline example wraps two lines", subtitle: "Team Lead", descriptionText: "Description is always centered and this example shows the text that is set to truncate at two lines", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(0.3)
                
                return AnyView(ci)
                
            case (0, 10):
                let ci = _ContactItem(title: "Headline example wraps two lines", subtitle: "Team Lead", descriptionText: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should.", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(0.3)
                
                return AnyView(ci)
                
            case (0, 11):
                let ci = _ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should.", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message), .init(type: .email), .init(type: .detail), .init(type: .custom(Image(systemName: "power")))], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                
                return AnyView(ci)
                
            case (1, 0):
                let ci = _ContactItem(title: "Headline only example", descriptionText: "One line of text description is baseline aligned.", actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(nil)
                
                return AnyView(ci)
                
            case (1, 1):
                let ci = _ContactItem(title: "Sean Long", descriptionText: "Single line of text is baseline aligned and expands.", detailImage: Image("person_square4"), actionItems: _ActivityItems(actionItems: [.init(type: .email), .init(type: .detail), .init(type: .custom(Image(systemName: "power")))], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(nil)
                
                return AnyView(ci)
                
            case (1, 2):
                let ci = _ContactItem(title: "Headline only example", subtitle: "Team Lead", descriptionText: "One line of text in description is centered here.", actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(nil)
                
                return AnyView(ci)
                
            case (1, 3):
                let ci = _ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Description is always centered as this example here", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(nil)
                
                return AnyView(ci)
                
            case (1, 4):
                let ci = _ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Description is always centered and this example shows the text that is set to truncate after two lines", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(nil)
                
                return AnyView(ci)
                
            case (1, 5):
                let ci = _ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should. Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(nil)
                
                return AnyView(ci)
                
            case (1, 6):
                let ci = _ContactItem(title: "Headline example is allowed to wrap two lines ok", descriptionText: "One line of text in description is centered here.", actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(nil)
                
                return AnyView(ci)
                
            case (1, 7):
                let ci = _ContactItem(title: "Sean Long name that wraps two lines", descriptionText: "Text is centered like this example and expands here.", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(nil)
                
                return AnyView(ci)
                
            case (1, 8):
                let ci = _ContactItem(title: "Headline example when text wraps two lines", subtitle: "Team Lead", descriptionText: "One line of text in description is centered here.", actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(nil)
                
                return AnyView(ci)
                
            case (1, 9):
                let ci = _ContactItem {
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
                let ci = _ContactItem(title: "Headline example wraps two lines", subtitle: "Team Lead", descriptionText: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should.", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message)], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(nil)
                
                return AnyView(ci)
                
            case (1, 11):
                let ci = _ContactItem(title: "Sean Long", subtitle: "Team Lead", descriptionText: "Example showing three lines of text at maximum lipsum ortam at al and the description is always still centered here and should.", detailImage: Image("person_square4").resizable(), actionItems: _ActivityItems(actionItems: [.init(type: .phone), .init(type: .videoCall), .init(type: .message), .init(type: .email), .init(type: .detail), .init(type: .custom(Image(systemName: "power")))], didSelectActivityItem: { dataType in
                    print("\(dataType)")
                }))
                .splitPercent(nil)
                
                return AnyView(ci)
                
            default:
                return AnyView(_ContactItem(title: "Lorem ipseum dolor"))
            }
        }
    }
}
