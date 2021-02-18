import SwiftUI

public extension ObjectItem where DescriptionText == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where Footnote == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where Status == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where Substatus == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where Subtitle == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Status == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Substatus == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where Footnote == EmptyView, Status == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where Footnote == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where Status == EmptyView, Substatus == EmptyView {
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
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where Status == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where Substatus == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
            status: { EmptyView() },
            substatus: { EmptyView() },
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}

public extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: detailImage
        )
    }
}

public extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    init(
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
            detailImage: { EmptyView() }
        )
    }
}
