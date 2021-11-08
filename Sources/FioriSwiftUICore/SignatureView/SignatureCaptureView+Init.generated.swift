// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension SignatureCaptureView where StartActionView == Action {
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
            startAction: { Action(model: _TapToSignActionDefault()) },
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

public extension SignatureCaptureView where RestartActionView == Action {
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
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: clearAction,
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where CancelActionView == Action {
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
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where ClearActionView == Action {
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
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where SaveActionView == Action {
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
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, RestartActionView == Action {
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
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: clearAction,
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, CancelActionView == Action {
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
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, ClearActionView == Action {
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
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: cancelAction,
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, SaveActionView == Action {
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
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: cancelAction,
            clearAction: clearAction,
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == Action, CancelActionView == Action {
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
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == Action, ClearActionView == Action {
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
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == Action, SaveActionView == Action {
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
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: clearAction,
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where CancelActionView == Action, ClearActionView == Action {
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
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where CancelActionView == Action, SaveActionView == Action {
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
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where ClearActionView == Action, SaveActionView == Action {
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
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, RestartActionView == Action, CancelActionView == Action {
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
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, RestartActionView == Action, ClearActionView == Action {
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
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, RestartActionView == Action, SaveActionView == Action {
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
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: clearAction,
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, CancelActionView == Action, ClearActionView == Action {
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
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, CancelActionView == Action, SaveActionView == Action {
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
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, ClearActionView == Action, SaveActionView == Action {
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
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: cancelAction,
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == Action, CancelActionView == Action, ClearActionView == Action {
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
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == Action, CancelActionView == Action, SaveActionView == Action {
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
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == Action, ClearActionView == Action, SaveActionView == Action {
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
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where CancelActionView == Action, ClearActionView == Action, SaveActionView == Action {
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
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, RestartActionView == Action, CancelActionView == Action, ClearActionView == Action {
    init(
        title: String? = nil,
        @ViewBuilder saveAction: () -> SaveActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: saveAction,
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, RestartActionView == Action, CancelActionView == Action, SaveActionView == Action {
    init(
        title: String? = nil,
        @ViewBuilder clearAction: () -> ClearActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: clearAction,
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, RestartActionView == Action, ClearActionView == Action, SaveActionView == Action {
    init(
        title: String? = nil,
        @ViewBuilder cancelAction: () -> CancelActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: cancelAction,
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, CancelActionView == Action, ClearActionView == Action, SaveActionView == Action {
    init(
        title: String? = nil,
        @ViewBuilder restartAction: () -> RestartActionView,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: restartAction,
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where RestartActionView == Action, CancelActionView == Action, ClearActionView == Action, SaveActionView == Action {
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
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}

public extension SignatureCaptureView where StartActionView == Action, RestartActionView == Action, CancelActionView == Action, ClearActionView == Action, SaveActionView == Action {
    init(
        title: String? = nil,
        signatureImage: UIImage? = nil,
        onSave: ((UIImage) -> Void)? = nil,
        onDelete: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
            startAction: { Action(model: _TapToSignActionDefault()) },
            restartAction: { Action(model: _ReEnterSignatureActionDefault()) },
            cancelAction: { Action(model: _CancelActionDefault()) },
            clearAction: { Action(model: _ClearActionDefault()) },
            saveAction: { Action(model: _SaveActionDefault()) },
            signatureImage: signatureImage,
            onSave: onSave,
            onDelete: onDelete
        )
    }
}
