// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension ObjectItem where ActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@IconBuilder icons: @escaping () -> Icons,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@IconBuilder icons: @escaping () -> Icons
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: icons,
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where ActionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Icons == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			icons: { },
			actionText: actionText
        )
    }
}
