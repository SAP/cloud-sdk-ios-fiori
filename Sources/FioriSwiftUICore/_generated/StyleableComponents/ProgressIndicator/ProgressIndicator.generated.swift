// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ProgressIndicator` provides a circular progress indicator with custom styles for processing, pausable, and stoppable indicators.
///
/// ## Usage
/// ```swift
/// @State var progress: Double = 0.0
/// @State var isPaused: Bool = false
///
/// ProgressIndicator(progress: $progress)
///    .progressIndicatorStyle(.processing)
/// ProgressIndicator(progress: $progress)
///     .progressIndicatorStyle(ProgressIndicatorPausableStyle(isPaused: self.$isPaused))
/// ```
public struct ProgressIndicator {
    @Binding var progress: Double

    @Environment(\.progressIndicatorStyle) var style

    var componentIdentifier: String = ProgressIndicator.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(progress: Binding<Double>,
                componentIdentifier: String? = ProgressIndicator.identifier)
    {
        self._progress = progress
        self.componentIdentifier = componentIdentifier ?? ProgressIndicator.identifier
    }
}

public extension ProgressIndicator {
    static let identifier = "fiori_progressindicator_component"
}

public extension ProgressIndicator {
    init(_ configuration: ProgressIndicatorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ProgressIndicatorConfiguration, shouldApplyDefaultStyle: Bool) {
        self._progress = configuration.$progress
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ProgressIndicator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, progress: self.$progress)).typeErased
                .transformEnvironment(\.progressIndicatorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ProgressIndicator {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ProgressIndicator(.init(componentIdentifier: self.componentIdentifier, progress: self.$progress))
            .shouldApplyDefaultStyle(false)
            .progressIndicatorStyle(ProgressIndicatorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
