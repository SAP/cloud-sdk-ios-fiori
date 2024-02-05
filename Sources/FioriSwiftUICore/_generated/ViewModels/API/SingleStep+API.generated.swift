// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SingleStep<Title: View, Node: View, Substeps: IndexedViewContainer> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.nodeModifier) private var nodeModifier
	@Environment(\.stepStyle) var stepStyle
	@Environment(\.currentStepId) var currentStepId
	@Environment(\.stepAxis) var stepAxis
	@Environment(\.stepLineModifier) var stepLineModifier

    var _id: String
	var _title: Title
	var _node: Node
	var _substeps: Substeps
	var state: StepProgressIndicatorState?
	var horizontalSpacing: CGFloat = 8
	var lineSize: CGSize? = nil
	var trailing: CGFloat = 8
	var leading: CGFloat = 8
	var top: CGFloat = 8
	var verticalSpacing: CGFloat = 8
	var isLastStep: Bool = false
	var bottom: CGFloat = 8

    private var isModelInit: Bool = false
	private var isTitleNil: Bool = false

    public init(
        id: String = UUID().uuidString,
		@ViewBuilder title: () -> Title,
		@ViewBuilder node: () -> Node,
		@IndexedViewBuilder substeps: () -> Substeps
        ) {
            self._id = id
			self._title = title()
			self._node = node()
			self._substeps = substeps()
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
	var substeps: Substeps {
        _substeps
    }
    
	var isTitleEmptyView: Bool {
        ((isModelInit && isTitleNil) || Title.self == EmptyView.self) ? true : false
    }
}

extension SingleStep where Title == _ConditionalContent<Text, EmptyView>,
		Node == TextOrIconView,
		Substeps == _StepsContainer {

    public init(model: SingleStepModel) {
        self.init(id: model.id, title: model.title, node: model.node, substeps: model.substeps)
    }

    public init(id: String = UUID().uuidString, title: String? = nil, node: TextOrIcon, substeps: [SingleStepModel] = []) {
        self._id = id
		self._title = title != nil ? ViewBuilder.buildEither(first: Text(title!)) : ViewBuilder.buildEither(second: EmptyView())
		self._node = TextOrIconView(node: node)
		self._substeps = _StepsContainer(substeps: substeps)

		isModelInit = true
		isTitleNil = title == nil ? true : false
    }
}
