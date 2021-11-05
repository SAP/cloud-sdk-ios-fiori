// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension SignatureCaptureViewModel {
    var title: String? {
        return nil
    }

	var startAction: ActionModel? {
        return _TapToSignActionDefault()
    }

	var restartAction: ActionModel? {
        return _ReEnterSignatureActionDefault()
    }

	var cancelAction: ActionModel? {
        return _CancelActionDefault()
    }

	var clearAction: ActionModel? {
        return _ClearActionDefault()
    }

	var saveAction: ActionModel? {
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
