import SwiftUI

struct TabBarModel: Identifiable {
    var id = UUID()
    var name: String
    var badge: String? = nil
    var imageName: String
}

struct TabViewDetailView: View {
    @Binding var numberOfTabs: Int
    @Binding var isCustomColor: Bool
    @Binding var isCustomSelectionIndicatorImage: Bool
    @Binding var isCustomBackgroundImage: Bool
    @State private var selection = 0
    @State private var accendColor = Color.orange

    var tabs: [TabBarModel] = [TabBarModel(name: "bicycle", badge: "2", imageName: "bicycle"),
                               TabBarModel(name: "list", imageName: "list.dash"),
                               TabBarModel(name: "cart", badge: "NEW", imageName: "cart"),
                               TabBarModel(name: "person", imageName: "person.crop.circle"),
                               TabBarModel(name: "1", imageName: "1.square"),
                               TabBarModel(name: "2", imageName: "2.circle"),
                               TabBarModel(name: "3", imageName: "3.circle.fill")]
    
    var handler: Binding<Int> { Binding(
        get: { self.selection },
        set: {
            if selection != $0 {
                self.selection = $0
                accendColor = Color.random
            }
        }
    ) }
    
    var body: some View {
        TabView(selection: handler) {
            ForEach(0 ..< numberOfTabs, id: \.self) { index in
                let t = tabs[index]
                Group {
                    if index.isMultiple(of: 2) {
                        Color.random
                    } else {
                        List(0 ..< 20) { index in
                            Text("index: \(index)")
                        }
                    }
                }
                .badge(t.badge)
                .tag(index)
                .tabItem {
                    Label(
                        title: { Text(t.name) },
                        icon: { Image(systemName: t.imageName) }
                    )
                }
            }
        }
        .navigationTitle("Customized TabView")
        .accentColor(accendColor)
        .onAppear {
            if isCustomColor {
                UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.preferredFioriFont(forTextStyle: .title3),
                                                                  .foregroundColor: UIColor.black], for: .normal)
                UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.preferredFioriFont(forTextStyle: .title3),
                                                                  .foregroundColor: UIColor.purple], for: .selected)
                UITabBarItem.appearance().setBadgeTextAttributes([.font: UIFont.preferredFioriFont(forTextStyle: .callout),
                                                                  .foregroundColor: UIColor.white], for: .normal)
                UITabBarItem.appearance().setBadgeTextAttributes([.font: UIFont.preferredFioriFont(forTextStyle: .callout),
                                                                  .foregroundColor: UIColor.red], for: .selected)
                
                UITabBar.appearance().unselectedItemTintColor = UIColor.red
                UITabBar.appearance().backgroundColor = UIColor.green
                UITabBarItem.appearance().badgeColor = UIColor.black
            } else {
                UITabBar.appearance().unselectedItemTintColor = nil
                UITabBar.appearance().backgroundColor = nil
                UITabBarItem.appearance().badgeColor = UIColor.systemRed
                
                UITabBarItem.appearance().setTitleTextAttributes([:], for: .normal)
                UITabBarItem.appearance().setTitleTextAttributes([:], for: .selected)
                UITabBarItem.appearance().setBadgeTextAttributes([:], for: .normal)
                UITabBarItem.appearance().setBadgeTextAttributes([:], for: .selected)
            }
            
            if isCustomSelectionIndicatorImage {
                UITabBar.appearance().selectionIndicatorImage = UIImage(systemName: "car")
            } else {
                UITabBar.appearance().selectionIndicatorImage = nil
            }
            
            if isCustomBackgroundImage {
                UITabBar.appearance().backgroundImage = UIImage(systemName: "square")?.withTintColor(UIColor.clear)
            } else {
                UITabBar.appearance().backgroundImage = nil
            }
        }
    }
}

#Preview {
    TabViewDetailView(numberOfTabs: .constant(6),
                      isCustomColor: .constant(false),
                      isCustomSelectionIndicatorImage: .constant(false),
                      isCustomBackgroundImage: .constant(true))
}
