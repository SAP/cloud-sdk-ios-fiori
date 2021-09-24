// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

/// Not used by developers.
public struct _UserConsentPagesContainer {
    var _userConsentPages: [UserConsentPageModel]

    public init(userConsentPages: [UserConsentPageModel] = []) {
        self._userConsentPages = userConsentPages
    }
}

extension _UserConsentPagesContainer: IndexedViewContainer {
    public var count: Int {
        self._userConsentPages.count
    }
    
    public func view(at index: Int) -> some View {
        UserConsentPage(model: self._userConsentPages[index])
    }
}
