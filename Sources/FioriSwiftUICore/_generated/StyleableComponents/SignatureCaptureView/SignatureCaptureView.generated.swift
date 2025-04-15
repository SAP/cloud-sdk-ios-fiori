// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

/// `SignatureCaptureView` allows user to sign above  the signature line.
/// ## Usage
/// ```swift
/// SignatureCaptureView(title: "Signature Title", isRequired: true, startSignatureAction: {
///    Button(action: {}, label: { Text("start") })
/// }, reenterSignatureAction: {
///    Button(action: {}, label: { Text("restart") })
/// }, cancelAction: {
///    Button(action: {}, label: { Text("cancel") })
/// }, clearAction: {
///    Button(action: {}, label: { Text("clear") })
/// }, saveAction: {
///    Button(action: {}, label: { Text("save") })
/// }, xmark: {
///    Image(systemName: "xmark")
/// }, watermark: {
///    Text("This is a watermark")
/// }, signatureImage: nil,
///                     drawingViewMaxHeight: 400,
///                     drawingViewBackgroundColor: Color.gray,
///                     strokeWidth: 1,
///                     appliesTintColorToImage: true,
///                     strokeColor: Color.red,
///                     signatureLineColor: Color.black,
///                     hidesSignatureLine: false,
///                     watermarkAlignment: .trailing,
///                     addsTimestampInImage: true,
///                     timestampFormatter: nil,
///                     cropsImage: false) { img in
///    let imgSaver = ImageSaver()
///    imgSaver.writeToPhotoAlbum(image: img)
/// }
/// ```
public struct SignatureCaptureView {
    let title: any View
    let startSignatureAction: any View
    let reenterSignatureAction: any View
    let cancelAction: any View
    let clearAction: any View
    let saveAction: any View
    let xmark: any View
    let watermark: any View
    /// An optional image for default signature.
    let signatureImage: UIImage?
    /// Maximum height of the drawing view.
    let drawingViewMaxHeight: CGFloat?
    /// The background color of the drawing view. Default value is `.primaryBackground`.
    let drawingViewBackgroundColor: Color
    /// The width of the stroke. Default value is `3.0`.
    let strokeWidth: CGFloat
    /// Indicates if should use `strokeColor` as foreground color. Default value is `true`.
    let appliesTintColorToImage: Bool
    /// The color for the stroke. Default value is `.primaryLabel`.
    let strokeColor: Color
    /// The color of the signature line. Default value is `.quaternaryLabel`.
    let signatureLineColor: Color
    /// Indicates if the signature line should be hidden. Default value is `false`.
    let hidesSignatureLine: Bool
    /// The alignment of the watermark. Default value is `.leading`.
    let watermarkAlignment: HorizontalAlignment
    /// Indicates if timestamp should be added in image. Default value is `false`.
    let addsTimestampInImage: Bool
    /// Timestamp formatter.
    let timestampFormatter: DateFormatter?
    /// Indicates if the image should be cropped. Default value is `false`.
    let cropsImage: Bool
    /// An optional call back for save action.
    let onSave: ((UIImage) -> Void)?
    /// An optional call back for delete action.
    let onDelete: (() -> Void)?

    @Environment(\.signatureCaptureViewStyle) var style

    var componentIdentifier: String = SignatureCaptureView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder startSignatureAction: () -> any View = { FioriButton { _ in Text("Tap to Sign".localizedFioriString()) } },
                @ViewBuilder reenterSignatureAction: () -> any View = { FioriButton { _ in Text("Re-enter Signature".localizedFioriString()) } },
                @ViewBuilder cancelAction: () -> any View = { FioriButton { _ in Text("Cancel".localizedFioriString()) } },
                @ViewBuilder clearAction: () -> any View = { FioriButton { _ in Text("Clear".localizedFioriString()) } },
                @ViewBuilder saveAction: () -> any View = { FioriButton { _ in Text("Save".localizedFioriString()) } },
                @ViewBuilder xmark: () -> any View = { Image(systemName: "xmark") },
                @ViewBuilder watermark: () -> any View = { EmptyView() },
                signatureImage: UIImage? = nil,
                drawingViewMaxHeight: CGFloat? = nil,
                drawingViewBackgroundColor: Color = Color.preferredColor(.primaryBackground),
                strokeWidth: CGFloat = 3,
                appliesTintColorToImage: Bool = true,
                strokeColor: Color = Color.preferredColor(.primaryLabel),
                signatureLineColor: Color = Color.preferredColor(.quaternaryLabel),
                hidesSignatureLine: Bool = false,
                watermarkAlignment: HorizontalAlignment = .leading,
                addsTimestampInImage: Bool = false,
                timestampFormatter: DateFormatter? = nil,
                cropsImage: Bool = false,
                onSave: ((UIImage) -> Void)? = nil,
                onDelete: (() -> Void)? = nil,
                componentIdentifier: String? = SignatureCaptureView.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.startSignatureAction = StartSignatureAction(startSignatureAction: startSignatureAction, componentIdentifier: componentIdentifier)
        self.reenterSignatureAction = ReenterSignatureAction(reenterSignatureAction: reenterSignatureAction, componentIdentifier: componentIdentifier)
        self.cancelAction = CancelAction(cancelAction: cancelAction, componentIdentifier: componentIdentifier)
        self.clearAction = ClearAction(clearAction: clearAction, componentIdentifier: componentIdentifier)
        self.saveAction = SaveAction(saveAction: saveAction, componentIdentifier: componentIdentifier)
        self.xmark = Xmark(xmark: xmark, componentIdentifier: componentIdentifier)
        self.watermark = Watermark(watermark: watermark, componentIdentifier: componentIdentifier)
        self.signatureImage = signatureImage
        self.drawingViewMaxHeight = drawingViewMaxHeight
        self.drawingViewBackgroundColor = drawingViewBackgroundColor
        self.strokeWidth = strokeWidth
        self.appliesTintColorToImage = appliesTintColorToImage
        self.strokeColor = strokeColor
        self.signatureLineColor = signatureLineColor
        self.hidesSignatureLine = hidesSignatureLine
        self.watermarkAlignment = watermarkAlignment
        self.addsTimestampInImage = addsTimestampInImage
        self.timestampFormatter = timestampFormatter
        self.cropsImage = cropsImage
        self.onSave = onSave
        self.onDelete = onDelete
        self.componentIdentifier = componentIdentifier ?? SignatureCaptureView.identifier
    }
}

public extension SignatureCaptureView {
    static let identifier = "fiori_signaturecaptureview_component"
}

public extension SignatureCaptureView {
    init(title: AttributedString,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         startSignatureAction: FioriButton? = FioriButton { _ in Text("Tap to Sign".localizedFioriString()) },
         reenterSignatureAction: FioriButton? = FioriButton { _ in Text("Re-enter Signature".localizedFioriString()) },
         cancelAction: FioriButton? = FioriButton { _ in Text("Cancel".localizedFioriString()) },
         clearAction: FioriButton? = FioriButton { _ in Text("Clear".localizedFioriString()) },
         saveAction: FioriButton? = FioriButton { _ in Text("Save".localizedFioriString()) },
         xmark: Image? = Image(systemName: "xmark"),
         watermark: AttributedString? = nil,
         signatureImage: UIImage? = nil,
         drawingViewMaxHeight: CGFloat? = nil,
         drawingViewBackgroundColor: Color = Color.preferredColor(.primaryBackground),
         strokeWidth: CGFloat = 3,
         appliesTintColorToImage: Bool = true,
         strokeColor: Color = Color.preferredColor(.primaryLabel),
         signatureLineColor: Color = Color.preferredColor(.quaternaryLabel),
         hidesSignatureLine: Bool = false,
         watermarkAlignment: HorizontalAlignment = .leading,
         addsTimestampInImage: Bool = false,
         timestampFormatter: DateFormatter? = nil,
         cropsImage: Bool = false,
         onSave: ((UIImage) -> Void)? = nil,
         onDelete: (() -> Void)? = nil)
    {
        self.init(title: {
            TextWithMandatoryFieldIndicator(text: title, isRequired: isRequired, mandatoryFieldIndicator: mandatoryFieldIndicator)
        }, startSignatureAction: { startSignatureAction }, reenterSignatureAction: { reenterSignatureAction }, cancelAction: { cancelAction }, clearAction: { clearAction }, saveAction: { saveAction }, xmark: { xmark }, watermark: { OptionalText(watermark) }, signatureImage: signatureImage, drawingViewMaxHeight: drawingViewMaxHeight, drawingViewBackgroundColor: drawingViewBackgroundColor, strokeWidth: strokeWidth, appliesTintColorToImage: appliesTintColorToImage, strokeColor: strokeColor, signatureLineColor: signatureLineColor, hidesSignatureLine: hidesSignatureLine, watermarkAlignment: watermarkAlignment, addsTimestampInImage: addsTimestampInImage, timestampFormatter: timestampFormatter, cropsImage: cropsImage, onSave: onSave, onDelete: onDelete)
    }
}

public extension SignatureCaptureView {
    init(_ configuration: SignatureCaptureViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SignatureCaptureViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.startSignatureAction = configuration.startSignatureAction
        self.reenterSignatureAction = configuration.reenterSignatureAction
        self.cancelAction = configuration.cancelAction
        self.clearAction = configuration.clearAction
        self.saveAction = configuration.saveAction
        self.xmark = configuration.xmark
        self.watermark = configuration.watermark
        self.signatureImage = configuration.signatureImage
        self.drawingViewMaxHeight = configuration.drawingViewMaxHeight
        self.drawingViewBackgroundColor = configuration.drawingViewBackgroundColor
        self.strokeWidth = configuration.strokeWidth
        self.appliesTintColorToImage = configuration.appliesTintColorToImage
        self.strokeColor = configuration.strokeColor
        self.signatureLineColor = configuration.signatureLineColor
        self.hidesSignatureLine = configuration.hidesSignatureLine
        self.watermarkAlignment = configuration.watermarkAlignment
        self.addsTimestampInImage = configuration.addsTimestampInImage
        self.timestampFormatter = configuration.timestampFormatter
        self.cropsImage = configuration.cropsImage
        self.onSave = configuration.onSave
        self.onDelete = configuration.onDelete
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SignatureCaptureView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), startSignatureAction: .init(self.startSignatureAction), reenterSignatureAction: .init(self.reenterSignatureAction), cancelAction: .init(self.cancelAction), clearAction: .init(self.clearAction), saveAction: .init(self.saveAction), xmark: .init(self.xmark), watermark: .init(self.watermark), signatureImage: self.signatureImage, drawingViewMaxHeight: self.drawingViewMaxHeight, drawingViewBackgroundColor: self.drawingViewBackgroundColor, strokeWidth: self.strokeWidth, appliesTintColorToImage: self.appliesTintColorToImage, strokeColor: self.strokeColor, signatureLineColor: self.signatureLineColor, hidesSignatureLine: self.hidesSignatureLine, watermarkAlignment: self.watermarkAlignment, addsTimestampInImage: self.addsTimestampInImage, timestampFormatter: self.timestampFormatter, cropsImage: self.cropsImage, onSave: self.onSave, onDelete: self.onDelete)).typeErased
                .transformEnvironment(\.signatureCaptureViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SignatureCaptureView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SignatureCaptureView(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), startSignatureAction: .init(self.startSignatureAction), reenterSignatureAction: .init(self.reenterSignatureAction), cancelAction: .init(self.cancelAction), clearAction: .init(self.clearAction), saveAction: .init(self.saveAction), xmark: .init(self.xmark), watermark: .init(self.watermark), signatureImage: self.signatureImage, drawingViewMaxHeight: self.drawingViewMaxHeight, drawingViewBackgroundColor: self.drawingViewBackgroundColor, strokeWidth: self.strokeWidth, appliesTintColorToImage: self.appliesTintColorToImage, strokeColor: self.strokeColor, signatureLineColor: self.signatureLineColor, hidesSignatureLine: self.hidesSignatureLine, watermarkAlignment: self.watermarkAlignment, addsTimestampInImage: self.addsTimestampInImage, timestampFormatter: self.timestampFormatter, cropsImage: self.cropsImage, onSave: self.onSave, onDelete: self.onDelete))
            .shouldApplyDefaultStyle(false)
            .signatureCaptureViewStyle(SignatureCaptureViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
