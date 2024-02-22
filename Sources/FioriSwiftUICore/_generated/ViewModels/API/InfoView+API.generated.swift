// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct InfoView<Title: View, DescriptionText: View, ProgressIndicatorView: View, ActionView: View, SecondaryActionView: View> {
    @Environment(\.titleModifier) private var titleModifier
    @Environment(\.descriptionTextModifier) private var descriptionTextModifier
    @Environment(\.progressIndicatorModifier) private var progressIndicatorModifier
    @Environment(\.actionModifier) private var actionModifier
    @Environment(\.secondaryActionModifier) private var secondaryActionModifier

    let _title: Title
    let _descriptionText: DescriptionText
    let _progressIndicator: ProgressIndicatorView
    let _action: ActionView
    let _secondaryAction: SecondaryActionView
	
    private var isModelInit: Bool = false
    private var isDescriptionTextNil: Bool = false
    private var isProgressIndicatorNil: Bool = false
    private var isActionNil: Bool = false
    private var isSecondaryActionNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
        @ViewBuilder descriptionText: () -> DescriptionText,
        @ViewBuilder progressIndicator: () -> ProgressIndicatorView,
        @ViewBuilder action: () -> ActionView,
        @ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self._title = title()
        self._descriptionText = descriptionText()
        self._progressIndicator = progressIndicator()
        self._action = action()
        self._secondaryAction = secondaryAction()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.InfoView.title).concat(Fiori.InfoView.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.InfoView.title))
        }
    }

    @ViewBuilder var descriptionText: some View {
        if isModelInit {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.InfoView.descriptionText).concat(Fiori.InfoView.descriptionTextCumulative))
        } else {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori.InfoView.descriptionText))
        }
    }

    @ViewBuilder var progressIndicator: some View {
        if isModelInit {
            _progressIndicator.modifier(progressIndicatorModifier.concat(Fiori.InfoView.progressIndicator).concat(Fiori.InfoView.progressIndicatorCumulative))
        } else {
            _progressIndicator.modifier(progressIndicatorModifier.concat(Fiori.InfoView.progressIndicator))
        }
    }

    @ViewBuilder var action: some View {
        if isModelInit {
            _action.modifier(actionModifier.concat(Fiori.InfoView.action).concat(Fiori.InfoView.actionCumulative))
        } else {
            _action.modifier(actionModifier.concat(Fiori.InfoView.action))
        }
    }

    @ViewBuilder var secondaryAction: some View {
        if isModelInit {
            _secondaryAction.modifier(secondaryActionModifier.concat(Fiori.InfoView.secondaryAction).concat(Fiori.InfoView.secondaryActionCumulative))
        } else {
            _secondaryAction.modifier(secondaryActionModifier.concat(Fiori.InfoView.secondaryAction))
        }
    }
    
    var isDescriptionTextEmptyView: Bool {
        ((self.isModelInit && self.isDescriptionTextNil) || DescriptionText.self == EmptyView.self) ? true : false
    }

    var isProgressIndicatorEmptyView: Bool {
        ((self.isModelInit && self.isProgressIndicatorNil) || ProgressIndicatorView.self == EmptyView.self) ? true : false
    }

    var isActionEmptyView: Bool {
        ((self.isModelInit && self.isActionNil) || ActionView.self == EmptyView.self) ? true : false
    }

    var isSecondaryActionEmptyView: Bool {
        ((self.isModelInit && self.isSecondaryActionNil) || SecondaryActionView.self == EmptyView.self) ? true : false
    }
}

public extension InfoView where Title == Text,
    DescriptionText == _ConditionalContent<Text, EmptyView>,
    ProgressIndicatorView == _ConditionalContent<ProgressIndicator, EmptyView>,
    ActionView == _ConditionalContent<_Action, EmptyView>,
    SecondaryActionView == _ConditionalContent<_Action, EmptyView>
{
    init(model: InfoViewModel) {
        self.init(title: model.title, descriptionText: model.descriptionText, progressIndicator: model.progressIndicator != nil ? ProgressIndicator(model: model.progressIndicator!) : nil, action: model.action != nil ? _Action(model: model.action!) : nil, secondaryAction: model.secondaryAction != nil ? _Action(model: model.secondaryAction!) : nil)
    }

    init(title: String, descriptionText: String? = nil, progressIndicator: ProgressIndicator? = nil, action: _Action? = nil, secondaryAction: _Action? = nil) {
        self._title = Text(title)
        self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
        self._progressIndicator = progressIndicator != nil ? ViewBuilder.buildEither(first: progressIndicator!) : ViewBuilder.buildEither(second: EmptyView())
        self._action = action != nil ? ViewBuilder.buildEither(first: action!) : ViewBuilder.buildEither(second: EmptyView())
        self._secondaryAction = secondaryAction != nil ? ViewBuilder.buildEither(first: secondaryAction!) : ViewBuilder.buildEither(second: EmptyView())

        self.isModelInit = true
        self.isDescriptionTextNil = descriptionText == nil ? true : false
        self.isProgressIndicatorNil = progressIndicator == nil ? true : false
        self.isActionNil = action == nil ? true : false
        self.isSecondaryActionNil = secondaryAction == nil ? true : false
    }
}
