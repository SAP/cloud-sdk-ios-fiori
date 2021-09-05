/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

extension Fiori {
    enum EULAView {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 28, weight: .thin, design: .default))
                    .foregroundColor(.preferredColor(.primary1))
                    .multilineTextAlignment(.center)
            }
        }
        
        struct Action: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
            }
        }
        
        struct SecondaryAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.tintColorDark))
            }
        }
        
        static let title = Title()
        static let action = Action()
        static let secondaryAction = SecondaryAction()
        
        typealias HtmlView = EmptyModifier
        typealias TitleCumulative = EmptyModifier
        typealias HtmlViewCumulative = EmptyModifier
        typealias ActionCumulative = EmptyModifier
        typealias SecondaryActionCumulative = EmptyModifier
        
        static let titleCumulative = TitleCumulative()
        static let htmlView = HtmlView()
        static let htmlViewCumulative = HtmlViewCumulative()
        static let actionCumulative = ActionCumulative()
        static let secondaryActionCumulative = SecondaryActionCumulative()
    }
}

extension EULAView: View {
    public var body: some View {
        if #available(iOS 14.0, *) {
            self.makeBody()
                .toolbar(content: {
                    ToolbarItem(placement: .bottomBar) {
                        action
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Spacer()
                    }
                    ToolbarItem(placement: .bottomBar) {
                        secondaryAction
                    }
                })
        } else {
            GeometryReader { geometry in
                VStack {
                    self.makeBody()
                        .frame(minHeight: geometry.size.height - 50, maxHeight: .infinity)
                    Spacer()
                    HStack(spacing: 10) {
                        action
                        Spacer()
                        secondaryAction
                    }
                    .padding(EdgeInsets(top: 8, leading: 32, bottom: 20, trailing: 32))
                    .frame(minHeight: 50, maxHeight: .infinity, alignment: .bottom)
                }
            }
        }
    }
    
    func makeBody() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                title
                    .padding(.top, 40)
                    .padding(.bottom, 30)
                htmlView
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.tintColor))
                    .multilineTextAlignment(.center)
                    .overlay(GetDynamicHeight())
                Spacer()
            }
            .frame(minHeight: max(contentHeight + 80, UIScreen.main.bounds.size.height - 120), maxHeight: .infinity)
            .onPreferenceChange(GetDynamicHeight.Key.self) {
                if contentHeight < $0 {
                    contentHeight = $0
                }
            }
        }
        .padding(.top, 2)
        .padding(.leading, 32)
        .padding(.trailing, 32)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button("Cancel") {
            self.presentationMode.wrappedValue.dismiss()
        })
    }
}

@available(iOS 14.0, *)
struct EULAViewLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(EULAView(title: "EULA", htmlView: HTMLView(htmlContent: NSAttributedString(string: "http://www.sap.com\nThis is a legally binding agreement")), action: Action(actionText: "Disagree"), secondaryAction: SecondaryAction(secondaryActionText: "Disagree")),
                    category: .control)
    }
}
