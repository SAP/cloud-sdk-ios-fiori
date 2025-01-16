// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Progress {
    let progress: any View

    @Environment(\.progressStyle) var style

    var componentIdentifier: String = Progress.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder progress: () -> any View,
                componentIdentifier: String? = Progress.identifier)
    {
        self.progress = progress()
        self.componentIdentifier = componentIdentifier ?? Progress.identifier
    }
}

public extension Progress {
    static let identifier = "fiori_progress_component"
}

public extension Progress {
    init(progress: ProgressView<EmptyView, EmptyView> = ProgressView(),
         componentIdentifier: String? = Progress.identifier)
    {
        self.init(progress: { progress }, componentIdentifier: componentIdentifier)
    }
}

public extension Progress {
    init(_ configuration: ProgressConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ProgressConfiguration, shouldApplyDefaultStyle: Bool) {
        self.progress = configuration.progress
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Progress: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, progress: .init(self.progress))).typeErased
                .transformEnvironment(\.progressStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Progress {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Progress(.init(componentIdentifier: self.componentIdentifier, progress: .init(self.progress)))
            .shouldApplyDefaultStyle(false)
            .progressStyle(.fiori)
            .typeErased
    }
}
