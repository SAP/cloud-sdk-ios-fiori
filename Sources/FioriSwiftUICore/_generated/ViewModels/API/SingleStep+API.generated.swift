// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SingleStep<Name: View, Node: View> {
    @Environment(\.nameModifier) private var nameModifier
	@Environment(\.nodeModifier) private var nodeModifier
	@Environment(\.stepAxis) var stepAxis
	@Environment(\.stepLineColor) var stepLineColor

    let _name: Name
	let _node: Node
	var leading: CGFloat = 8
	var bottom: CGFloat = 8
	var verticalSpacing: CGFloat = 8
	var horizontalSpacing: CGFloat = 14
	@State var nodeAndLineSize: CGSize = .zero
	var trailing: CGFloat = 8
	var top: CGFloat = 8

    private var isModelInit: Bool = false
	private var isNameNil: Bool = false
	private var isNodeNil: Bool = false

    public init(
        @ViewBuilder name: () -> Name,
		@ViewBuilder node: () -> Node
        ) {
            self._name = name()
			self._node = node()
    }

    @ViewBuilder var name: some View {
        if isModelInit {
            _name.modifier(nameModifier.concat(Fiori.SingleStep.name).concat(Fiori.SingleStep.nameCumulative))
        } else {
            _name.modifier(nameModifier.concat(Fiori.SingleStep.name))
        }
    }
	@ViewBuilder var node: some View {
        if isModelInit {
            _node.modifier(nodeModifier.concat(Fiori.SingleStep.node).concat(Fiori.SingleStep.nodeCumulative))
        } else {
            _node.modifier(nodeModifier.concat(Fiori.SingleStep.node))
        }
    }
    
	var isNameEmptyView: Bool {
        ((isModelInit && isNameNil) || Name.self == EmptyView.self) ? true : false
    }

	var isNodeEmptyView: Bool {
        ((isModelInit && isNodeNil) || Node.self == EmptyView.self) ? true : false
    }
}

extension SingleStep where Name == _ConditionalContent<Text, EmptyView>,
		Node == _ConditionalContent<Text, EmptyView> {

    public init(model: SingleStepModel) {
        self.init(name: model.name, node: model.node)
    }

    public init(name: String? = nil, node: String? = nil) {
        self._name = name != nil ? ViewBuilder.buildEither(first: Text(name!)) : ViewBuilder.buildEither(second: EmptyView())
		self._node = node != nil ? ViewBuilder.buildEither(first: Text(node!)) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isNameNil = name == nil ? true : false
		isNodeNil = node == nil ? true : false
    }
}
