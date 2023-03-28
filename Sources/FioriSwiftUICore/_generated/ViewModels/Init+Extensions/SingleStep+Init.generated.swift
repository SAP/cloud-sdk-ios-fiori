// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension SingleStep where Title == EmptyView {
    public init(
    @ViewBuilder node: () -> Node
    ) {
        self.init(
            title: { EmptyView() },
			node: node
        )
    }
}
