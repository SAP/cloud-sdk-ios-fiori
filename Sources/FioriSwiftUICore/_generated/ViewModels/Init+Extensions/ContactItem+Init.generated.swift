// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension ContactItem where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder actionItems: () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: detailImage,
			actionItems: actionItems
        )
    }
}

extension ContactItem where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder actionItems: () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			actionItems: actionItems
        )
    }
}

extension ContactItem where DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder actionItems: () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			actionItems: actionItems
        )
    }
}

extension ContactItem where ActionItems == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			descriptionText: descriptionText,
			detailImage: detailImage,
			actionItems: { EmptyView() }
        )
    }
}

extension ContactItem where Subtitle == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder actionItems: () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			actionItems: actionItems
        )
    }
}

extension ContactItem where Subtitle == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder actionItems: () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			actionItems: actionItems
        )
    }
}

extension ContactItem where Subtitle == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: detailImage,
			actionItems: { EmptyView() }
        )
    }
}

extension ContactItem where DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder actionItems: () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			actionItems: actionItems
        )
    }
}

extension ContactItem where DescriptionText == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder detailImage: () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			actionItems: { EmptyView() }
        )
    }
}

extension ContactItem where DetailImage == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			actionItems: { EmptyView() }
        )
    }
}

extension ContactItem where Subtitle == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder actionItems: () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			actionItems: actionItems
        )
    }
}

extension ContactItem where Subtitle == EmptyView, DescriptionText == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder detailImage: () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			actionItems: { EmptyView() }
        )
    }
}

extension ContactItem where Subtitle == EmptyView, DetailImage == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			actionItems: { EmptyView() }
        )
    }
}

extension ContactItem where DescriptionText == EmptyView, DetailImage == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			actionItems: { EmptyView() }
        )
    }
}

extension ContactItem where Subtitle == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: () -> Title
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			actionItems: { EmptyView() }
        )
    }
}
