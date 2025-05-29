// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol OnboardingScanViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: OnboardingScanViewConfiguration) -> Body
}

struct AnyOnboardingScanViewStyle: OnboardingScanViewStyle {
    let content: (OnboardingScanViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (OnboardingScanViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: OnboardingScanViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct OnboardingScanViewConfiguration {
    public var componentIdentifier: String = "fiori_onboardingscanview_component"
    public let scanViewContext: OnboardingScanViewContext
    public let shouldValidateScanResult: ((String) -> Bool)?
    public let didCancel: (() -> Void)?
    public let usesCameraOnly: Bool
    public let scanConfirmationView: ScanConfirmationView
    public let didTapContinue: (() -> Void)?

    public typealias ScanConfirmationView = ConfigurationViewWrapper
}

extension OnboardingScanViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct OnboardingScanViewFioriStyle: OnboardingScanViewStyle {
    public func makeBody(_ configuration: OnboardingScanViewConfiguration) -> some View {
        OnboardingScanView(configuration)
    }
}
