// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct ProgressIndicator {
    @Environment(\.progressIndicatorTextModifier) private var progressIndicatorTextModifier

    var _progressIndicatorText: String? = nil
	
    public init(model: ProgressIndicatorModel) {
        self.init(progressIndicatorText: model.progressIndicatorText)
    }

    public init(progressIndicatorText: String? = nil) {
        self._progressIndicatorText = progressIndicatorText
    }
}
