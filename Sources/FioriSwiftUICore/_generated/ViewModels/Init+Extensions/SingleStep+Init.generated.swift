// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension SingleStep where Title == EmptyView {
    public init(
    id: String = UUID().uuidString,
		@ViewBuilder node: () -> Node,
		@IndexedViewBuilder substeps: () -> Substeps
    ) {
        self.init(
            id: id,
			title: { EmptyView() },
			node: node,
			substeps: substeps
        )
    }
}
