// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension SingleStep where Name == EmptyView {
    public init(
    @ViewBuilder node: () -> Node
    ) {
        self.init(
            name: { EmptyView() },
			node: node
        )
    }
}

extension SingleStep where Node == EmptyView {
    public init(
    @ViewBuilder name: () -> Name
    ) {
        self.init(
            name: name,
			node: { EmptyView() }
        )
    }
}

extension SingleStep where Name == EmptyView, Node == EmptyView {
    public init(
    
    ) {
        self.init(
            name: { EmptyView() },
			node: { EmptyView() }
        )
    }
}
