// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension ObjectItem where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Status == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Status == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Status == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Status == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@IconBuilder icons: () -> Icons,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder detailImage: () -> DetailImage,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder substatus: () -> Substatus,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView
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
			action: action
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@IconBuilder icons: () -> Icons
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder detailImage: () -> DetailImage
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder substatus: () -> Substatus
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle
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
			action: { EmptyView() }
        )
    }
}

extension ObjectItem where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, Icons == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title
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
			action: { EmptyView() }
        )
    }
}
