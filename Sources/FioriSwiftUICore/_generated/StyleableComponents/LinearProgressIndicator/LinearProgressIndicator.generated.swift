// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct LinearProgressIndicator {
    @Binding var indicatorProgress: Double

    @Environment(\.linearProgressIndicatorStyle) var style

    var componentIdentifier: String = LinearProgressIndicator.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(indicatorProgress: Binding<Double>,
                componentIdentifier: String? = LinearProgressIndicator.identifier)
    {
        self._indicatorProgress = indicatorProgress
        self.componentIdentifier = componentIdentifier ?? LinearProgressIndicator.identifier
    }
}

public extension LinearProgressIndicator {
    static let identifier = "fiori_linearprogressindicator_component"
}

public extension LinearProgressIndicator {
    init(_ configuration: LinearProgressIndicatorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: LinearProgressIndicatorConfiguration, shouldApplyDefaultStyle: Bool) {
        self._indicatorProgress = configuration.$indicatorProgress
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension LinearProgressIndicator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, indicatorProgress: self.$indicatorProgress)).typeErased
                .transformEnvironment(\.linearProgressIndicatorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension LinearProgressIndicator {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        LinearProgressIndicator(.init(componentIdentifier: self.componentIdentifier, indicatorProgress: self.$indicatorProgress))
            .shouldApplyDefaultStyle(false)
            .linearProgressIndicatorStyle(.fiori)
            .typeErased
    }
}
