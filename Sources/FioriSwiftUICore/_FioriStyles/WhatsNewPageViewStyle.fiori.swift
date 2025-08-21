import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct WhatsNewPageViewBaseStyle: WhatsNewPageViewStyle {
    public func makeBody(_ configuration: WhatsNewPageViewConfiguration) -> some View {
        NavigationView {
            configuration.whatsNewPages
                .navigationTitle("What's New")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(NSLocalizedString("Close", comment: ""), action: {
                    configuration.didClose?()
                }))
        }
        .environment(\.whatsNewPageIndex, configuration.$currentIndex)
        .environment(\.whatsNewPageDidFinish, configuration.didFinish)
    }
}

// Default fiori styles
extension WhatsNewPageViewFioriStyle {
    struct ContentFioriStyle: WhatsNewPageViewStyle {
        func makeBody(_ configuration: WhatsNewPageViewConfiguration) -> some View {
            WhatsNewPageView(configuration)
            // Add default style for its content
            // .background()
        }
    }
}

struct WhatsNewPageIndexEnvironmentKey: EnvironmentKey {
    static let defaultValue: Binding<Int?> = .constant(nil)
}

struct WhatsNewPageDidFinishEnvironmentKey: EnvironmentKey {
    static let defaultValue: (() -> Void)? = nil
}

public extension EnvironmentValues {
    /// The index of the WhatsNewPageView's current page. When the value changes, the component will navigate to the page corresponding to the new value.
    var whatsNewPageIndex: Binding<Int?> {
        get { self[WhatsNewPageIndexEnvironmentKey.self] }
        set { self[WhatsNewPageIndexEnvironmentKey.self] = newValue }
    }
    
    /// An action to take when the user has tapped on the Start button in the WhatsNewPageView.
    var whatsNewPageDidFinish: (() -> Void)? {
        get { self[WhatsNewPageDidFinishEnvironmentKey.self] }
        set { self[WhatsNewPageDidFinishEnvironmentKey.self] = newValue }
    }
}
