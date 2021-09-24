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
        static let cancelAction = CancelAction()
        
        typealias CancelAction = EmptyModifier
        typealias BodyAttributedText = EmptyModifier
        typealias TitleCumulative = EmptyModifier
        typealias BodyAttributedTextCumulative = EmptyModifier
        typealias ActionCumulative = EmptyModifier
        typealias SecondaryActionCumulative = EmptyModifier
        typealias CancelActionCumulative = EmptyModifier
        
        static let titleCumulative = TitleCumulative()
        static let bodyAttributedText = BodyAttributedText()
        static let bodyAttributedTextCumulative = BodyAttributedTextCumulative()
        static let actionCumulative = ActionCumulative()
        static let secondaryActionCumulative = SecondaryActionCumulative()
        static let cancelActionCumulative = CancelActionCumulative()
    }
}

extension EULAView: View {
    public var body: some View {
        VStack {
            self.makeBody()
            toolbar
        }
    }
    
    func makeBody() -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                title
                    .padding(.top, 40)
                    .padding(.bottom, 30)
                
                bodyAttributedText
            }
        }
        .padding(.top, 2)
        .padding(.leading, 32)
        .padding(.trailing, 32)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: cancelAction.onSimultaneousTapGesture {
            self._didCancel?()
        })
    }
    
    @ViewBuilder
    var toolbar: some View {
        HStack {
            secondaryAction
                .onSimultaneousTapGesture {
                    self._didDisagree?()
                }
            
            Spacer()
            
            action
                .onSimultaneousTapGesture {
                    self._didAgree?()
                }
        }
        .padding()
    }
}

@available(iOS 14, macOS 11, *)
struct EULAViewLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(EULAView(title: "EULA", bodyAttributedText: NSAttributedString(string: "http://www.sap.com\nThis is a legally binding agreement")),
                    category: .control)
    }
}
