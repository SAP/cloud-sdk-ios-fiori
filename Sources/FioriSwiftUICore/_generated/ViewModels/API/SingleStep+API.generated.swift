// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SingleStep<Name: View, OverText: View> {
    @Environment(\.nameModifier) private var nameModifier
	@Environment(\.overTextModifier) private var overTextModifier
	@Environment(\.stepAxis) var stepAxis
	@Environment(\.stepLineColor) var stepLineColor

    let _name: Name
	let _overText: OverText
	var bottom: CGFloat = 8
	@State var nodeAndLineSize: CGSize = .zero
	var top: CGFloat = 8
	var leading: CGFloat = 8
	var trailing: CGFloat = 8
	var horizontalSpacing: CGFloat = 14
	var verticalSpacing: CGFloat = 8

    private var isModelInit: Bool = false
	private var isNameNil: Bool = false
	private var isOverTextNil: Bool = false

    public init(
        @ViewBuilder name: () -> Name,
		@ViewBuilder overText: () -> OverText
        ) {
            self._name = name()
			self._overText = overText()
    }

    @ViewBuilder var name: some View {
        if isModelInit {
            _name.modifier(nameModifier.concat(Fiori.SingleStep.name).concat(Fiori.SingleStep.nameCumulative))
        } else {
            _name.modifier(nameModifier.concat(Fiori.SingleStep.name))
        }
    }
	@ViewBuilder var overText: some View {
        if isModelInit {
            _overText.modifier(overTextModifier.concat(Fiori.SingleStep.overText).concat(Fiori.SingleStep.overTextCumulative))
        } else {
            _overText.modifier(overTextModifier.concat(Fiori.SingleStep.overText))
        }
    }
    
	var isNameEmptyView: Bool {
        ((isModelInit && isNameNil) || Name.self == EmptyView.self) ? true : false
    }

	var isOverTextEmptyView: Bool {
        ((isModelInit && isOverTextNil) || OverText.self == EmptyView.self) ? true : false
    }
}

extension SingleStep where Name == _ConditionalContent<Text, EmptyView>,
		OverText == _ConditionalContent<Text, EmptyView> {

    public init(model: SingleStepModel) {
        self.init(name: model.name, overText: model.overText)
    }

    public init(name: String? = nil, overText: String? = nil) {
        self._name = name != nil ? ViewBuilder.buildEither(first: Text(name!)) : ViewBuilder.buildEither(second: EmptyView())
		self._overText = overText != nil ? ViewBuilder.buildEither(first: Text(overText!)) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isNameNil = name == nil ? true : false
		isOverTextNil = overText == nil ? true : false
    }
}
