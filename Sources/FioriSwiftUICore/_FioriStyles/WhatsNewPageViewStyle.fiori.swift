import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct WhatsNewPageViewBaseStyle: WhatsNewPageViewStyle {
    @State var currentPageIndex: Int = 0
    @State var actionButtonTitle: AttributedString = "Next"
    
    public func makeBody(_ configuration: WhatsNewPageViewConfiguration) -> some View {
        NavigationView {
            ZStack {
                TabView(selection: self.$currentPageIndex) {
                    ForEach(0 ..< configuration.whatsNewPages.count, id: \.self) { index in
                        ScrollView(showsIndicators: false) {
                            configuration.whatsNewPages.view(at: index).typeErased
                                .tag(index)
                        }
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
                .navigationBarItems(trailing: Button(NSLocalizedString("Close", comment: ""), action: {
                    configuration.didClose?()
                }))
                .navigationTitle("What's New")
                .navigationBarTitleDisplayMode(.inline)
                .onChange(of: self.currentPageIndex) {
                    self.actionButtonTitle = self.currentPageIndex < configuration.whatsNewPages.count - 1 ? "Next" : "Start"
                }
                VStack {
                    Spacer()
                    FioriButton(title: self.actionButtonTitle, action: { _ in
                        if self.currentPageIndex < configuration.whatsNewPages.count - 1 {
                            withAnimation {
                                self.currentPageIndex += 1
                            }
                        } else {
                            configuration.didFinish?()
                        }
                    })
                    .fioriButtonStyle(FioriPrimaryButtonStyle(200))
                    .frame(height: 160)
                }
            }
        }
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
