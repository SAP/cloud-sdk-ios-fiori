import AVFAudio
import FioriThemeManager
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
    @State private var accendColor = Color.random
    @State private var selectionAudioPlayer: AVAudioPlayer!
    
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
            
            selectionAudioPlayer?.play()
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
            if let path = Bundle.main.path(forResource: "08 Tap", ofType: "wav") {
                let url = URL(fileURLWithPath: path)
                do {
                    selectionAudioPlayer = try AVAudioPlayer(contentsOf: url)
                    selectionAudioPlayer.prepareToPlay()
                } catch let error as NSError {
                    print("Error creating AVAudioPlayer \(error)")
                }
            }

            if isCustomColor {
                customTabColor()
            } else {
                resetTabColor()
            }
            if isCustomSelectionIndicatorImage {
                UITabBar.appearance().selectionIndicatorImage = UIImage(systemName: "car")
            } else {
                UITabBar.appearance().selectionIndicatorImage = nil
            }
            
            if isCustomBackgroundImage {
                UITabBar.appearance().backgroundImage = UIImage(named: "SAPLogo")?.stretchableImage(withLeftCapWidth: 0, topCapHeight: 0)
            } else {
                UITabBar.appearance().backgroundImage = nil
            }
        }
        .onDisappear {
            resetTabColor()
            UITabBar.appearance().selectionIndicatorImage = nil
            UITabBar.appearance().backgroundImage = nil
        }
    }
    
    func customTabColor() {
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.preferredFioriFont(forTextStyle: .title3),
                                                          .foregroundColor: UIColor(Color.preferredColor(.primaryLabel))], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.preferredFioriFont(forTextStyle: .title3),
                                                          .foregroundColor: UIColor(Color.random)], for: .selected)
        UITabBarItem.appearance().setBadgeTextAttributes([.font: UIFont.preferredFioriFont(forTextStyle: .callout),
                                                          .foregroundColor: UIColor(Color.random)], for: .normal)
        UITabBarItem.appearance().setBadgeTextAttributes([.font: UIFont.preferredFioriFont(forTextStyle: .callout),
                                                          .foregroundColor: UIColor(Color.random)], for: .selected)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.preferredColor(.red11))
        UITabBar.appearance().backgroundColor = UIColor(Color.preferredColor(.green11))
        UITabBarItem.appearance().badgeColor = UIColor(Color.preferredColor(.base1))
    }
    
    func resetTabColor() {
        UITabBar.appearance().unselectedItemTintColor = nil
        UITabBar.appearance().backgroundColor = nil
        UITabBarItem.appearance().badgeColor = UIColor.systemRed
        
        UITabBarItem.appearance().setTitleTextAttributes([:], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([:], for: .selected)
        UITabBarItem.appearance().setBadgeTextAttributes([:], for: .normal)
        UITabBarItem.appearance().setBadgeTextAttributes([:], for: .selected)
    }
}

#Preview {
    TabViewDetailView(numberOfTabs: .constant(6),
                      isCustomColor: .constant(false),
                      isCustomSelectionIndicatorImage: .constant(false),
                      isCustomBackgroundImage: .constant(true))
}
