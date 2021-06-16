// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

@available(iOS 14, *)
public struct SideBar<Subtitle: View, Footer: View, Detail: View> {
    @Environment(\.subtitleModifier) private var subtitleModifier

    let _subtitle: Subtitle
	let _footer: Footer
	let _detail: Detail
	
    private var isModelInit: Bool = false
	private var isSubtitleNil: Bool = false

    public init(
        @ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footer: @escaping () -> Footer,
		@ViewBuilder detail: @escaping () -> Detail
        ) {
            self._subtitle = subtitle()
			self._footer = footer()
			self._detail = detail()
    }

    @ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori.SideBar.subtitle).concat(Fiori.SideBar.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori.SideBar.subtitle))
        }
    }
    var footer: some View {
        _footer
    }
	var detail: some View {
        _detail
    }
	var isSubtitleEmptyView: Bool {
        ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
    }
}

@available(iOS 14, *)
extension SideBar where Subtitle == _ConditionalContent<Text, EmptyView> {

    public init(model: SideBarModel, @ViewBuilder footer: @escaping () -> Footer, @ViewBuilder detail: @escaping () -> Detail) {
        self.init(subtitle: model.subtitle_, footer: footer, detail: detail)
    }

    public init(subtitle: String? = nil, @ViewBuilder footer: @escaping () -> Footer, @ViewBuilder detail: @escaping () -> Detail) {
        self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footer = footer()
		self._detail = detail()

		isModelInit = true
		isSubtitleNil = subtitle == nil ? true : false
    }
}
