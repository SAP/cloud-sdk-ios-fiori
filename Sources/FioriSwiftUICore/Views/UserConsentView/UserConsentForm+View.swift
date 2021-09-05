import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum UserConsentForm {
        typealias NextAction = EmptyModifier
        typealias NextActionCumulative = EmptyModifier
        typealias CancelAction = EmptyModifier
        typealias CancelActionCumulative = EmptyModifier
        typealias AllowAction = EmptyModifier
        typealias AllowActionCumulative = EmptyModifier
        typealias DenyAction = EmptyModifier
        typealias DenyActionCumulative = EmptyModifier
        typealias NotNowAction = EmptyModifier
        typealias NotNowActionCumulative = EmptyModifier

        // TODO: - substitute type-specific ViewModifier for EmptyModifier
        /*
             // replace `typealias Subtitle = EmptyModifier` with:

             struct Subtitle: ViewModifier {
                 func body(content: Content) -> some View {
                     content
                         .font(.body)
                         .foregroundColor(.preferredColor(.primary3))
                 }
             }
         */
        static let nextAction = NextAction()
        static let cancelAction = CancelAction()
        static let allowAction = AllowAction()
        static let denyAction = DenyAction()
        static let notNowAction = NotNowAction()
        static let nextActionCumulative = NextActionCumulative()
        static let cancelActionCumulative = CancelActionCumulative()
        static let allowActionCumulative = AllowActionCumulative()
        static let denyActionCumulative = DenyActionCumulative()
        static let notNowActionCumulative = NotNowActionCumulative()
    }
}

// FIXME: - Implement UserConsentForm View body

extension UserConsentForm: View {
    public var body: some View {
        NavigationView {
            VStack {
                _userConsentPages.view(at: _pageIndex)
                
                toolBar
            }
            .navigationBarItems(leading: navBarLeadingView, trailing: navBarTrailingView)
//            .animation(., value: _pageIndex)
        }
    }
    
    @ViewBuilder
    private var toolBar: some View {
        if _pageIndex == _userConsentPages.count - 1 {
            HStack {
                if _isRequired {
                    denyAction
                } else {
                    notNowAction
                }
                
                Spacer()
                
                allowAction
            }
        }
    }
    
    @ViewBuilder
    private var navBarLeadingView: some View {
        switch _pageIndex {
        case 0:
            cancelAction
        default:
            Button("Back", action: {
                _pageIndex -= 1
            })
        }
    }
    
    @ViewBuilder
    private var navBarTrailingView: some View {
        switch _pageIndex {
        case _userConsentPages.count - 1:
            EmptyView()
        default:
            nextAction
                .onSimultaneousTapGesture {
                    _pageIndex += 1
                }
        }
    }
}

// FIXME: - Implement UserConsentForm specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct UserConsentFormLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(UserConsentForm(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
