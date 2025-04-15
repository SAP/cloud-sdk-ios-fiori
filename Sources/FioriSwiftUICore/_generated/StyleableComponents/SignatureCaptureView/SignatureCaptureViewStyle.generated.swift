// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SignatureCaptureViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SignatureCaptureViewConfiguration) -> Body
}

struct AnySignatureCaptureViewStyle: SignatureCaptureViewStyle {
    let content: (SignatureCaptureViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SignatureCaptureViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SignatureCaptureViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SignatureCaptureViewConfiguration {
    public var componentIdentifier: String = "fiori_signaturecaptureview_component"
    public let title: Title
    public let startSignatureAction: StartSignatureAction
    public let reenterSignatureAction: ReenterSignatureAction
    public let cancelAction: CancelAction
    public let clearAction: ClearAction
    public let saveAction: SaveAction
    public let xmark: Xmark
    public let watermark: Watermark
    public let signatureImage: UIImage?
    public let drawingViewMaxHeight: CGFloat?
    public let drawingViewBackgroundColor: Color
    public let strokeWidth: CGFloat
    public let appliesTintColorToImage: Bool
    public let strokeColor: Color
    public let signatureLineColor: Color
    public let hidesSignatureLine: Bool
    public let watermarkAlignment: HorizontalAlignment
    public let addsTimestampInImage: Bool
    public let timestampFormatter: DateFormatter?
    public let cropsImage: Bool
    public let onSave: ((UIImage) -> Void)?
    public let onDelete: (() -> Void)?

    public typealias Title = ConfigurationViewWrapper
    public typealias StartSignatureAction = ConfigurationViewWrapper
    public typealias ReenterSignatureAction = ConfigurationViewWrapper
    public typealias CancelAction = ConfigurationViewWrapper
    public typealias ClearAction = ConfigurationViewWrapper
    public typealias SaveAction = ConfigurationViewWrapper
    public typealias Xmark = ConfigurationViewWrapper
    public typealias Watermark = ConfigurationViewWrapper
}

extension SignatureCaptureViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct SignatureCaptureViewFioriStyle: SignatureCaptureViewStyle {
    public func makeBody(_ configuration: SignatureCaptureViewConfiguration) -> some View {
        SignatureCaptureView(configuration)
            .titleStyle(TitleFioriStyle(signatureCaptureViewConfiguration: configuration))
            .startSignatureActionStyle(StartSignatureActionFioriStyle(signatureCaptureViewConfiguration: configuration))
            .reenterSignatureActionStyle(ReenterSignatureActionFioriStyle(signatureCaptureViewConfiguration: configuration))
            .cancelActionStyle(CancelActionFioriStyle(signatureCaptureViewConfiguration: configuration))
            .clearActionStyle(ClearActionFioriStyle(signatureCaptureViewConfiguration: configuration))
            .saveActionStyle(SaveActionFioriStyle(signatureCaptureViewConfiguration: configuration))
            .xmarkStyle(XmarkFioriStyle(signatureCaptureViewConfiguration: configuration))
            .watermarkStyle(WatermarkFioriStyle(signatureCaptureViewConfiguration: configuration))
    }
}
