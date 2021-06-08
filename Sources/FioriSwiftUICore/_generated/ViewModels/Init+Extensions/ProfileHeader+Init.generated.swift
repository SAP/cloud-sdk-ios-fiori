// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension ProfileHeader where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where DetailImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: detailImage,
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			detailImage: detailImage,
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			detailImage: detailImage,
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where DetailImage == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where DetailImage == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: detailImage,
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where Footnote == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: detailImage,
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where Subtitle == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			detailImage: detailImage,
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, DetailImage == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, Footnote == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, Subtitle == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where DetailImage == EmptyView, Footnote == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where DetailImage == EmptyView, Subtitle == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where Footnote == EmptyView, Subtitle == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: detailImage,
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionItems: @escaping () -> ActionItems
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			actionItems: actionItems
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			actionItems: { EmptyView() }
        )
    }
}

extension ProfileHeader where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, ActionItems == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			actionItems: { EmptyView() }
        )
    }
}
