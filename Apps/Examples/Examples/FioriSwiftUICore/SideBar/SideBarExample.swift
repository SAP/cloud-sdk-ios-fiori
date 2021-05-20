import FioriSwiftUICore
import SwiftUI

public struct SideBarExample: View {
    public var body: some View {
        NavigationView {
            SideBarView()
            DevDetailView(title: "Home Page - Starting From Here")
        }
        .navigationBarHidden(true)
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct BarItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    var icon: Image?
    var subtitle: String?
    var status: Image?
    let children: [BarItem]?
    var destination: AnyView?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.title)
    }
    
    static func == (lhs: BarItem, rhs: BarItem) -> Bool {
        lhs.id == rhs.id
    }
    
    init(title: String, icon: Image? = nil, subtitle: String? = nil, status: Image? = nil, children: [BarItem]? = nil, destination: AnyView? = nil) {
        self.title = title
        self.icon = icon
        self.subtitle = subtitle
        self.status = status
        self.children = children
        self.destination = destination
    }
}

public struct SideBarView: View {
    struct DevRowModel: Identifiable, SideBarListItemModel {
        var id = UUID()
        
        var accessoryIcon_: Image?
        
        var title_: String
        
        var subtitle_: String?
        
        var icon_: Image?
        
        init(icon: Image? = nil, title: String, subtitle: String? = nil, accessory: Image? = nil) {
            self.icon_ = icon
            self.title_ = title
            self.subtitle_ = subtitle
            self.accessoryIcon_ = accessory
        }
    }
    
    struct DevObjectItemModel: ObjectItemModel {
        var status_: String?
        
        var title_: String
        
        var subtitle_: String?
        
        var footnote_: String?
        
        var descriptionText_: String?
        
        var substatus_: String?
        
        var detailImage_: Image?
        
        var icons_: [IconStackItem]?
        
        var actionText_: String?
        
        func didSelectAction() {
            print("is selected")
        }
        
        init(title: String, subtitle: String? = nil, detailImage: Image? = nil) {
            self.title_ = title
            self.subtitle_ = subtitle
            self.detailImage_ = detailImage
        }
    }
    
    @State var selectedItem: BarItem?
    
    var items: [BarItem] = [
        BarItem(title: "Root Item 0.1", icon: Image(systemName: "heart.fill"), subtitle: "9,999+", status: Image(systemName: "square"), children: nil),
        BarItem(title: "Root Item 0.2", icon: Image(systemName: "heart.fill"), subtitle: "20", status: Image(systemName: "square"), children: nil),
        BarItem(title: "Root Item 0.3", icon: Image(systemName: "heart.fill"), status: Image(systemName: "airplane"), children: nil),
        BarItem(title: "Root Item 0.4", icon: Image(systemName: "cloud.snow"), children: nil),
        BarItem(title: "Group 1", children: [
            BarItem(title: "Child Item 1.1", icon: Image(systemName: "square.and.pencil"), subtitle: "66", status: Image(systemName: "circle"), children: nil),
            BarItem(title: "Child Item 1.2", icon: Image(systemName: "square.and.pencil"), status: Image(systemName: "circle"), children: nil),
            BarItem(title: "Child Item 1.3", icon: Image(systemName: "diamond"), children: nil),
            BarItem(title: "Child Item 1.4", subtitle: "256", children: nil)
        ]),
        BarItem(title: "Group 2", children: [
            BarItem(title: "Child Item 2.1", icon: Image(systemName: "folder"), subtitle: "5", status: Image(systemName: "mail"), children: nil),
            BarItem(title: "Child Item 2.2", icon: Image(systemName: "folder"), status: Image(systemName: "map"), children: nil),
            BarItem(title: "Child Item 2.3", icon: Image(systemName: "folder"), children: nil),
            BarItem(title: "Child Item 2.4", subtitle: "64", children: nil)
        ])
    ]
    
    public init() {}
    
    public var body: some View {
        VStack {
            SideBar(footerModel: DevObjectItemModel(title: "Title", subtitle: "Subtitle", detailImage: Image(systemName: "person")),
                    list: ExpandableList(data: items,
                                         children: \.children,
                                         selection: $selectedItem,
                                         rowModel: { item in
                                             DevRowModel(icon: item.icon, title: item.title, subtitle: item.subtitle, accessory: item.status)
                                         },
                                         destination: { item in
                                             DevDetailView(title: item.title)
                                         }))
        }.background(Color.preferredColor(.header))
    }
}

public struct DevDetailView: View {
    var title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        Text(title)
    }
}
