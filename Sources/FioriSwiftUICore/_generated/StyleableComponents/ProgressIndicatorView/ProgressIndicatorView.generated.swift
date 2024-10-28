// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ProgressIndicatorView` provides a circular progress indicator.
///
/// ## Usage
/// ```swift
/// @State var progress: Double = 0.0
/// @State var progressState = ProgressViewState.processing
///
/// ProgressIndicatorView(indicatorProgress: self.$progress, progressState: self.$progressState)
/// ```
public struct ProgressIndicatorView {
    @Binding var indicatorProgress: Double
    /// The current view state of this progress indicator. Changing this property will result in a different icon and view.
    @Binding var progressState: ProgressViewState

    @Environment(\.progressIndicatorViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(indicatorProgress: Binding<Double>,
                progressState: Binding<ProgressViewState>)
    {
        self._indicatorProgress = indicatorProgress
        self._progressState = progressState
    }
}

public extension ProgressIndicatorView {
    init(_ configuration: ProgressIndicatorViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ProgressIndicatorViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self._indicatorProgress = configuration.$indicatorProgress
        self._progressState = configuration.$progressState
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ProgressIndicatorView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(indicatorProgress: self.$indicatorProgress, progressState: self.$progressState)).typeErased
                .transformEnvironment(\.progressIndicatorViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ProgressIndicatorView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ProgressIndicatorView(.init(indicatorProgress: self.$indicatorProgress, progressState: self.$progressState))
            .shouldApplyDefaultStyle(false)
            .progressIndicatorViewStyle(ProgressIndicatorViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
