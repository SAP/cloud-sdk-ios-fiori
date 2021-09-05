/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum UserConsentPage {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.system(size: 28, weight: .thin, design: .default))
                    .foregroundColor(.preferredColor(.primary1))
                    .multilineTextAlignment(.center)
            }
        }
        
        struct BodyText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.body)
                    .foregroundColor(.preferredColor(.primary1))
                    .multilineTextAlignment(.center)
            }
        }
        
        struct FootNote: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.subheadline)
                    .foregroundColor(.preferredColor(.tintColorDark))
                    .multilineTextAlignment(.center)
            }
        }
        
        typealias TitleCumulative = EmptyModifier
        typealias BodyTextCumulative = EmptyModifier
        typealias HtmlView = EmptyModifier
        typealias HtmlViewCumulative = EmptyModifier
        typealias FootnoteCumulative = EmptyModifier
        
        static let title = Title()
        static let bodyText = BodyText()
        static let htmlView = HtmlView()
        static let footnote = FootNote()
        static let titleCumulative = TitleCumulative()
        static let bodyTextCumulative = BodyTextCumulative()
        static let htmlViewCumulative = HtmlViewCumulative()
        static let footnoteCumulative = FootnoteCumulative()
    }
}

extension UserConsentPage: View {
    public var body: some View {
        GeometryReader { geometry in
            VStack {
                self.makeBody()
                    .frame(minHeight: geometry.size.height - 50, maxHeight: .infinity)
            }
        }
    }
    
    func makeBody() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                title
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                
                if !self.isBodyTextEmptyView {
                    bodyText
                }
                if !self.isHtmlViewEmptyView {
                    htmlView
                        .font(.system(size: 15))
                        .foregroundColor(.preferredColor(.primary3))
                        .multilineTextAlignment(.center)
                        .overlay(GetDynamicHeight())
                }
                footnote
                    .padding(.top, 30)
                    .foregroundColor(.preferredColor(.tintColor))
                    .onTapGesture {
                        let titleString = NSLocalizedString("Want Data Privacy?", tableName: tableName, bundle: bundle, value: "Want Data Privacy?", comment: "")
                        let okString = NSLocalizedString("Ok", tableName: tableName, bundle: bundle, value: "Ok", comment: "")
                        let msgString = NSLocalizedString("Be wise about your data", tableName: tableName, bundle: bundle, value: "Be wise about your data", comment: "")
                        self.alertMessage(title: titleString, message: msgString, primaryAction: UIAlertAction(title: okString, style: .default, handler: nil), secondaryAction: nil)
                    }
                    .buttonStyle(StatefulButtonStyle())
                
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
    }
}

@available(iOS 14.0, *)
struct UserConsentPageLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(UserConsentPage(title: "Data Privacy", bodyText: "Detailed text about how data privacy pertains to this app and why it is important for the user to enable this functionality.", footnote: "Learn more about Data Privacy"),
                    category: .control)
    }
}
