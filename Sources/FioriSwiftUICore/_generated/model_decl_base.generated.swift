// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT




// sourcery: file:ViewModels/Init+Extensions/ChartFloorplan+Init.generated.swift
import SwiftUI

extension ChartFloorplan where CategoryAxisTitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: status,
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: { EmptyView() },
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}

extension ChartFloorplan where Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: status,
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}

extension ChartFloorplan where ValueAxisTitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: status,
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}

extension ChartFloorplan where CategoryAxisTitle == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: { EmptyView() },
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where CategoryAxisTitle == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: status,
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where CategoryAxisTitle == EmptyView, ValueAxisTitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: status,
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: { EmptyView() },
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}

extension ChartFloorplan where Status == EmptyView, ValueAxisTitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: { EmptyView() },
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}

extension ChartFloorplan where Subtitle == EmptyView, ValueAxisTitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: status,
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}

extension ChartFloorplan where CategoryAxisTitle == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: { EmptyView() },
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where CategoryAxisTitle == EmptyView, Status == EmptyView, ValueAxisTitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: { EmptyView() },
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where CategoryAxisTitle == EmptyView, Subtitle == EmptyView, ValueAxisTitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: status,
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where Status == EmptyView, Subtitle == EmptyView, ValueAxisTitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: { EmptyView() },
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}

// sourcery:end



// sourcery: file:ViewModels/Init+Extensions/CollectionItem+Init.generated.swift
import SwiftUI

extension CollectionItem where DetailImage == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
        ) {
        self.init(
            detailImage: { EmptyView() },
			title: title,
			subtitle: subtitle
        )
    }
}

extension CollectionItem where Subtitle == EmptyView {
    public init(
        @ViewBuilder detailImage: @escaping () -> DetailImage,
		@ViewBuilder title: @escaping () -> Title
        ) {
        self.init(
            detailImage: detailImage,
			title: title,
			subtitle: { EmptyView() }
        )
    }
}

// sourcery:end



// sourcery: file:ViewModels/Init+Extensions/ContactItem+Init.generated.swift
import SwiftUI

extension ContactItem where DescriptionText == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ContactItem where DetailImage == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ContactItem where Footnote == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ContactItem where Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ContactItem where DescriptionText == EmptyView, DetailImage == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ContactItem where DescriptionText == EmptyView, Footnote == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ContactItem where DescriptionText == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ContactItem where DetailImage == EmptyView, Footnote == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ContactItem where DetailImage == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ContactItem where Footnote == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ContactItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() }
        )
    }
}

extension ContactItem where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() }
        )
    }
}

extension ContactItem where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: detailImage
        )
    }
}

extension ContactItem where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: { EmptyView() }
        )
    }
}

// sourcery:end



// sourcery: file:ViewModels/Init+Extensions/HeaderChart+Init.generated.swift
import SwiftUI

extension HeaderChart where Kpi == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trend: @escaping () -> Trend
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: trend,
			kpi: { EmptyView() }
        )
    }
}

extension HeaderChart where Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder kpi: @escaping () -> Kpi
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: trend,
			kpi: kpi
        )
    }
}

extension HeaderChart where Trend == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder kpi: @escaping () -> Kpi
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: { EmptyView() },
			kpi: kpi
        )
    }
}

extension HeaderChart where Kpi == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trend: @escaping () -> Trend
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: trend,
			kpi: { EmptyView() }
        )
    }
}

extension HeaderChart where Kpi == EmptyView, Trend == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: { EmptyView() },
			kpi: { EmptyView() }
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder kpi: @escaping () -> Kpi
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: { EmptyView() },
			kpi: kpi
        )
    }
}

// sourcery:end



// sourcery: file:ViewModels/Init+Extensions/KPIAnnotated+Init.generated.swift
import SwiftUI

extension KPIAnnotated where Icon == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			icon: { EmptyView() }
        )
    }
}

extension KPIAnnotated where Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder icon: @escaping () -> Icon
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			icon: icon
        )
    }
}

// sourcery:end



// sourcery: file:ViewModels/Init+Extensions/KPI+Init.generated.swift
import SwiftUI

// sourcery:end



// sourcery: file:ViewModels/Init+Extensions/KeyValueItem+Init.generated.swift
import SwiftUI

// sourcery:end



// sourcery: file:ViewModels/Init+Extensions/ObjectHeader+Init.generated.swift
import SwiftUI

extension ObjectHeader where DescriptionText == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where Status == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectHeader where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectHeader where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

// sourcery:end



// sourcery: file:ViewModels/Init+Extensions/ObjectItem+Init.generated.swift
import SwiftUI

extension ObjectItem where DescriptionText == EmptyView {
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
			detailImage: detailImage
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

extension ObjectItem where Footnote == EmptyView {
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
			detailImage: detailImage
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

extension ObjectItem where Substatus == EmptyView {
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
			detailImage: detailImage
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

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Status == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, DetailImage == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ObjectItem where DescriptionText == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ObjectItem where DetailImage == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

// sourcery:end



// sourcery: file:ViewModels/Init+Extensions/ProfileHeader+Init.generated.swift
import SwiftUI

extension ProfileHeader where DescriptionText == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ProfileHeader where DetailImage == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ProfileHeader where Footnote == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ProfileHeader where Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, DetailImage == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, Footnote == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ProfileHeader where DetailImage == EmptyView, Footnote == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ProfileHeader where DetailImage == EmptyView, Subtitle == EmptyView {
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
			detailImage: { EmptyView() }
        )
    }
}

extension ProfileHeader where Footnote == EmptyView, Subtitle == EmptyView {
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
			detailImage: detailImage
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Footnote == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() }
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, DetailImage == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() }
        )
    }
}

extension ProfileHeader where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detailImage: @escaping () -> DetailImage
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: { EmptyView() },
			detailImage: detailImage
        )
    }
}

extension ProfileHeader where DetailImage == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			descriptionText: descriptionText,
			detailImage: { EmptyView() }
        )
    }
}

// sourcery:end



// sourcery: file:ViewModels/Init+Extensions/SectionHeader+Init.generated.swift
import SwiftUI

// sourcery:end



// sourcery: file:ViewModels/Init+Extensions/TimelineGridItem+Init.generated.swift
import SwiftUI

extension TimelineGridItem where Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			timestamp: timestamp,
			status: { EmptyView() }
        )
    }
}

extension TimelineGridItem where Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			timestamp: { EmptyView() },
			status: status
        )
    }
}

// sourcery:end



// sourcery: file:ViewModels/Init+Extensions/TimelineItem+Init.generated.swift
import SwiftUI

extension TimelineItem where Attribute == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Timestamp == EmptyView {
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
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Timestamp == EmptyView {
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
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Timestamp == EmptyView {
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
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
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
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
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
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder timestamp: @escaping () -> Timestamp,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder attribute: @escaping () -> Attribute
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder attribute: @escaping () -> Attribute
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: timestamp,
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
        ) {
        self.init(
            title: title,
			subtitle: subtitle,
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder substatus: @escaping () -> Substatus
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: substatus
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: status,
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryAttribute == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryTimestamp: @escaping () -> SecondaryTimestamp
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: secondaryTimestamp,
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, Footnote == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryAttribute: @escaping () -> SecondaryAttribute
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: { EmptyView() },
			secondaryAttribute: secondaryAttribute,
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Attribute == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: footnote,
			attribute: { EmptyView() },
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

extension TimelineItem where Footnote == EmptyView, SecondaryAttribute == EmptyView, SecondaryTimestamp == EmptyView, Status == EmptyView, Substatus == EmptyView, Subtitle == EmptyView, Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder attribute: @escaping () -> Attribute
        ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			attribute: attribute,
			secondaryAttribute: { EmptyView() },
			timestamp: { EmptyView() },
			secondaryTimestamp: { EmptyView() },
			status: { EmptyView() },
			substatus: { EmptyView() }
        )
    }
}

// sourcery:end
