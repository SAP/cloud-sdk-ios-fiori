import FioriSwiftUICore
import SwiftUI

public struct SideBarExample: View {
    public var body: some View {
        NavigationView {
            SideBarView()
            DetailView(title: "Home Page - Starting From Here")
        }
        .navigationBarHidden(true)
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct BarItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    var icon: Image?
    var detail: String?
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
    
    init(title: String, icon: Image? = nil, detail: String? = nil, status: Image? = nil, children: [BarItem]? = nil, destination: AnyView? = nil) {
        self.title = title
        self.icon = icon
        self.detail = detail
        self.status = status
        self.children = children
        self.destination = destination
    }
}

public struct SideBarView: View {
    struct DevHeaderModel: Identifiable, SideBarListSectionHeaderModel {
        var id = UUID()
        
        var title_: String
        
        init(title: String) {
            self.title_ = title
        }
    }
    
    struct DevRowModel: Identifiable, SideBarListItemModel {
        var id = UUID()
        
        var accessoryIcon_: Image?
        
        var title_: String
        
        var detail_: String?
        
        var icon_: Image?
        
        init(icon: Image? = nil, title: String, detail: String? = nil, accessory: Image? = nil) {
            self.icon_ = icon
            self.title_ = title
            self.detail_ = detail
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
        BarItem(title: "Root Item 0.1", icon: Image(systemName: "heart.fill"), detail: "9,999+", status: Image(systemName: "square"), children: nil),
        BarItem(title: "Root Item 0.2", icon: Image(systemName: "heart.fill"), detail: "20", status: Image(systemName: "square"), children: nil),
        BarItem(title: "Root Item 0.3", icon: Image(systemName: "heart.fill"), status: Image(systemName: "airplane"), children: nil),
        BarItem(title: "Root Item 0.4", icon: Image(systemName: "cloud.snow"), children: nil),
        BarItem(title: "Group 1", children: [
            BarItem(title: "Child Item 1.1", icon: Image(systemName: "square.and.pencil"), detail: "66", status: Image(systemName: "circle"), children: nil),
            BarItem(title: "Child Item 1.2", icon: Image(systemName: "square.and.pencil"), status: Image(systemName: "circle"), children: nil),
            BarItem(title: "Child Item 1.3", icon: Image(systemName: "diamond"), children: nil)
        ]),
        BarItem(title: "Group 2", children: [
            BarItem(title: "Child Item 2.1", icon: Image(systemName: "folder"), detail: "5", status: Image(systemName: "mail"), children: nil),
            BarItem(title: "Child Item 2.2", icon: Image(systemName: "folder"), status: Image(systemName: "map"), children: nil),
            BarItem(title: "Child Item 2.3", icon: Image(systemName: "folder"), children: nil)
        ])
    ]
    
    public init() {}
    
    public var body: some View {
        VStack {
            SideBar(footerModel: DevObjectItemModel(title: "Title", subtitle: "Subtitle", detailImage: Image(systemName: "person")),
                    listConfig: ExpandableList(data: items,
                                               children: \.children,
                                               selection: $selectedItem,
                                               headerModel: { item in
                                                   DevHeaderModel(title: item.title)
                                               },
                                               rowModel: { item in
                                                   DevRowModel(icon: item.icon, title: item.title, detail: item.detail, accessory: item.status)
                                               },
                                               destination: { item in
                                                   DetailView(title: item.title)
                                               }))
        }.background(Color.preferredColor(.header))
    }
}

public struct DetailView: View {
    var title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        Text(title)
    }
}
