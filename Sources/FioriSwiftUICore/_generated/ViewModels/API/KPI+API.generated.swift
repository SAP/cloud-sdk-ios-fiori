import SwiftUI

public struct KPI<Title: View, Icon: View> {
    @Environment(\.titleModifier) private var titleModifier
    @Environment(\.iconModifier) private var iconModifier

    private let _title: Title
    private let _icon: Icon
	
    public init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder icon: @escaping () -> Icon
    ) {
        self._title = title()
        self._icon = icon()
    }

    var title: some View {
        _title.modifier(titleModifier.concat(Fiori.KPI.title))
    }

    var icon: some View {
        _icon.modifier(iconModifier.concat(Fiori.KPI.icon))
    }
}

public extension KPI where Title == Text,
    Icon == _ConditionalContent<Image, EmptyView>
{
    init(model: KPIModel) {
        self.init(title: model.title_, icon: model.icon_)
    }

    init(title: String, icon: Image? = nil) {
        self._title = Text(title)
        self._icon = icon != nil ? ViewBuilder.buildEither(first: icon!) : ViewBuilder.buildEither(second: EmptyView())
    }
}
