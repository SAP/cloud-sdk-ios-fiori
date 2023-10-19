// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension OptionChip where LeftIcon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		isSelected: Bool
    ) {
        self.init(
            leftIcon: { EmptyView() },
			title: title,
			isSelected: isSelected
        )
    }
}
