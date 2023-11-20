import FioriThemeManager
import SwiftUI

struct NavigationBarFioriStyle: View {
    var body: some View {
        NavigationStack {
            List {
                Text("NavigationBar Background")
                Text("Standard title font & color")
                Text("Long press on navigation bar can show full title")
            }
            .navigationTitle("FioriStyle")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Title goes here")
                            .font(.fiori(forTextStyle: .subheadline)).fontWeight(.black)
                        Text("Subtitle goes here")
                            .font(.fiori(forTextStyle: .caption1))
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button(action: {}, label: {
                            Text("Redo")
                        })
                        Button(action: {}, label: {
                            Image(systemName: "camera")
                        })
                    }
                    .font(.fiori(forTextStyle: .headline)).fontWeight(.black)
                }
            }
        }
        .onAppear(perform: {
            NavigationBarFioriStyle.applyFioriStyle()
        })
        .onDisappear {
            NavigationBarFioriStyle.restoreToDefaultStyle()
        }
    }
    
    static func restoreToDefaultStyle() {
        UINavigationBar.appearance().standardAppearance = NavigationBarFioriStyle.standardAppearance
        UINavigationBar.appearance().compactAppearance = NavigationBarFioriStyle.compactAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = NavigationBarFioriStyle.scrollEdgeAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = NavigationBarFioriStyle.compactScrollEdgeAppearance
    }
    
    static let standardAppearance: UINavigationBarAppearance = UINavigationBar.appearance().standardAppearance
    static let compactAppearance: UINavigationBarAppearance? = UINavigationBar.appearance().compactAppearance
    static let scrollEdgeAppearance: UINavigationBarAppearance? = UINavigationBar.appearance().scrollEdgeAppearance
    static let compactScrollEdgeAppearance: UINavigationBarAppearance? = UINavigationBar.appearance().compactScrollEdgeAppearance
    
    static func applyFioriStyle() {
        self.restoreToDefaultStyle()
        UINavigationBar.appearance().standardAppearance = NavigationBarFioriStyle.standardAppearance
        UINavigationBar.appearance().compactAppearance = NavigationBarFioriStyle.compactAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = NavigationBarFioriStyle.scrollEdgeAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = NavigationBarFioriStyle.compactScrollEdgeAppearance
        
        let navigationBarAppearance = UINavigationBar.appearance()
        // BCP: 2270013080
        // Directly setting isTranslucent may cause flickering.
        // So, avoid setting the property if it is already false.
        if navigationBarAppearance.isTranslucent {
            navigationBarAppearance.isTranslucent = false
        }
        
        let navBarAppearance = NavigationBarFioriStyle.FioriStyle()
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

#Preview {
    NavigationBarFioriStyle()
}
