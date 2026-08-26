import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct WhatsNewListViewBaseStyle: WhatsNewListViewStyle {
    public func makeBody(_ configuration: WhatsNewListViewConfiguration) -> some View {
        NavigationView {
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 30) {
                        ForEach(0 ..< configuration.whatsNewListItems.count, id: \.self) { index in
                            configuration.whatsNewListItems.view(at: index).typeErased
                        }
                    }
                    .padding(EdgeInsets(top: 50, leading: 30, bottom: 160, trailing: 30))
                }
                VStack {
                    Spacer()
                    FioriButton(title: "Start", action: { _ in configuration.didFinish?() })
                        .fioriButtonStyle(self.startButtonStyle())
                        .padding(.bottom, 34)
                }
            }
            .navigationBarItems(leading: ToolbarCloseIcon {
                configuration.didClose?()
            })
            .navigationTitle("What's New")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    /// Returns an interactive tinted glass-effect button style on Liquid Glass
    /// systems (iOS 26+), falling back to the primary Fiori button style on
    /// earlier versions.
    private func startButtonStyle() -> AnyFioriButtonStyle {
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            FioriCustomizeGlassButtonStyle(maxWidth: 200).eraseToAnyFioriButtonStyle()
        } else {
            FioriPrimaryButtonStyle(200).eraseToAnyFioriButtonStyle()
        }
    }
}

// Default fiori styles
extension WhatsNewListViewFioriStyle {
    struct ContentFioriStyle: WhatsNewListViewStyle {
        func makeBody(_ configuration: WhatsNewListViewConfiguration) -> some View {
            WhatsNewListView(configuration)
            // Add default style for its content
            // .background()
        }
    }
}
