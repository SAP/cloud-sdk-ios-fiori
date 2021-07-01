// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension ContactItem where ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
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

extension ContactItem where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionItems: @escaping () -> ActionItems
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
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionItems: @escaping () -> ActionItems
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

extension ContactItem where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionItems: @escaping () -> ActionItems
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

extension ContactItem where ActionItems == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder detailImage: @escaping () -> DetailImage
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

extension ContactItem where ActionItems == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
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

extension ContactItem where ActionItems == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
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
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder actionItems: @escaping () -> ActionItems
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

extension ContactItem where DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionItems: @escaping () -> ActionItems
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

extension ContactItem where DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionItems: @escaping () -> ActionItems
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

extension ContactItem where ActionItems == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
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

extension ContactItem where ActionItems == EmptyView, DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detailImage: @escaping () -> DetailImage
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

extension ContactItem where ActionItems == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
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

extension ContactItem where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionItems: @escaping () -> ActionItems
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
