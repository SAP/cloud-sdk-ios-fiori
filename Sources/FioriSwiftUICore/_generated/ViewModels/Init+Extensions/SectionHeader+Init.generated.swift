// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension SectionHeader where Attribute == EmptyView {
    public init(
    @ViewBuilder title: () -> Title
    ) {
        self.init(
            title: title,
			attribute: { EmptyView() }
        )
    }
}
