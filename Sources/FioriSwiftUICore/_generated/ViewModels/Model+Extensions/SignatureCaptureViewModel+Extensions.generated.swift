// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension SignatureCaptureViewModel {
    var title: String? {
        return nil
    }

	var startAction: _ActionModel? {
        return _TapToSignActionDefault()
    }

	var restartAction: _ActionModel? {
        return _ReEnterSignatureActionDefault()
    }

	var cancelAction: _ActionModel? {
        return _CancelActionDefault()
    }

	var clearAction: _ActionModel? {
        return _ClearActionDefault()
    }

	var saveAction: _ActionModel? {
        return _SaveActionDefault()
    }

	var signatureImage: UIImage? {
        return nil
    }

	var onSave: ((UIImage) -> Void)? {
        return nil
    }

	var onDelete: (() -> Void)? {
        return nil
    }
}
