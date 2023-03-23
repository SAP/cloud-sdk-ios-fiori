// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension SingleStep where Name == EmptyView {
    public init(
    @ViewBuilder overText: () -> OverText
    ) {
        self.init(
            name: { EmptyView() },
			overText: overText
        )
    }
}

extension SingleStep where OverText == EmptyView {
    public init(
    @ViewBuilder name: () -> Name
    ) {
        self.init(
            name: name,
			overText: { EmptyView() }
        )
    }
}

extension SingleStep where Name == EmptyView, OverText == EmptyView {
    public init(
    
    ) {
        self.init(
            name: { EmptyView() },
			overText: { EmptyView() }
        )
    }
}
