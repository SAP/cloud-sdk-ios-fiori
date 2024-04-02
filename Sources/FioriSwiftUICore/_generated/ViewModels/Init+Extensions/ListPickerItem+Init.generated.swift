// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension ListPickerItem where Value == EmptyView {
    public init(
    @ViewBuilder key: () -> Key
    ) {
        self.init(
            key: key,
			value: { EmptyView() }
        )
    }
}
