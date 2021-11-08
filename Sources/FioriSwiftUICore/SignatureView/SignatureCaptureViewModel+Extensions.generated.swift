// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension SignatureCaptureViewModel {
    var title: String? {
        nil
    }

    var startAction: ActionModel? {
        _TapToSignActionDefault()
    }

    var restartAction: ActionModel? {
        _ReEnterSignatureActionDefault()
    }

    var cancelAction: ActionModel? {
        _CancelActionDefault()
    }

    var clearAction: ActionModel? {
        _ClearActionDefault()
    }

    var saveAction: ActionModel? {
        _SaveActionDefault()
    }

    var signatureImage: UIImage? {
        nil
    }

    var onSave: ((UIImage) -> Void)? {
        nil
    }

    var onDelete: (() -> Void)? {
        nil
    }
}
