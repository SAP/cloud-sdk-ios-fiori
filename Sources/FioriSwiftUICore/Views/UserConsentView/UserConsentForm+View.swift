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
            self.makeBody()
            self.toolBar
        }
    }
    
    @ViewBuilder
    func makeBody() -> some View {
        _userConsentPages.view(at: _pageIndex)
            .navigationBarItems(leading: self.navBarLeadingView, trailing: self.navBarTrailingView)
            .navigationBarTitle(self.navTitle)
            .alert(configuration: self.alertConfiguration, isPresented: $_showAlert.0)
    }
    
    var alertConfiguration: AlertConfiguration {
        guard let alertConfig = _alertConfiguration?(_showAlert.1) else {
            fatalError("UserConsentForm: alert configuration cannot be nil")
        }
        
        var newAlertConfig = alertConfig
        
        switch _showAlert.1 {
        case .deny:
            newAlertConfig.action._didSelectSetter {
                self.didAllow?()
                alertConfig.action.didSelect?()
            }
            newAlertConfig.secondaryAction._didSelectSetter {
                self.didDeny?(self._isRequired)
                alertConfig.secondaryAction.didSelect?()
            }
        case .cancel:
            newAlertConfig.secondaryAction._didSelectSetter {
                self.didCancel?()
                alertConfig.secondaryAction.didSelect?()
            }
        }
        
        return newAlertConfig
    }
    
    @ViewBuilder
    private var toolBar: some View {
        HStack {
            if _pageIndex == _userConsentPages.count - 1 {
                if _isRequired {
                    denyAction
                        .onSimultaneousTapGesture {
                            if _alertConfiguration?(.deny) != nil {
                                self._showAlert = (true, .deny)
                            } else {
                                self.didDeny?(_isRequired)
                            }
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
                    if _alertConfiguration?(.cancel) != nil {
                        self._showAlert = (true, .cancel)
                    } else {
                        self.didCancel?()
                    }
                }
        default:
            Button(NSLocalizedString("Back", comment: ""), action: {
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
    
    private var navTitle: String {
        if _userConsentPages.count > 1 {
            return "\(NSLocalizedString("Step", comment: "")) \(_pageIndex + 1) \(NSLocalizedString("of", comment: "")) \(_userConsentPages.count)"
        } else {
            return ""
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

/// The action type of `UserConsentForm` that presents the alert.
public enum UserConsentAlertType {
    /// Cancel action
    case cancel
    
    /// Deny action
    case deny
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
