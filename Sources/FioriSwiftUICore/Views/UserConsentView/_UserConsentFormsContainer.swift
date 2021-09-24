// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

/// Not used by developers.
public struct _UserConsentFormsContainer {
    var _userConsentForms: [UserConsentFormModel]

    public init(userConsentForms: [UserConsentFormModel] = []) {
        self._userConsentForms = userConsentForms
    }
}

extension _UserConsentFormsContainer: IndexedViewContainer {
    public var count: Int {
        self._userConsentForms.count
    }
    
    public func view(at index: Int) -> some View {
        UserConsentForm(model: self._userConsentForms[index])
    }
}
