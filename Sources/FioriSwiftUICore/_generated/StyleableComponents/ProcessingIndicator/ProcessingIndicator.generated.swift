// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ProcessingIndicator` provides a circular indeterminate indicator with an optional title below the indicator.
///
/// ## Usage
/// ```swift
/// ProcessingIndicator(optionalTitle: "Processing")
/// ```
public struct ProcessingIndicator {
    let optionalTitle: any View

    @Environment(\.processingIndicatorStyle) var style

    var componentIdentifier: String = ProcessingIndicator.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder optionalTitle: () -> any View = { EmptyView() },
                componentIdentifier: String? = ProcessingIndicator.identifier)
    {
        self.optionalTitle = OptionalTitle(optionalTitle: optionalTitle, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? ProcessingIndicator.identifier
    }
}

public extension ProcessingIndicator {
    static let identifier = "fiori_processingindicator_component"
}

public extension ProcessingIndicator {
    init(optionalTitle: AttributedString?) {
        self.init(optionalTitle: { OptionalText(optionalTitle) })
    }
}

public extension ProcessingIndicator {
    init(_ configuration: ProcessingIndicatorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ProcessingIndicatorConfiguration, shouldApplyDefaultStyle: Bool) {
        self.optionalTitle = configuration.optionalTitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ProcessingIndicator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, optionalTitle: .init(self.optionalTitle))).typeErased
                .transformEnvironment(\.processingIndicatorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ProcessingIndicator {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ProcessingIndicator(.init(componentIdentifier: self.componentIdentifier, optionalTitle: .init(self.optionalTitle)))
            .shouldApplyDefaultStyle(false)
            .processingIndicatorStyle(ProcessingIndicatorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
