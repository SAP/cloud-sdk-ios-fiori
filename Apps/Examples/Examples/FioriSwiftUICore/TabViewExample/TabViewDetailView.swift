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
    var numberOfTabs: Int
    var isCustomColor: Bool
    var isCustomSelectionIndicatorImage: Bool
    var isCustomBackgroundImage: Bool
    var isSystemTabView: Bool
    @State private var selection = 0
    @State private var accentColor = Color.preferredColor(.tintColor)
    @State private var selectionAudioPlayer: AVAudioPlayer?
    
    init(numberOfTabs: Int,
         isCustomColor: Bool,
         isCustomSelectionIndicatorImage: Bool,
         isCustomBackgroundImage: Bool,
         isSystemTabView: Bool)
    {
        self.numberOfTabs = numberOfTabs
        self.isCustomColor = isCustomColor
        self.isCustomSelectionIndicatorImage = isCustomSelectionIndicatorImage
        self.isCustomBackgroundImage = isCustomBackgroundImage
        self.isSystemTabView = isSystemTabView
        
        self.configTabStyles()
    }
    
    var tabs: [TabBarModel] = [TabBarModel(name: "Overview", badge: "2", imageName: "house.fill"),
                               TabBarModel(name: "Cart", imageName: "cart"),
                               TabBarModel(name: "Saved", badge: "NEW", imageName: "bookmark"),
                               TabBarModel(name: "Profile", imageName: "person.crop.circle"),
                               TabBarModel(name: "To-Dos", imageName: "tray.and.arrow.down"),
                               TabBarModel(name: "2", imageName: "2.circle"),
                               TabBarModel(name: "3", imageName: "3.circle.fill")]
    
    var handler: Binding<Int> { Binding(
        get: { self.selection },
        set: {
            if self.selection != $0 {
                self.selection = $0
                self.accentColor = self.isCustomColor ? Color.random : Color.preferredColor(.tintColor)
            }
            self.playTabSound()
        }
    ) }
    
    var body: some View {
        TabView(selection: self.handler) {
            ForEach(0 ..< self.numberOfTabs, id: \.self) { index in
                let model = self.tabs[index]
                Group {
                    if index.isMultiple(of: 2) {
                        Color.random
                    } else {
                        List(0 ..< 20) { index in
                            Text("index: \(index)")
                        }
                    }
                }
                .badge(model.badge)
                .tag(index)
                .tabItem {
                    Label(model.name, systemImage: model.imageName)
                }
            }
        }
        .navigationTitle("TabView Example")
        .onDisappear {
            self.resetToSystemDefault()
        }
    }
    
    func configTabStyles() {
        if !self.isSystemTabView {
            if self.isCustomSelectionIndicatorImage {
                UITabBar.appearance().selectionIndicatorImage = UIImage(systemName: "circle.fill")?.withConfiguration(UIImage.SymbolConfiguration(scale: .small))
            } else {
                UITabBar.appearance().selectionIndicatorImage = nil
            }
            if self.isCustomColor {
                self.customTabStyle()
            } else {
                self.fioriTabStyle()
            }
        }
    }
    
    func customTabStyle() {
        let normalAttributes = [NSAttributedString.Key.font: UIFont.preferredFioriFont(forTextStyle: .footnote, weight: .regular),
                                NSAttributedString.Key.foregroundColor: UIColor(Color.random)]
        let selectedAttributes = [NSAttributedString.Key.font: UIFont.preferredFioriFont(forTextStyle: .footnote, weight: .bold),
                                  NSAttributedString.Key.foregroundColor: UIColor(Color.random)]
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.random)
        appearance.stackedLayoutAppearance.normal.badgeBackgroundColor = UIColor(Color.random)
        appearance.stackedLayoutAppearance.normal.badgeTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(Color.random)]
        appearance.stackedLayoutAppearance.selected.badgeTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(Color.random)]
        if self.isCustomBackgroundImage {
            appearance.backgroundImage = UIImage(named: "placeholderImageLight")?.stretchableImage(withLeftCapWidth: 0, topCapHeight: 0)
        } else {
            appearance.backgroundImage = nil
        }
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.preferredColor(.primaryLabel))
    }
    
    func fioriTabStyle() {
        let normalAttributes = [NSAttributedString.Key.font: UIFont.preferredFioriFont(forTextStyle: .caption2, weight: .regular),
                                NSAttributedString.Key.foregroundColor: UIColor(Color.preferredColor(.primaryLabel))]
        let selectedAttributes = [NSAttributedString.Key.font: UIFont.preferredFioriFont(forTextStyle: .caption2, weight: .bold),
                                  NSAttributedString.Key.foregroundColor: UIColor(Color.preferredColor(.tintColor))]
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.preferredColor(.primaryLabel))
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.preferredColor(.tintColor))
        if self.isCustomBackgroundImage {
            appearance.backgroundImage = UIImage(named: "placeholderImageLight")?.stretchableImage(withLeftCapWidth: 0, topCapHeight: 0)
        } else {
            appearance.backgroundImage = nil
        }
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.preferredColor(.primaryLabel))
    }
    
    func resetToSystemDefault() {
        UITabBar.appearance().unselectedItemTintColor = nil
        UITabBar.appearance().backgroundColor = nil
        UITabBarItem.appearance().setTitleTextAttributes([:], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([:], for: .selected)
        UITabBarItem.appearance().setBadgeTextAttributes([:], for: .normal)
        UITabBarItem.appearance().setBadgeTextAttributes([:], for: .selected)
        UITabBarItem.appearance().badgeColor = nil
    }
    
    func playTabSound() {
        if let url = Bundle.main.url(forResource: "08 Tap", withExtension: "wav") {
            do {
                self.selectionAudioPlayer = try AVAudioPlayer(contentsOf: url)
                self.selectionAudioPlayer?.prepareToPlay()
                self.selectionAudioPlayer?.play()
            } catch let error as NSError {
                print("Error creating AVAudioPlayer \(error)")
            }
        }
    }
}

#Preview {
    TabViewDetailView(numberOfTabs: 6,
                      isCustomColor: false,
                      isCustomSelectionIndicatorImage: false,
                      isCustomBackgroundImage: true,
                      isSystemTabView: false)
}
