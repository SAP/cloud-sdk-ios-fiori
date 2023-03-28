// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SingleStep<Title: View, Node: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.nodeModifier) private var nodeModifier
	@Environment(\.stepAxis) var stepAxis
	@Environment(\.stepLineColor) var stepLineColor

    let _title: Title
	let _node: Node
	var top: CGFloat = 8
	var bottom: CGFloat = 8
	var horizontalSpacing: CGFloat = 14
	@State var nodeAndLineSize: CGSize = .zero
	var verticalSpacing: CGFloat = 8
	var leading: CGFloat = 8
	var trailing: CGFloat = 8

    private var isModelInit: Bool = false
	private var isTitleNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
		@ViewBuilder node: () -> Node
        ) {
            self._title = title()
			self._node = node()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.SingleStep.title).concat(Fiori.SingleStep.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.SingleStep.title))
        }
    }
	@ViewBuilder var node: some View {
        if isModelInit {
            _node.modifier(nodeModifier.concat(Fiori.SingleStep.node).concat(Fiori.SingleStep.nodeCumulative))
        } else {
            _node.modifier(nodeModifier.concat(Fiori.SingleStep.node))
        }
    }
    
	var isTitleEmptyView: Bool {
        ((isModelInit && isTitleNil) || Title.self == EmptyView.self) ? true : false
    }
}

extension SingleStep where Title == _ConditionalContent<Text, EmptyView>,
		Node == TextOrIconView {

    public init(model: SingleStepModel) {
        self.init(title: model.title, node: model.node)
    }

    public init(title: String? = nil, node: TextOrIcon) {
        self._title = title != nil ? ViewBuilder.buildEither(first: Text(title!)) : ViewBuilder.buildEither(second: EmptyView())
		self._node = TextOrIconView(node: node)

		isModelInit = true
		isTitleNil = title == nil ? true : false
    }
}
