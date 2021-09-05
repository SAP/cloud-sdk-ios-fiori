// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension ObjectHeader where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Footnote == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Tags == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Tags == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where BodyText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Tags == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where Subtitle == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote
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

extension ObjectHeader where Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder substatus: () -> Substatus,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder footnote: () -> Footnote
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

extension ObjectHeader where Subtitle == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags,
		@ViewBuilder bodyText: () -> BodyText
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote
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

extension ObjectHeader where Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder bodyText: () -> BodyText
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

extension ObjectHeader where BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@TagBuilder tags: () -> Tags
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder detailContent: () -> DetailContent
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder detailImage: () -> DetailImage
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder substatus: () -> Substatus
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder status: () -> Status
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText
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

extension ObjectHeader where Subtitle == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@TagBuilder tags: () -> Tags
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

extension ObjectHeader where Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle
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

extension ObjectHeader where Subtitle == EmptyView, Tags == EmptyView, BodyText == EmptyView, Footnote == EmptyView, DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, DetailImage == EmptyView, DetailContent == EmptyView {
    public init(
    @ViewBuilder title: () -> Title
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
			detailContent: { EmptyView() }
        )
    }
}
