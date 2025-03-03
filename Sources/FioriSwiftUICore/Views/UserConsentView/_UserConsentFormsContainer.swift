// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

/// Not used by developers.
public struct _UserConsentFormsContainer {
    // Will be removed when `_UserConsentFormModel` removed.
    var _userConsentForms: [_UserConsentFormModel]
    
    var forms: [UserConsentForm]
    var useForms: Bool = true
    
    /// :nodoc:
    public init(userConsentForms: [_UserConsentFormModel] = []) {
        self._userConsentForms = userConsentForms
        self.forms = []
        self.useForms = false
    }
    
    /// :nodoc:
    public init(_ forms: [UserConsentForm] = []) {
        self._userConsentForms = []
        self.forms = forms
        self.useForms = true
    }
}

extension _UserConsentFormsContainer: IndexedViewContainer {
    /// Count of indexed views.
    public var count: Int {
        self.useForms ? self.forms.count : self._userConsentForms.count
    }
    
    /// :nodoc:
    public func view(at index: Int) -> some View {
        Group {
            if self.useForms {
                self.forms[index]
            } else {
                _UserConsentForm(model: self._userConsentForms[index])
            }
        }
    }
}

extension _UserConsentFormsContainer: View {
    // use `view(at index: Int)` to generate indexed views instead of this body.
    /// :nodoc:
    public var body: some View {
        EmptyView()
    }
}
