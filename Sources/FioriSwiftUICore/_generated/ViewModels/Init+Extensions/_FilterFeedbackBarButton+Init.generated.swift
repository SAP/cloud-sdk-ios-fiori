// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension _FilterFeedbackBarButton where LeftIcon == EmptyView {
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
