import SwiftUI
import FioriThemeManager

struct NavigationBarExample: View {
    @State private var isPresented = false
    
    var body: some View {
        List {
            NavigationLink {
                NavigationBarFioriStyle()
            } label: {
                Text("FioriStyle")
            }
            NavigationLink {
                NavigationBarPopover()
            } label: {
                Text("Title & Subtitle for TitleView(Long press to show popover)")
            }
            
            NavigationLink {
                NavigationBarCustomItem()
            } label: {
                Text("FUIBarButtonItem wieh Expandable Touch Area & Highlighted State")
            }
        }
        .navigationTitle("NavigationBar Test")
    }
}

#Preview {
    NavigationBarExample()
}

struct NavigationBar {
    
    static func restoreToDefaultStyle() {
        UINavigationBar.appearance().standardAppearance = NavigationBar.standardAppearance
        UINavigationBar.appearance().compactAppearance = NavigationBar.compactAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = NavigationBar.scrollEdgeAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = NavigationBar.compactScrollEdgeAppearance
    }
    
    static let standardAppearance: UINavigationBarAppearance = UINavigationBar.appearance().standardAppearance
    static let compactAppearance: UINavigationBarAppearance? = UINavigationBar.appearance().compactAppearance
    static let scrollEdgeAppearance: UINavigationBarAppearance? = UINavigationBar.appearance().scrollEdgeAppearance
    static let compactScrollEdgeAppearance: UINavigationBarAppearance? = UINavigationBar.appearance().compactScrollEdgeAppearance
    
    static func applyFioriStyle() {
        restoreToDefaultStyle()
        UINavigationBar.appearance().standardAppearance = NavigationBar.standardAppearance
        UINavigationBar.appearance().compactAppearance = NavigationBar.compactAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = NavigationBar.scrollEdgeAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = NavigationBar.compactScrollEdgeAppearance
        
        let navigationBarAppearance = UINavigationBar.appearance()
        // BCP: 2270013080
        // Directly setting isTranslucent may cause flickering.
        // So, avoid setting the property if it is already false.
        if navigationBarAppearance.isTranslucent {
            navigationBarAppearance.isTranslucent = false
        }
        
        let navBarAppearance = NavigationBar.FioriStyle()
        navigationBarAppearance.tintColor = UIColor(Color.preferredColor(.tintColor))
        navigationBarAppearance.standardAppearance = navBarAppearance
        navigationBarAppearance.compactAppearance = navBarAppearance
        
        var scrollEdgeAppearance = navBarAppearance
        scrollEdgeAppearance = navBarAppearance.copy()
        scrollEdgeAppearance.shadowColor = UIColor.clear
        navigationBarAppearance.scrollEdgeAppearance = scrollEdgeAppearance
        if #available(iOS 15.0, *) {
            navigationBarAppearance.compactScrollEdgeAppearance = scrollEdgeAppearance
        }
        
        navigationBarAppearance.prefersLargeTitles = true
        
        // Adjust overall tint color
        UIApplication.shared.delegate?.window??.tintColor = UIColor(Color.preferredColor(.tintColor))
        
        // Add the batTintColor when QLPreviewController is presented
        // Setting barTintColor on the navigatin bar of QLPreviewController has no effect, so set background image instead. (Stackoverflow: https://stackoverflow.com/questions/46239664/how-to-customize-the-color-of-the-navigation-bar-in-qlpreviewcontroller?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)
        UINavigationBar.appearance(whenContainedInInstancesOf: [UIDocumentBrowserViewController.self]).tintColor = UIColor(Color.preferredColor(.tintColor))
        UINavigationBar.appearance(whenContainedInInstancesOf: [UIDocumentBrowserViewController.self]).backgroundColor = .systemBackground
    }
    
    /// Get `UINavigationBarAppearance` of .v2 FioriStyle for `UINavigationBar`
    static func FioriStyle() -> UINavigationBarAppearance {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color.preferredColor(.navBarTitleLabel)),
                                                .font: UIFont.preferredFioriFont(forTextStyle: .body, weight: .black)]
        
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.preferredColor(.navBarTitleLabel)),
                                                     .font: UIFont.preferredFioriFont(forTextStyle: .largeTitle, weight: .black)]
        navBarAppearance.backgroundImage = nil
        navBarAppearance.backgroundEffect = nil
        navBarAppearance.backgroundColor = UIColor.clear
        navBarAppearance.shadowColor = UIColor.clear
        // Default BarButtonItems Font
        let buttonAppearance = UIBarButtonItemAppearance()
        buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color.preferredColor(.tintColor)),
                                                       .font: UIFont.preferredFioriFont(forTextStyle: .body, weight: .bold)]
        navBarAppearance.buttonAppearance = buttonAppearance
        navBarAppearance.backButtonAppearance = buttonAppearance
        return navBarAppearance
    }
}
