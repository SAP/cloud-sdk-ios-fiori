// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension SignatureCaptureViewModel {
    var title: String? {
        nil
    }

    var startAction: _ActionModel? {
        _TapToSignActionDefault()
    }

    var restartAction: _ActionModel? {
        _ReEnterSignatureActionDefault()
    }

    var cancelAction: _ActionModel? {
        _CancelActionDefault()
    }

    var clearAction: _ActionModel? {
        _ClearActionDefault()
    }

    var saveAction: _ActionModel? {
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
