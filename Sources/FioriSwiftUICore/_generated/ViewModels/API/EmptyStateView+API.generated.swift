// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct EmptyStateView<Title: View, DescriptionText: View, ActionView: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.descriptionTextModifier) private var descriptionTextModifier
	@Environment(\.actionModifier) private var actionModifier

    let _title: Title
	let _descriptionText: DescriptionText
	let _image: Image?
	let _action: ActionView
	

    private var isModelInit: Bool = false
	private var isDescriptionTextNil: Bool = false
	private var isImageNil: Bool = false
	private var isActionNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		image: Image? = nil,
		@ViewBuilder action: () -> ActionView
        ) {
            self._title = title()
			self._descriptionText = descriptionText()
			self._image = image
			self._action = action()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.EmptyStateView.title).concat(Fiori.EmptyStateView.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.EmptyStateView.title))
        }
    }
	@ViewBuilder var descriptionText: some View {
        if isModelInit {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.EmptyStateView.descriptionText).concat(Fiori.EmptyStateView.descriptionTextCumulative))
        } else {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.EmptyStateView.descriptionText))
        }
    }
	@ViewBuilder var action: some View {
        if isModelInit {
            _action.modifier(actionModifier.concat(Fiori.EmptyStateView.action).concat(Fiori.EmptyStateView.actionCumulative))
        } else {
            _action.modifier(actionModifier.concat(Fiori.EmptyStateView.action))
        }
    }
    
	var isDescriptionTextEmptyView: Bool {
        ((isModelInit && isDescriptionTextNil) || DescriptionText.self == EmptyView.self) ? true : false
    }

	var isActionEmptyView: Bool {
        ((isModelInit && isActionNil) || ActionView.self == EmptyView.self) ? true : false
    }
}

extension EmptyStateView where Title == Text,
		DescriptionText == _ConditionalContent<Text, EmptyView>,
		ActionView == _ConditionalContent<Action, EmptyView> {

    public init(model: EmptyStateViewModel) {
        self.init(title: model.title, descriptionText: model.descriptionText, image: model.image, action: model.action != nil ? Action(model: model.action!) : nil)
    }

    public init(title: String, descriptionText: String? = nil, image: Image? = nil, action: Action? = nil) {
        self._title = Text(title)
		self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._image = image
		self._action = action != nil ? ViewBuilder.buildEither(first: action!) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isDescriptionTextNil = descriptionText == nil ? true : false
		isImageNil = image == nil ? true : false
		isActionNil = action == nil ? true : false
    }
}
