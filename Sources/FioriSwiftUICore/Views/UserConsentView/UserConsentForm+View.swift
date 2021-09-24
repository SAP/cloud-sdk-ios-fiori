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
        VStack {
            makeBody()
            toolBar
        }
    }
    
    @ViewBuilder
    func makeBody() -> some View {
        _userConsentPages.view(at: _pageIndex)
            .navigationBarItems(leading: self.navBarLeadingView, trailing: self.navBarTrailingView)
            .alert(configuration: self.alertConfiguration, isPresented: $_showAlert)
    }
    
    var alertConfiguration: AlertConfiguration {
        var alertConfig = _alertConfiguration
        
        alertConfig.action._didSelectSetter {
            self.didAllow?()
            _alertConfiguration.action.didSelect?()
        }
        alertConfig.secondaryAction._didSelectSetter {
            self.didDeny?(self._isRequired)
            _alertConfiguration.action.didSelect?()
        }
        
        return alertConfig
    }
    
    @ViewBuilder
    private var toolBar: some View {
        HStack {
            if _pageIndex == _userConsentPages.count - 1 {
                if _isRequired {
                    denyAction
                        .onSimultaneousTapGesture {
                            _showAlert = true
                        }
                } else {
                    notNowAction
                        .onSimultaneousTapGesture {
                            self.didDeny?(_isRequired)
                        }
                }
                
                Spacer()
                
                allowAction
                    .onSimultaneousTapGesture {
                        self.didAllow?()
                    }
            }
        }
        .padding()
    }
    
    @ViewBuilder
    private var navBarLeadingView: some View {
        switch _pageIndex {
        case 0:
            cancelAction
                .onSimultaneousTapGesture {
                    self.didCancel?()
                }
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

extension UserConsentForm {
    var didAllow: (() -> Void)? {
        if userConsentFormDidAllow == nil, _didAllow == nil {
            return nil
        }
        
        return {
            _didAllow?()
            userConsentFormDidAllow?()
        }
    }
    
    var didDeny: ((Bool) -> Void)? {
        if userConsentFormDidDeny == nil, _didDeny == nil {
            return nil
        }
        
        return {
            _didDeny?($0)
            userConsentFormDidDeny?($0)
        }
    }
    
    var didCancel: (() -> Void)? {
        if userConsentFormDidCancel == nil, _didCancel == nil {
            return nil
        }
        
        return {
            _didCancel?()
            userConsentFormDidCancel?()
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
