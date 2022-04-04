// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI
import Combine

public struct SignatureCaptureView<StartActionView: View, RestartActionView: View, CancelActionView: View, ClearActionView: View, SaveActionView: View> {
    @Environment(\.startActionModifier) private var startActionModifier
	@Environment(\.restartActionModifier) private var restartActionModifier
	@Environment(\.cancelActionModifier) private var cancelActionModifier
	@Environment(\.clearActionModifier) private var clearActionModifier
	@Environment(\.saveActionModifier) private var saveActionModifier

    let _title: String?
	let _startAction: StartActionView
	let _restartAction: RestartActionView
	let _cancelAction: CancelActionView
	let _clearAction: ClearActionView
	let _saveAction: SaveActionView
	let _signatureImage: UIImage?
	let _onSave: ((UIImage) -> Void)?
	let _onDelete: (() -> Void)?
	var timestampFormatter: DateFormatter?
	@State var currentDrawing = Drawing()
	var titleColor = Color.preferredColor(.primaryLabel)
	var hidesXmark = false
	@State var fullSignatureImage: UIImage?
	var strokeWidth: CGFloat = 3.0
	public private(set) var _heightDidChangePublisher = CurrentValueSubject<CGFloat, Never>(0)
	var addsTimestampInImage: Bool = false
	var strokeColor = Color.preferredColor(.primaryLabel)
	var drawingViewBackgroundColor = Color.preferredColor(.primaryBackground)
	var watermarkTextFont: UIFont = .preferredFont(forTextStyle: .caption1)
	var cropsImage = false
	var _drawingViewMaxHeight: CGFloat?
	var watermarkTextColor: Color = .preferredColor(.tertiaryLabel)
	var signatureLineColor = Color.preferredColor(.quarternaryLabel)
	var appliesTintColorToImage = true
	@State var isSaved = false
	let _drawingViewMinHeight: CGFloat = 256
	@State var isReenterTapped = false
	var watermarkTextAlignment: NSTextAlignment = .natural
	var watermarkText: String?
	var titleFont = Font.fiori(forTextStyle: .subheadline).weight(.semibold)
	@State var isEditing = false
	var hidesSignatureLine = false
	var xmarkColor = Color.preferredColor(.quarternaryLabel)
	@State var drawings = [Drawing]()

    private var isModelInit: Bool = false
	private var isTitleNil: Bool = false
	private var isStartActionNil: Bool = false
	private var isRestartActionNil: Bool = false
	private var isCancelActionNil: Bool = false
	private var isClearActionNil: Bool = false
	private var isSaveActionNil: Bool = false
	private var isSignatureImageNil: Bool = false
	private var isOnSaveNil: Bool = false
	private var isOnDeleteNil: Bool = false

    public init(
        title: String? = nil,
		@ViewBuilder startAction: () -> StartActionView,
		@ViewBuilder restartAction: () -> RestartActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder clearAction: () -> ClearActionView,
		@ViewBuilder saveAction: () -> SaveActionView,
		signatureImage: UIImage? = nil,
		onSave: ((UIImage) -> Void)? = nil,
		onDelete: (() -> Void)? = nil
        ) {
            self._title = title
			self._startAction = startAction()
			self._restartAction = restartAction()
			self._cancelAction = cancelAction()
			self._clearAction = clearAction()
			self._saveAction = saveAction()
			self._signatureImage = signatureImage
			self._onSave = onSave
			self._onDelete = onDelete
    }

    @ViewBuilder var startAction: some View {
        if isModelInit {
            _startAction.modifier(startActionModifier.concat(Fiori.SignatureCaptureView.startAction).concat(Fiori.SignatureCaptureView.startActionCumulative))
        } else {
            _startAction.modifier(startActionModifier.concat(Fiori.SignatureCaptureView.startAction))
        }
    }
	@ViewBuilder var restartAction: some View {
        if isModelInit {
            _restartAction.modifier(restartActionModifier.concat(Fiori.SignatureCaptureView.restartAction).concat(Fiori.SignatureCaptureView.restartActionCumulative))
        } else {
            _restartAction.modifier(restartActionModifier.concat(Fiori.SignatureCaptureView.restartAction))
        }
    }
	@ViewBuilder var cancelAction: some View {
        if isModelInit {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori.SignatureCaptureView.cancelAction).concat(Fiori.SignatureCaptureView.cancelActionCumulative))
        } else {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori.SignatureCaptureView.cancelAction))
        }
    }
	@ViewBuilder var clearAction: some View {
        if isModelInit {
            _clearAction.modifier(clearActionModifier.concat(Fiori.SignatureCaptureView.clearAction).concat(Fiori.SignatureCaptureView.clearActionCumulative))
        } else {
            _clearAction.modifier(clearActionModifier.concat(Fiori.SignatureCaptureView.clearAction))
        }
    }
	@ViewBuilder var saveAction: some View {
        if isModelInit {
            _saveAction.modifier(saveActionModifier.concat(Fiori.SignatureCaptureView.saveAction).concat(Fiori.SignatureCaptureView.saveActionCumulative))
        } else {
            _saveAction.modifier(saveActionModifier.concat(Fiori.SignatureCaptureView.saveAction))
        }
    }
    
	var isStartActionEmptyView: Bool {
        ((isModelInit && isStartActionNil) || StartActionView.self == EmptyView.self) ? true : false
    }

	var isRestartActionEmptyView: Bool {
        ((isModelInit && isRestartActionNil) || RestartActionView.self == EmptyView.self) ? true : false
    }

	var isCancelActionEmptyView: Bool {
        ((isModelInit && isCancelActionNil) || CancelActionView.self == EmptyView.self) ? true : false
    }

	var isClearActionEmptyView: Bool {
        ((isModelInit && isClearActionNil) || ClearActionView.self == EmptyView.self) ? true : false
    }

	var isSaveActionEmptyView: Bool {
        ((isModelInit && isSaveActionNil) || SaveActionView.self == EmptyView.self) ? true : false
    }
}

extension SignatureCaptureView where StartActionView == _ConditionalContent<Action, EmptyView>,
		RestartActionView == _ConditionalContent<Action, EmptyView>,
		CancelActionView == _ConditionalContent<Action, EmptyView>,
		ClearActionView == _ConditionalContent<Action, EmptyView>,
		SaveActionView == _ConditionalContent<Action, EmptyView> {

    public init(model: SignatureCaptureViewModel) {
        self.init(title: model.title, startAction: model.startAction != nil ? Action(model: model.startAction!) : nil, restartAction: model.restartAction != nil ? Action(model: model.restartAction!) : nil, cancelAction: model.cancelAction != nil ? Action(model: model.cancelAction!) : nil, clearAction: model.clearAction != nil ? Action(model: model.clearAction!) : nil, saveAction: model.saveAction != nil ? Action(model: model.saveAction!) : nil, signatureImage: model.signatureImage, onSave: model.onSave, onDelete: model.onDelete)
    }

    public init(title: String? = nil, startAction: Action? = Action(model: _TapToSignActionDefault()), restartAction: Action? = Action(model: _ReEnterSignatureActionDefault()), cancelAction: Action? = Action(model: _CancelActionDefault()), clearAction: Action? = Action(model: _ClearActionDefault()), saveAction: Action? = Action(model: _SaveActionDefault()), signatureImage: UIImage? = nil, onSave: ((UIImage) -> Void)? = nil, onDelete: (() -> Void)? = nil) {
        self._title = title
		self._startAction = startAction != nil ? ViewBuilder.buildEither(first: startAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._restartAction = restartAction != nil ? ViewBuilder.buildEither(first: restartAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._cancelAction = cancelAction != nil ? ViewBuilder.buildEither(first: cancelAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._clearAction = clearAction != nil ? ViewBuilder.buildEither(first: clearAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._saveAction = saveAction != nil ? ViewBuilder.buildEither(first: saveAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._signatureImage = signatureImage
		self._onSave = onSave
		self._onDelete = onDelete

		isModelInit = true
		isTitleNil = title == nil ? true : false
		isStartActionNil = startAction == nil ? true : false
		isRestartActionNil = restartAction == nil ? true : false
		isCancelActionNil = cancelAction == nil ? true : false
		isClearActionNil = clearAction == nil ? true : false
		isSaveActionNil = saveAction == nil ? true : false
		isSignatureImageNil = signatureImage == nil ? true : false
		isOnSaveNil = onSave == nil ? true : false
		isOnDeleteNil = onDelete == nil ? true : false
    }
}
