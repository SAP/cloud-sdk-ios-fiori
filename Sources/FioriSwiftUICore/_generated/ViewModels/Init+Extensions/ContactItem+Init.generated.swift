// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension ContactItem where ActionItems == EmptyView {
    init(
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

public extension ContactItem where DescriptionText == EmptyView {
    init(
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

public extension ContactItem where DetailImage == EmptyView {
    init(
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

public extension ContactItem where Footnote == EmptyView {
    init(
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

public extension ContactItem where Subtitle == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, DescriptionText == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, DetailImage == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, Footnote == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ContactItem where DescriptionText == EmptyView, DetailImage == EmptyView {
    init(
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

public extension ContactItem where DescriptionText == EmptyView, Footnote == EmptyView {
    init(
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

public extension ContactItem where DescriptionText == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ContactItem where DetailImage == EmptyView, Footnote == EmptyView {
    init(
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

public extension ContactItem where DetailImage == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ContactItem where Footnote == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, DescriptionText == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ContactItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    init(
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

public extension ContactItem where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ContactItem where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ContactItem where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ContactItem where ActionItems == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ContactItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    init(
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
