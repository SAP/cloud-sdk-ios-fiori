import SwiftUI

public struct _WhatsNewPagesContainer: View {
    var whatsNewPages: [WhatsNewPage]
    
    /// :nodoc:
    public init(_ whatsnewPages: [WhatsNewPage]) {
        self.whatsNewPages = whatsnewPages
    }

    // use `view(at index: Int)` to generate indexed views instead of this body.
    /// :nodoc:
    public var body: some View {
        EmptyView()
    }
}

extension _WhatsNewPagesContainer: IndexedViewContainer {
    /// Count of indexed views.
    public var count: Int {
        self.whatsNewPages.count
    }
    
    /// :nodoc:
    public func view(at index: Int) -> some View {
        self.whatsNewPages[index]
    }
}
