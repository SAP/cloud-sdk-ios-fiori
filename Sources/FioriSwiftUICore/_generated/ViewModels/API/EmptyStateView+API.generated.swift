// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct EmptyStateView<Title: View, DescriptionText: View, DetailImage: View, ActionView: View> {
    @Environment(\.titleModifier) private var titleModifier
    @Environment(\.descriptionTextModifier) private var descriptionTextModifier
    @Environment(\.detailImageModifier) private var detailImageModifier
    @Environment(\.actionModifier) private var actionModifier

    let _title: Title
    let _descriptionText: DescriptionText
    let _detailImage: DetailImage
    let _action: ActionView
	
    private var isModelInit: Bool = false
    private var isDescriptionTextNil: Bool = false
    private var isDetailImageNil: Bool = false
    private var isActionNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
        @ViewBuilder descriptionText: () -> DescriptionText,
        @ViewBuilder detailImage: () -> DetailImage,
        @ViewBuilder action: () -> ActionView
    ) {
        self._title = title()
        self._descriptionText = descriptionText()
        self._detailImage = detailImage()
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

    @ViewBuilder var detailImage: some View {
        if isModelInit {
            _detailImage.modifier(detailImageModifier.concat(Fiori.EmptyStateView.detailImage).concat(Fiori.EmptyStateView.detailImageCumulative))
        } else {
            _detailImage.modifier(detailImageModifier.concat(Fiori.EmptyStateView.detailImage))
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
        ((self.isModelInit && self.isDescriptionTextNil) || DescriptionText.self == EmptyView.self) ? true : false
    }

    var isDetailImageEmptyView: Bool {
        ((self.isModelInit && self.isDetailImageNil) || DetailImage.self == EmptyView.self) ? true : false
    }

    var isActionEmptyView: Bool {
        ((self.isModelInit && self.isActionNil) || ActionView.self == EmptyView.self) ? true : false
    }
}

public extension EmptyStateView where Title == Text,
    DescriptionText == _ConditionalContent<Text, EmptyView>,
    DetailImage == _ConditionalContent<Image, EmptyView>,
    ActionView == _ConditionalContent<_Action, EmptyView>
{
    init(model: EmptyStateViewModel) {
        self.init(title: model.title, descriptionText: model.descriptionText, detailImage: model.detailImage, action: model.action != nil ? _Action(model: model.action!) : nil)
    }

    init(title: String, descriptionText: String? = nil, detailImage: Image? = nil, action: _Action? = nil) {
        self._title = Text(title)
        self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
        self._detailImage = detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView())
        self._action = action != nil ? ViewBuilder.buildEither(first: action!) : ViewBuilder.buildEither(second: EmptyView())

        self.isModelInit = true
        self.isDescriptionTextNil = descriptionText == nil ? true : false
        self.isDetailImageNil = detailImage == nil ? true : false
        self.isActionNil = action == nil ? true : false
    }
}
