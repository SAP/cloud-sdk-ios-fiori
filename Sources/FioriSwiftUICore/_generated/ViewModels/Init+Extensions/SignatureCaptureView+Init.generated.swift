// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension SignatureCaptureView where StartActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder restartAction: () -> RestartActionView,
        @ViewBuilder cancelAction: () -> CancelActionView,
        @ViewBuilder clearAction: () -> ClearActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: cancelAction,
            clearAction: clearAction,
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder cancelAction: () -> CancelActionView,
        @ViewBuilder clearAction: () -> ClearActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: clearAction,
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where CancelActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder restartAction: () -> RestartActionView,
        @ViewBuilder clearAction: () -> ClearActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: restartAction,
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where ClearActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder restartAction: () -> RestartActionView,
        @ViewBuilder cancelAction: () -> CancelActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: restartAction,
            cancelAction: cancelAction,
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder restartAction: () -> RestartActionView,
        @ViewBuilder cancelAction: () -> CancelActionView,
        @ViewBuilder clearAction: () -> ClearActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: restartAction,
            cancelAction: cancelAction,
            clearAction: clearAction,
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, RestartActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder cancelAction: () -> CancelActionView,
        @ViewBuilder clearAction: () -> ClearActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: clearAction,
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, CancelActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder restartAction: () -> RestartActionView,
        @ViewBuilder clearAction: () -> ClearActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, ClearActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder restartAction: () -> RestartActionView,
        @ViewBuilder cancelAction: () -> CancelActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: cancelAction,
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder restartAction: () -> RestartActionView,
        @ViewBuilder cancelAction: () -> CancelActionView,
        @ViewBuilder clearAction: () -> ClearActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: cancelAction,
            clearAction: clearAction,
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == _Action, CancelActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder clearAction: () -> ClearActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == _Action, ClearActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder cancelAction: () -> CancelActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder cancelAction: () -> CancelActionView,
        @ViewBuilder clearAction: () -> ClearActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: clearAction,
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where CancelActionView == _Action, ClearActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder restartAction: () -> RestartActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: restartAction,
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where CancelActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder restartAction: () -> RestartActionView,
        @ViewBuilder clearAction: () -> ClearActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: restartAction,
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where ClearActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder restartAction: () -> RestartActionView,
        @ViewBuilder cancelAction: () -> CancelActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: restartAction,
            cancelAction: cancelAction,
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, RestartActionView == _Action, CancelActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder clearAction: () -> ClearActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, RestartActionView == _Action, ClearActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder cancelAction: () -> CancelActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, RestartActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder cancelAction: () -> CancelActionView,
        @ViewBuilder clearAction: () -> ClearActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: clearAction,
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, CancelActionView == _Action, ClearActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder restartAction: () -> RestartActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, CancelActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder restartAction: () -> RestartActionView,
        @ViewBuilder clearAction: () -> ClearActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, ClearActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder restartAction: () -> RestartActionView,
        @ViewBuilder cancelAction: () -> CancelActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: cancelAction,
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == _Action, CancelActionView == _Action, ClearActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == _Action, CancelActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder clearAction: () -> ClearActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == _Action, ClearActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder cancelAction: () -> CancelActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where CancelActionView == _Action, ClearActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        @ViewBuilder restartAction: () -> RestartActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: restartAction,
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, RestartActionView == _Action, CancelActionView == _Action, ClearActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, RestartActionView == _Action, CancelActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder clearAction: () -> ClearActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, RestartActionView == _Action, ClearActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder cancelAction: () -> CancelActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, CancelActionView == _Action, ClearActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder restartAction: () -> RestartActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == _Action, CancelActionView == _Action, ClearActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        @ViewBuilder startAction: () -> StartActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: startAction,
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == _Action, RestartActionView == _Action, CancelActionView == _Action, ClearActionView == _Action, SaveActionView == _Action {
    init(
        title: String? = nil,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { _Action(model: _TapToSignActionDefault()) },
            restartAction: { _Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { _Action(model: _CancelActionDefault()) },
            clearAction: { _Action(model: _ClearActionDefault()) },
            saveAction: { _Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}
