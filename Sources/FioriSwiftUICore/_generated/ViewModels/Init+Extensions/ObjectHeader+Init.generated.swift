// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension ObjectHeader where BodyText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
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
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@TagBuilder tags: @escaping () -> Tags
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder substatus: @escaping () -> Substatus,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags,
		@ViewBuilder bodyText: @escaping () -> BodyText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder bodyText: @escaping () -> BodyText
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detailContent: @escaping () -> DetailContent
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: detailContent
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@TagBuilder tags: @escaping () -> Tags
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: tags,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder substatus: @escaping () -> Substatus
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus,
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: status,
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detailImage: @escaping () -> DetailImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: detailImage,
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			tags: { },
			bodyText: bodyText,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() },
			detailImage: { EmptyView() },
			detailContent: { EmptyView() }
        )
    }
}
