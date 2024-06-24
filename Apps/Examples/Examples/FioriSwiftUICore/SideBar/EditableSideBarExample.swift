import CoreLocation
import FioriSwiftUICore
import FioriThemeManager
import MapKit
import SwiftUI

public struct SideBarExample: View {
    public var body: some View {
        List {
            NavigationLink {
                OutdatedSideBarExample()
            } label: {
                Text("Outdated Sidebar")
            }
            NavigationLink {
                List {
                    NavigationLink {
                        EditableSideBarExample(allowEdit: false)
                    } label: {
                        Text("Readonly Sidebar")
                    }
                    NavigationLink {
                        EditableSideBarExample()
                    } label: {
                        Text("Editable Sidebar")
                    }
                    NavigationLink {
                        EditableSideBarExample(isCustom: true)
                    } label: {
                        Text("Customized Sidebar")
                    }
                    NavigationLink {
                        EditableSideBarExample(isPartialCustom: true)
                    } label: {
                        Text("Customized Sidebar-2")
                    }
                }
                .navigationBarHidden(false)
            } label: {
                Text("Sidebar")
            }
        }
    }
}

struct EditableSideBarExample: View {
    var allowEdit: Bool = true
    var isCustom: Bool = false
    var isPartialCustom: Bool = false
    let isPad: Bool = UIDevice.current.userInterfaceIdiom == .pad

    var deviceModelObject = DeviceExampleModelObject()
    let destinationView = DeviceDetail()
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isEditing = false
    @State private var listItems: [SideBarItemModel] = loadItemModelData()
    @State private var queryString: String?
    @State private var selection: SideBarItemModel?
    
    public var body: some View {
        let footer = UIDevice.current.userInterfaceIdiom == .pad ? ObjectItem(title: "Title", subtitle: "SubTitle", detailImage: Image(systemName: "person"))
            .objectItemStyle(content: { configuration in
                ObjectItem(configuration)
                    .background(Color.preferredColor(.quaternaryFill))
            }) : nil
        
        let view = NavigationSplitView {
            SideBar(
                isEditing: self.$isEditing,
                queryString: self.$queryString,
                data: self.$listItems,
                selection: self.$selection,
                title: "Devices",
                footer: { self.isPad && !self.isCustom ? footer : nil },
                editButton: { self.allowEdit ? Button(action: {
                    if !self.isEditing {
                        // Check the listItems
                        for (_, item) in self.listItems.enumerated() {
                            if !item.isSection {
                                print("BarItem: '" + item.title + "' was hidden? --- " + String(item.isInvisible))
                            } else {
                                print("Bar Section: '" + item.title + "' has following children:")
                                if let children = item.children {
                                    for (index, child) in children.enumerated() {
                                        print(String(index + 1) + " : '" + child.title + "' was hidden? --- " + String(child.isInvisible))
                                    }
                                }
                            }
                        }
                    }
                }, label: { Text(self.isEditing ? "Done" : "Edit") }) : nil },
//                editButton: { EditButton() }, // Also can use system EditButton here if you don't want to check the updated data or customize the button's label
                destination: { model in
                    if let device = getDevice(item: model) {
                        DispatchQueue.main.async {
                            self.deviceModelObject.device = device
                        }
                    }
                    return self.destinationView.environmentObject(self.deviceModelObject)
                },
                item: { item in
                    self.makeItem(item)
                }
            )
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: { Text("Back") }))
        } detail: {
            DevDetailView(title: "Home Page - Starting From Here")
        }
        .navigationBarHidden(true)
        
        if !self.isCustom {
            view.searchable(text: Binding<String>(get: { self.queryString ?? "" }, set: { newValue in self.queryString = newValue }), prompt: "Search")
                .onAppear {
                    let searchImage = UIImage(systemName: "magnifyingglass")?
                        .withTintColor(UIColor(Color.preferredColor(.tertiaryLabel)), renderingMode: .alwaysOriginal)
                        .applyingSymbolConfiguration(UIImage.SymbolConfiguration(weight: .semibold))
                    UISearchBar.appearance().setImage(searchImage, for: .search, state: .normal)
                }
                .onDisappear {
                    UISearchBar.appearance().setImage(nil, for: .search, state: .normal)
                }
        } else {
            view
        }
    }
    
    func makeItem(_ item: Binding<SideBarItemModel>) -> any View {
        let filledIcon = item.wrappedValue.filledIcon != nil ? item.wrappedValue.filledIcon : item.wrappedValue.icon
        let barItem = SideBarListItem(icon: item.wrappedValue.icon, filledIcon: filledIcon, title: AttributedString(item.wrappedValue.title), subtitle: AttributedString(item.wrappedValue.subtitle ?? ""), accessoryIcon: item.wrappedValue.accessoryIcon, isOn: Binding<Bool>(get: { !item.wrappedValue.isInvisible }, set: { item.wrappedValue.isInvisible = !$0 }), data: item.wrappedValue, isSelected: Binding(get: { self.selection == item.wrappedValue }, set: { if $0 { self.selection = item.wrappedValue } }))
            
        if self.isCustom {
            return barItem.sideBarListItemStyle { configuration in
                if self.selection == configuration.data, !self.isEditing {
                    SideBarListItem(configuration)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.preferredColor(.chart3)))
                } else {
                    SideBarListItem(configuration)
                }
            }
            .titleStyle { configuration in
                if self.selection == item.wrappedValue {
                    configuration.title.foregroundColor(.cyan)
                        .font(.fiori(forTextStyle: .title3, weight: .regular))
                } else {
                    configuration.title.foregroundColor(self.isEditing ? .green : .red)
                        .font(.fiori(forTextStyle: .title3, weight: .regular))
                }
            }
            .iconStyle { configuration in
                configuration.icon.foregroundColor(!self.isEditing ? .red : .pink)
            }
            .filledIconStyle { configuration in
                configuration.filledIcon.foregroundColor(.brown)
            }
            .subtitleStyle { configuration in
                configuration.subtitle.foregroundColor(.indigo)
                    .font(.fiori(forTextStyle: .footnote, weight: .regular))
            }
            .accessoryIconStyle { configuration in
                configuration.accessoryIcon.foregroundColor(.accentColor)
            }
        } else if self.isPartialCustom {
            return barItem.titleStyle { configuration in
                if self.selection == item.wrappedValue {
                    configuration.title.foregroundColor(.red)
                        .font(.fiori(forTextStyle: .title3, weight: .regular))
                } else {
                    configuration.title
                }
            }
            .subtitleStyle { configuration in
                if self.selection == item.wrappedValue {
                    configuration.subtitle.foregroundColor(.green)
                        .font(.fiori(forTextStyle: .title3, weight: .regular))
                } else {
                    configuration.subtitle.foregroundColor(.brown)
                }
            }
            .accessoryIconStyle { configuration in
                if self.selection == item.wrappedValue {
                    configuration.accessoryIcon.foregroundColor(.red)
                } else {
                    configuration.accessoryIcon.foregroundColor(.yellow)
                }
            }
        } else {
            return barItem
        }
    }
}

func loadItemModelData() -> [SideBarItemModel] {
    var barItems: [SideBarItemModel] = []
    var groupdedItems: [DeviceCategory: [SideBarItemModel]] = Dictionary()
    for item in devices {
        var sideBarItem = SideBarItemModel(title: item.name, icon: Image(systemName: "square.dashed"), filledIcon: Image(systemName: "square.dashed.inset.filled"), subtitle: item.description, accessoryIcon: Image(systemName: "chevron.right"))
        sideBarItem.id = item.id
        
        if let category = item.category {
            if groupdedItems.index(forKey: category) != nil {
                groupdedItems[category]?.append(sideBarItem)
            } else {
                groupdedItems[category] = [sideBarItem]
            }
        } else {
            barItems.append(sideBarItem)
        }
    }
    
    for category in groupdedItems.keys {
        var section = SideBarItemModel(title: category.rawValue)
        section.children = groupdedItems[category]
        barItems.append(section)
    }
    
    return barItems
}

func getDevice(item: SideBarItemModel) -> Device? {
    for device in devices {
        if item.id == device.id {
            return device
        }
    }
    return nil
}

let devices: [Device] = [
    Device("Apple Watch", "Mental health"),
    Device("AirPods Max", "connection"),
    Device("iPad Pro", "Ultra Retina XDR"),
    Device("iPhone 14", "closer look", .iPhone14),
    Device("iPhone 14 Plus", "Dynamic Island", .iPhone14),
    Device("iPhone 14 Pro", nil, .iPhone14),
    Device("iPhone 14 Pro Max", "48MP", .iPhone14),
    Device("iPhone 15", nil, .iPhone15),
    Device("iPhone 15 Plus", "$799", .iPhone15),
    Device("iPhone 15 Pro", nil, .iPhone15),
    Device("iPhone 15 Pro Max", "Dynamic Island", .iPhone15)
]

class DeviceExampleModelObject: ObservableObject {
    @Published var device: Device?
}

struct DeviceDetail: View {
    @EnvironmentObject private var modelObject: DeviceExampleModelObject
    
    var body: some View {
        if let device = modelObject.device {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text(device.name)
                            .font(.title).fontWeight(.bold)
                    }

                    if let dec = device.description {
                        HStack {
                            Text(dec)
                        }
                        .font(.title3).fontWeight(.bold)
                        .foregroundStyle(.secondary)
                    }

                    Divider()

                    Text("\(device.about) ")
                        .font(.title2)
                }
                .padding()
            }
            .navigationTitle(device.name)
            .navigationBarTitleDisplayMode(.inline)
        } else {
            Group {}
        }
    }
}

struct Device: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var description: String?
    var category: DeviceCategory?
    var about: String
    
    init(_ name: String, _ description: String? = nil, _ category: DeviceCategory? = nil) {
        self.name = name
        self.description = description
        self.category = category
        self.about = "Check out our official YouTube channel to help you get the most from your Apple devices and services."
    }
}

enum DeviceCategory: String, CaseIterable {
    case iPhone12, iPhone13, iPhone14, iPhone15
}
