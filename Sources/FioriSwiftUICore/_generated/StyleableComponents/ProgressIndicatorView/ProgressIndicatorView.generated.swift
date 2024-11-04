// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ProgressIndicatorView` provides a circular progress indicator with custom styles for processing, pausable, and stoppable indicators.
///
/// ## Usage
/// ```swift
/// @State var progress: Double = 0.0
/// @State var isPaused: Bool = false
///
/// ProgressIndicatorView(progress: $progress)
///    .progressIndicatorViewStyle(.processing)
/// ProgressIndicatorView(progress: $progress)
///     .progressIndicatorViewStyle(ProgressIndicatorViewPausableStyle(isPaused: self.$isPaused))
/// ```
public struct ProgressIndicatorView {
    @Binding var progress: Double

    @Environment(\.progressIndicatorViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(progress: Binding<Double>) {
        self._progress = progress
    }
}

public extension ProgressIndicatorView {
    init(_ configuration: ProgressIndicatorViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ProgressIndicatorViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self._progress = configuration.$progress
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ProgressIndicatorView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(progress: self.$progress)).typeErased
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
        ProgressIndicatorView(.init(progress: self.$progress))
            .shouldApplyDefaultStyle(false)
            .progressIndicatorViewStyle(ProgressIndicatorViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
