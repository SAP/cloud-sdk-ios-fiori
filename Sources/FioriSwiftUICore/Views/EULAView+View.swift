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
        
        struct ActionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
            }
        }
        
        struct SecondaryActionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 15))
                    .foregroundColor(.preferredColor(.tintColorDark))
            }
        }
        
        static let title = Title()
        static let actionText = ActionText()
        static let secondaryActionText = SecondaryActionText()
        
        typealias HtmlContent = EmptyModifier
        typealias TitleCumulative = EmptyModifier
        typealias HtmlContentCumulative = EmptyModifier
        typealias ActionTextCumulative = EmptyModifier
        typealias SecondaryActionTextCumulative = EmptyModifier
        
        static let titleCumulative = TitleCumulative()
        static let htmlContent = HtmlContent()
        static let htmlContentCumulative = HtmlContentCumulative()
        static let actionTextCumulative = ActionTextCumulative()
        static let secondaryActionTextCumulative = SecondaryActionTextCumulative()
    }
}

extension EULAView: View {
    public var body: some View {
        if #available(iOS 14.0, *) {
            self.makeBody()
                .toolbar(content: {
                    ToolbarItem(placement: .bottomBar) {
                        actionText
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Spacer()
                    }
                    ToolbarItem(placement: .bottomBar) {
                        secondaryActionText
                    }
                })
        } else {
            GeometryReader { geometry in
                VStack {
                    self.makeBody()
                        .frame(minHeight: geometry.size.height - 50, maxHeight: .infinity)
                    Spacer()
                    HStack(spacing: 10) {
                        actionText
                        Spacer()
                        secondaryActionText
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
                htmlContent
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
        LibraryItem(EULAView(title: "EULA", htmlContent: NSAttributedString(string: "http://www.sap.com\nThis is a legally binding agreement"), actionText: "Disagree", secondaryActionText: "Agree"),
                    category: .control)
    }
}
