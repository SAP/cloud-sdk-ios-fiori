// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

/// Not used by developers.
public struct _UserConsentPagesContainer {
    // Will be removed when `_UserConsentPageModel` removed.
    var _userConsentPages: [_UserConsentPageModel]
    
    var pages: [UserConsentPage]
    var usePages: Bool = true
    
    /// :nodoc:
    public init(userConsentPages: [_UserConsentPageModel] = []) {
        self._userConsentPages = userConsentPages
        self.pages = []
        self.usePages = false
    }
    
    /// :nodoc:
    public init(_ pages: [UserConsentPage] = []) {
        self._userConsentPages = []
        self.pages = pages
        self.usePages = true
    }
}

extension _UserConsentPagesContainer: IndexedViewContainer {
    /// Count of indexed views.
    public var count: Int {
        self.usePages ? self.pages.count : self._userConsentPages.count
    }
    
    /// :nodoc:
    public func view(at index: Int) -> some View {
        Group {
            if self.usePages {
                self.pages[index]
            } else {
                _UserConsentPage(model: self._userConsentPages[index])
            }
        }
    }
}

extension _UserConsentPagesContainer: View {
    // use `view(at index: Int)` to generate indexed views instead of this body.
    /// :nodoc:
    public var body: some View {
        EmptyView()
    }
}
