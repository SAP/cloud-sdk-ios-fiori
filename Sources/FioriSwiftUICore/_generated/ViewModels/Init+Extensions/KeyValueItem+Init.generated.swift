// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension KeyValueItem where Value == EmptyView {
    public init(
    @ViewBuilder key: () -> Key
    ) {
        self.init(
            key: key,
			value: { EmptyView() }
        )
    }
}
