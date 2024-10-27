// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension _ListPickerItem where Value == EmptyView {
    public init(
    @ViewBuilder key: () -> Key,
		axis: Axis = .horizontal
    ) {
        self.init(
            key: key,
			value: { EmptyView() },
			axis: axis
        )
    }
}
