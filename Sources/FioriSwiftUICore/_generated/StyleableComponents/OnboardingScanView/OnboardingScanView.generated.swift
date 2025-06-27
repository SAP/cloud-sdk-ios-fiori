// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `OnboardingScanView` is used to display a scanner view to scan a QR code for app activation.
/// It is also displaying the image thumbnails from camera roll and a button to start photo picker
/// that user may choose the QR code image directly.
/// Typically it is used in ActivationScreen and WelcomeScreen
/// ## Usage
/// ```swift
/// @State var isScanPresented = false
/// ActivationScreen(title: "Activation",
///     descriptionText: "If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding.",
///     footnote: "Or",
///     action: FioriButton(title: "Use your email", action: { _ in
///         print("ActivationScreen Primary button clicked, email: \(self.inputText)")
///     }),
///     secondaryAction: FioriButton(title: "Scan", action: { _ in
///         self.isScanPresented.toggle()
///     }),
///    illustratedMessage: IllustratedMessage(detailImage: {
///    Image("IllustrationImage").resizable(resizingMode: .stretch)
/// }, title: {
///    Text("Activation")
/// }, description: {
///    Text("If you received a welcome email, follow the activation link in the email.Otherwise, enter your email address or scan the QR code to start onboarding.")
///        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
/// }, detailImageSize: .large),
///   inputText: self.$inputText,
///   showsIllustratedMessage: self.showsIllustratedMessage)
///   .sheet(isPresented: $isScanPresented) {
///         OnboardingScanView(shouldValidateScanResult: { scanResult in
///             return scanResult == "success"
///         }, didCancel: {
///             self.isScanPresented.toggle()
///         }, usesCameraOnly: false,
///            didTapContinue: {
///             self.isScanPresented.toggle()
///         })
/// }
/// ```
public struct OnboardingScanView {
    /// The alert messages configuration of OnboardingScanView.
    let scanViewContext: OnboardingScanViewContext
    /// The callback event when a QR code has been successfully scanned. The callback should validate this QR code and return the value whether the QR code is validated successfully.
    let shouldValidateScanResult: ((String) -> Bool)?
    /// The action to be performed when the cancel button is tapped.
    let didCancel: (() -> Void)?
    /// Indicate whether to use camera only to scan.
    /// If it is `true`, user can not choose an image from the photo library.
    /// Default value is `false`.
    let usesCameraOnly: Bool
    /// The view to be displayed on top of the scan view when a QR code is validated.
    /// If the application does not provide this view, a default OnboardingScanConfirmView will be provided as a default view.
    let scanConfirmationView: any View
    /// The action to be performed when the continue button is tapped in the default OnboardingScanConfirmView.
    let didTapContinue: (() -> Void)?

    @Environment(\.onboardingScanViewStyle) var style

    var componentIdentifier: String = OnboardingScanView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(scanViewContext: OnboardingScanViewContext = OnboardingScanViewContext(),
                shouldValidateScanResult: ((String) -> Bool)? = nil,
                didCancel: (() -> Void)? = nil,
                usesCameraOnly: Bool = false,
                @ViewBuilder scanConfirmationView: () -> any View = { EmptyView() },
                didTapContinue: (() -> Void)? = nil,
                componentIdentifier: String? = OnboardingScanView.identifier)
    {
        self.scanViewContext = scanViewContext
        self.shouldValidateScanResult = shouldValidateScanResult
        self.didCancel = didCancel
        self.usesCameraOnly = usesCameraOnly
        self.scanConfirmationView = scanConfirmationView()
        self.didTapContinue = didTapContinue
        self.componentIdentifier = componentIdentifier ?? OnboardingScanView.identifier
    }
}

public extension OnboardingScanView {
    static let identifier = "fiori_onboardingscanview_component"
}

public extension OnboardingScanView {
    init(scanViewContext: OnboardingScanViewContext = OnboardingScanViewContext(),
         shouldValidateScanResult: ((String) -> Bool)? = nil,
         didCancel: (() -> Void)? = nil,
         usesCameraOnly: Bool = false,
         scanConfirmationView: OnboardingScanConfirmView? = nil,
         didTapContinue: (() -> Void)? = nil)
    {
        self.init(scanViewContext: scanViewContext, shouldValidateScanResult: shouldValidateScanResult, didCancel: didCancel, usesCameraOnly: usesCameraOnly, scanConfirmationView: { scanConfirmationView }, didTapContinue: didTapContinue)
    }
}

public extension OnboardingScanView {
    init(_ configuration: OnboardingScanViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: OnboardingScanViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.scanViewContext = configuration.scanViewContext
        self.shouldValidateScanResult = configuration.shouldValidateScanResult
        self.didCancel = configuration.didCancel
        self.usesCameraOnly = configuration.usesCameraOnly
        self.scanConfirmationView = configuration.scanConfirmationView
        self.didTapContinue = configuration.didTapContinue
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension OnboardingScanView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, scanViewContext: self.scanViewContext, shouldValidateScanResult: self.shouldValidateScanResult, didCancel: self.didCancel, usesCameraOnly: self.usesCameraOnly, scanConfirmationView: .init(self.scanConfirmationView), didTapContinue: self.didTapContinue)).typeErased
                .transformEnvironment(\.onboardingScanViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension OnboardingScanView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        OnboardingScanView(.init(componentIdentifier: self.componentIdentifier, scanViewContext: self.scanViewContext, shouldValidateScanResult: self.shouldValidateScanResult, didCancel: self.didCancel, usesCameraOnly: self.usesCameraOnly, scanConfirmationView: .init(self.scanConfirmationView), didTapContinue: self.didTapContinue))
            .shouldApplyDefaultStyle(false)
            .onboardingScanViewStyle(OnboardingScanViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
