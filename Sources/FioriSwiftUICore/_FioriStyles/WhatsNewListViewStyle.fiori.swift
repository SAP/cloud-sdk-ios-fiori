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
                        .fioriButtonStyle(FioriPrimaryButtonStyle(200))
                        .padding(.bottom, 34)
                }
            }
            .navigationBarItems(trailing: Button(NSLocalizedString("Close", comment: ""), action: {
                configuration.didClose?()
            }))
            .navigationTitle("What's New")
            .navigationBarTitleDisplayMode(.inline)
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
