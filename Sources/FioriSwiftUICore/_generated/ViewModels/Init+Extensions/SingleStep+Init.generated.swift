// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension SingleStep where Title == EmptyView {
    public init(
    stepId: String = UUID().uuidString,
		@ViewBuilder node: () -> Node,
		@IndexedViewBuilder substeps: () -> Substeps
    ) {
        self.init(
            stepId: stepId,
			title: { EmptyView() },
			node: node,
			substeps: substeps
        )
    }
}
