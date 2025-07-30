import Combine
import FioriThemeManager
import Foundation
import SwiftUI

public extension SignatureCaptureView {
    /// Convenience initializer for signature capture view.
    /// - Parameters:
    ///   - mandatoryFieldIndicator: Indicator for mandatory field. Default value is `*`.
    ///   - isRequired: Indicates if `mandatoryFieldIndicator` should be displayed. Default value is `false`.
    ///   - startSignatureAction: Action for start signature.
    ///   - reenterSignatureAction: Action for re-enter signature.
    ///   - cancelAction: Action for cancel signature.
    ///   - clearAction: Action for clear signature area.
    ///   - saveAction: Action for save signature.
    ///   - xmark: X-mark for signature view that. Default value is `xmark`.
    ///   - watermark: Watermark for signature.
    ///   - signatureImage: A default signature image displayed in signature area. Default value is `nil`.
    ///   - drawingViewMaxHeight: Drawing view maximum height. Default value is `nil`.
    ///   - drawingViewBackgroundColor: Background color for drawing view area. Default value is `.primaryBackground`.
    ///   - strokeWidth: Stroke width for signature. Default value is `3.0`.
    ///   - appliesTintColorToImage: Indicates if signature image should be tinted by `strokeColor`. Default value is `true`.
    ///   - strokeColor: Stroke color for signature. Default value is `.primaryLabel`.
    ///   - signatureLineColor: Line color for signature. Default value is `.quaternaryLabel`.
    ///   - hidesSignatureLine: Indicates if signature line should be hidden. Default value is `false`
    ///   - watermarkAlignment: Horizontal alignment for watermark. Default value is `.leading`.
    ///   - addsTimestampInImage: Indicates if timestamp should be added in image. Default value is `false`.
    ///   - timestampFormatter: Timestamp date formatter. Default `dateFormat` is `MM/dd/YYYY hh:mma zzz`.
    ///   - cropsImage: Indicates if image should be cropped.
    ///   - onSave: Save action call back.
    ///   - onDelete: Clear action call back.
    ///   - componentIdentifier: Identifier of the component.
    init(@ViewBuilder mandatoryFieldIndicator: () -> any View = { Text("*") },
         isRequired: Bool = false,
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
        self.init(title: {
                      HStack(spacing: 0) {
                          Text(NSLocalizedString("Signature", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                          if isRequired {
                              mandatoryFieldIndicator().typeErased
                          }
                          Spacer()
                      }
                  },
                  startSignatureAction: startSignatureAction,
                  reenterSignatureAction: reenterSignatureAction,
                  cancelAction: cancelAction,
                  clearAction: clearAction,
                  saveAction: saveAction,
                  xmark: xmark,
                  watermark: watermark,
                  signatureImage: signatureImage,
                  drawingViewMaxHeight: drawingViewMaxHeight,
                  drawingViewBackgroundColor: drawingViewBackgroundColor,
                  strokeWidth: strokeWidth,
                  appliesTintColorToImage: appliesTintColorToImage,
                  strokeColor: strokeColor,
                  signatureLineColor: signatureLineColor,
                  hidesSignatureLine: hidesSignatureLine,
                  watermarkAlignment: watermarkAlignment,
                  addsTimestampInImage: addsTimestampInImage,
                  timestampFormatter: timestampFormatter,
                  cropsImage: cropsImage,
                  onSave: onSave,
                  onDelete: onDelete,
                  componentIdentifier: componentIdentifier)
    }
}

// Base Layout style
public struct SignatureCaptureViewBaseStyle: SignatureCaptureViewStyle {
    @State var isEditing = false
    @State var isSaved = false
    public private(set) var _heightDidChangePublisher = CurrentValueSubject<CGFloat, Never>(0)
    let _drawingViewMinHeight: CGFloat = 256
    
    @State var drawings = [Drawing]()
    @State var drawingViewWidth: CGFloat = 0
    
    @State var fullSignatureImage: UIImage?
    @State var currentDrawing = Drawing()
    @State var isReenterTapped = false

    public func makeBody(_ configuration: SignatureCaptureViewConfiguration) -> some View {
        VStack {
            HStack {
                Group {
                    configuration.title
                    Spacer()
                }
                .padding(.vertical, 11)
                configuration.cancelAction
                    .simultaneousGesture(
                        TapGesture()
                            .onEnded { _ in
                                self.clear()
                                self.isEditing = false
                            }
                    )
                    .frame(minWidth: 44, minHeight: 44)
                    .setHidden(!self.isEditing)
            }
            .frame(minHeight: 44)
            
            if self.fullSignatureImage != nil || (configuration.signatureImage != nil && !self.isReenterTapped) {
                ZStack {
                    if let uiImage = fullSignatureImage {
                        if configuration.appliesTintColorToImage {
                            Image(uiImage: uiImage)
                                .renderingMode(.template)
                                .foregroundStyle(configuration.strokeColor)
                                .frame(minHeight: self._drawingViewMinHeight, maxHeight: self.imageMaxHeight(configuration))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.zero)
                        } else {
                            Image(uiImage: uiImage)
                                .frame(minHeight: self._drawingViewMinHeight, maxHeight: self.imageMaxHeight(configuration))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.zero)
                        }
                    } else if let signature = configuration.signatureImage {
                        if configuration.appliesTintColorToImage {
                            Image(uiImage: signature)
                                .renderingMode(.template)
                                .foregroundStyle(configuration.strokeColor)
                                .padding(.zero)
                        } else {
                            Image(uiImage: signature)
                                .padding(.zero)
                        }
                    }
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.preferredColor(.separator), lineWidth: 1)
                        .background(Color.preferredColor(.quaternaryFill))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(minHeight: self._drawingViewMinHeight, maxHeight: self.imageMaxHeight(configuration))
                }
                .padding(.zero)
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(NSLocalizedString("Signature Image", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Signature Image"))
            } else {
                self.drawingArea(configuration)
                    .frame(minHeight: self._drawingViewMinHeight, maxHeight: configuration.drawingViewMaxHeight)
                    .padding(.zero)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.preferredColor(.separator), lineWidth: 1)
                    )
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        self.isEditing = true
                    }
            }
            
            if self.isEditing {
                HStack {
                    configuration.clearAction
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded { _ in
                                    self.clear()
                                }
                        )
                        .disabled(self.drawings.isEmpty)
                        .frame(minWidth: 44, minHeight: 44)
                    Spacer()
                    configuration.saveAction
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded { _ in
                                    DispatchQueue.main.async {
                                        self.isSaved = true
                                    }
                                }
                        )
                        .disabled(self.drawings.isEmpty)
                        .frame(minWidth: 44, minHeight: 44)
                }.padding(.top, 8)
            } else if (configuration.signatureImage != nil && !self.isReenterTapped) || self.fullSignatureImage != nil {
                configuration.reenterSignatureAction
                    .simultaneousGesture(
                        TapGesture()
                            .onEnded { _ in
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                self.clear()
                                configuration.onDelete?()
                                self.isReenterTapped = true
                                self.isEditing = true
                            }
                    )
                    .frame(minWidth: 44, minHeight: 44)
                    .padding(.top, 8)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: self.isEditing || (configuration.signatureImage != nil && !self.isReenterTapped) ? 0 : 16, trailing: 16))
        .sizeReader(size: { size in
            if self._heightDidChangePublisher.value != size.height {
                self._heightDidChangePublisher.send(size.height)
            }
            if self.drawingViewWidth != size.width {
                self.drawingViewWidth = size.width
            }
        })
        .background(Color.preferredColor(.cellBackground))
    }
    
    private func imageMaxHeight(_ configuration: SignatureCaptureViewConfiguration) -> CGFloat? {
        var imageHeight: CGFloat = 0
        if let uiImage = fullSignatureImage {
            imageHeight = uiImage.size.height
        } else if let signature = configuration.signatureImage {
            imageHeight = signature.size.height
        } else {
            return configuration.drawingViewMaxHeight
        }
        if let drawingViewMaxHeight = configuration.drawingViewMaxHeight {
            return max(imageHeight, drawingViewMaxHeight)
        } else if imageHeight > 0 {
            return imageHeight
        }
        return nil
    }
    
    @ViewBuilder func drawingArea(_ configuration: SignatureCaptureViewConfiguration) -> some View {
        if self.isEditing {
            ZStack(alignment: .bottom) {
                ScribbleView(image: self.$fullSignatureImage,
                             currentDrawing: self.$currentDrawing,
                             drawings: self.$drawings,
                             isSaved: self.$isSaved,
                             isEditing: self.$isEditing,
                             onSave: { img in
                                 configuration.onSave?(img)
                             },
                             strokeWidth: configuration.strokeWidth,
                             strokeColor: configuration.strokeColor,
                             drawingViewBackgroundColor: configuration.drawingViewBackgroundColor,
                             cropsImage: configuration.cropsImage,
                             addsTimestampInImage: configuration.addsTimestampInImage,
                             timestampFormatter: configuration.timestampFormatter,
                             watermarkAlignment: configuration.watermarkAlignment,
                             watermark: configuration.watermark)
                    .frame(maxWidth: .infinity, minHeight: 256, maxHeight: configuration.drawingViewMaxHeight)
                    .accessibilityElement()
                    .accessibilityLabel(NSLocalizedString("Signature Area", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Signature Area"))
                    .accessibilityHint(NSLocalizedString("Double tap and drag to sign", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Double tap and drag to sign"))
                HStack(alignment: .bottom) {
                    configuration.xmark
                    Rectangle()
                        .foregroundColor(configuration.signatureLineColor)
                        .frame(height: 1)
                        .setHidden(configuration.hidesSignatureLine)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(NSLocalizedString("Signature Line", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Signature Line"))
                .padding([.leading, .trailing]).padding(.bottom, 48)
            }
        } else {
            ZStack(alignment: .bottom) {
                ZStack {
                    Color.preferredColor(.quaternaryFill).cornerRadius(10)
                    configuration.startSignatureAction
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded { _ in
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    self.isEditing = true
                                }
                        )
                        .font(.fiori(forTextStyle: .body))
                        .foregroundColor(Color.preferredColor(.tintColor))
                }
                .frame(maxWidth: .infinity, minHeight: 256, maxHeight: configuration.drawingViewMaxHeight)
                HStack(alignment: .bottom) {
                    configuration.xmark
                    Rectangle()
                        .foregroundColor(configuration.signatureLineColor.opacity(0.4))
                        .frame(height: 1)
                        .setHidden(configuration.hidesSignatureLine)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(NSLocalizedString("Signature Line", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Signature Line"))
                .padding([.leading, .trailing]).padding(.bottom, 48)
            }
        }
    }
    
    func setEditing() {
        self.isEditing = true
    }
    
    func clear() {
        self.fullSignatureImage = nil
        self.currentDrawing = Drawing()
        self.drawings.removeAll()
    }
}

// Default fiori styles
extension SignatureCaptureViewFioriStyle {
    struct ContentFioriStyle: SignatureCaptureViewStyle {
        func makeBody(_ configuration: SignatureCaptureViewConfiguration) -> some View {
            SignatureCaptureView(configuration)
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let signatureCaptureViewConfiguration: SignatureCaptureViewConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .subheadline).weight(.semibold))
                .foregroundStyle(Color.preferredColor(.primaryLabel))
        }
    }
    
    struct StartSignatureActionFioriStyle: StartSignatureActionStyle {
        let signatureCaptureViewConfiguration: SignatureCaptureViewConfiguration
        
        func makeBody(_ configuration: StartSignatureActionConfiguration) -> some View {
            StartSignatureAction(configuration)
                .fioriButtonStyle(FioriTertiaryButtonStyle())
        }
    }
    
    struct ReenterSignatureActionFioriStyle: ReenterSignatureActionStyle {
        let signatureCaptureViewConfiguration: SignatureCaptureViewConfiguration
        
        func makeBody(_ configuration: ReenterSignatureActionConfiguration) -> some View {
            ReenterSignatureAction(configuration)
                .fioriButtonStyle(FioriTertiaryButtonStyle())
        }
    }
    
    struct CancelActionFioriStyle: CancelActionStyle {
        let signatureCaptureViewConfiguration: SignatureCaptureViewConfiguration
        
        func makeBody(_ configuration: CancelActionConfiguration) -> some View {
            CancelAction(configuration)
                .fioriButtonStyle(FioriTertiaryButtonStyle())
        }
    }
    
    struct ClearActionFioriStyle: ClearActionStyle {
        let signatureCaptureViewConfiguration: SignatureCaptureViewConfiguration
        
        func makeBody(_ configuration: ClearActionConfiguration) -> some View {
            ClearAction(configuration)
                .fioriButtonStyle(FioriTertiaryButtonStyle())
        }
    }
    
    struct SaveActionFioriStyle: SaveActionStyle {
        let signatureCaptureViewConfiguration: SignatureCaptureViewConfiguration
        
        func makeBody(_ configuration: SaveActionConfiguration) -> some View {
            SaveAction(configuration)
                .fioriButtonStyle(FioriTertiaryButtonStyle())
        }
    }
    
    struct XmarkFioriStyle: XmarkStyle {
        let signatureCaptureViewConfiguration: SignatureCaptureViewConfiguration
    
        func makeBody(_ configuration: XmarkConfiguration) -> some View {
            Xmark(configuration)
                .foregroundColor(Color.preferredColor(.quaternaryLabel))
                .font(.fiori(forTextStyle: .body))
        }
    }
    
    struct WatermarkFioriStyle: WatermarkStyle {
        let signatureCaptureViewConfiguration: SignatureCaptureViewConfiguration
    
        func makeBody(_ configuration: WatermarkConfiguration) -> some View {
            Watermark(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
        }
    }
}
