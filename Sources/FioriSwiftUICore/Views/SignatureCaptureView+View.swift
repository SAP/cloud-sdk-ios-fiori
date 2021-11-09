import Combine
import SwiftUI

extension Fiori {
    enum SignatureCaptureView {
        struct StartAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.body)
                    .accentColor(.preferredColor(.tintColor))
            }
        }

        typealias StartActionCumulative = EmptyModifier

        struct RestartAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.body)
                    .accentColor(.preferredColor(.tintColor))
            }
        }

        typealias RestartActionCumulative = EmptyModifier

        struct CancelAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.body)
                    .accentColor(.preferredColor(.tintColor))
            }
        }

        typealias CancelActionCumulative = EmptyModifier

        struct ClearAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.body)
                    .accentColor(.preferredColor(.tintColor))
            }
        }

        typealias ClearActionCumulative = EmptyModifier

        struct SaveAction: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.body)
                    .accentColor(.preferredColor(.tintColor))
            }
        }

        typealias SaveActionCumulative = EmptyModifier

        static let startAction = StartAction()
        static let restartAction = RestartAction()
        static let cancelAction = CancelAction()
        static let clearAction = ClearAction()
        static let saveAction = SaveAction()
        static let startActionCumulative = StartActionCumulative()
        static let restartActionCumulative = RestartActionCumulative()
        static let cancelActionCumulative = CancelActionCumulative()
        static let clearActionCumulative = ClearActionCumulative()
        static let saveActionCumulative = SaveActionCumulative()
    }
}

extension SignatureCaptureView: View {
    public var body: some View {
        VStack {
            HStack {
                Text(_title ?? NSLocalizedString("Signature", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
                    .font(titleFont)
                    .foregroundColor(titleColor)
                Spacer()
                if isEditing {
                    cancelAction
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded { _ in
                                    clear()
                                    isEditing = false
                                }
                        )
                }
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 11, trailing: 0))

            if fullSignatureImage != nil || (_signatureImage != nil && !isReenterTapped) {
                ZStack {
                    if let uiImage = fullSignatureImage {
                        Image(uiImage: uiImage)
                            .frame(minHeight: _drawingViewMinHeight, maxHeight: _drawingViewMaxHeight)
                            .cornerRadius(10)
                            .padding(.zero)
                    } else if let signature = _signatureImage {
                        Image(uiImage: signature)
                            .padding(.zero)
                    }
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.preferredColor(.separator), lineWidth: 1)
                        .background(Color.preferredColor(.quarternaryFill)).cornerRadius(10)
                        .frame(minHeight: _drawingViewMinHeight, maxHeight: _drawingViewMaxHeight)
                        .padding(.zero)
                }.padding(.zero)
            } else {
                drawingArea
                    .frame(minHeight: _drawingViewMinHeight, maxHeight: _drawingViewMaxHeight)
                    .padding(.zero)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.preferredColor(.separator), lineWidth: 1)
                    )
                    .onTapGesture {
                        withAnimation {
                            self.isEditing = true
                        }
                    }
            }

            if self.isEditing {
                HStack {
                    clearAction
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded { _ in
                                    clear()
                                }
                        )
                        .disabled(drawings.isEmpty)
                    Spacer()
                    saveAction
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded { _ in
                                    isSaved = true
                                }
                        )
                        .disabled(drawings.isEmpty)
                }.padding(.top, 11)
            } else if (_signatureImage != nil && !isReenterTapped) || fullSignatureImage != nil {
                restartAction
                    .simultaneousGesture(
                        TapGesture()
                            .onEnded { _ in
                                clear()
                                onDelete()
                                isReenterTapped = true
                                self.isEditing = true
                            }
                    )
                    .padding(.top, 11)
            }
        }
        .padding(EdgeInsets(top: 11, leading: 16, bottom: isEditing || (_signatureImage != nil && !isReenterTapped) ? 11 : 16, trailing: 16))
        .background(VStackPreferenceSetter())
        .onPreferenceChange(VStackPreferenceKey.self) { heights in
            guard let height = heights.first else {
                return
            }
            self._heightDidChangePublisher.send(height)
        }
        .background(Color.preferredColor(.cellBackground))
    }

    @ViewBuilder var drawingArea: some View {
        if self.isEditing {
            ZStack(alignment: .bottom) {
                ScribbleView(image: $fullSignatureImage, currentDrawing: $currentDrawing, drawings: $drawings, isSaved: $isSaved, isEditing: $isEditing, onSave: self.onSave(_:), strokeWidth: strokeWidth, strokeColor: strokeColor, drawingViewBackgroundColor: drawingViewBackgroundColor, cropsImage: cropsImage)
                    .frame(maxWidth: .infinity, minHeight: 256, maxHeight: _drawingViewMaxHeight)
                HStack(alignment: .bottom) {
                    Image(systemName: "xmark")
                        .foregroundColor(xmarkColor)
                        .font(.body)
                        .setHidden(self.hidesXmark)
                    Rectangle()
                        .foregroundColor(signatureLineColor)
                        .frame(height: 1)
                        .setHidden(self.hidesSignatureLine)
                }
                .padding([.leading, .trailing]).padding(.bottom, 30)
            }
        } else {
            ZStack(alignment: .bottom) {
                ZStack {
                    Color.preferredColor(.quarternaryFill).cornerRadius(10)
                    startAction
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded { _ in
                                    self.isEditing = true
                                }
                        )
                        .font(.body)
                        .foregroundColor(Color.preferredColor(.tintColor))
                }
                .frame(maxWidth: .infinity, minHeight: 256, maxHeight: _drawingViewMaxHeight)
                HStack(alignment: .bottom) {
                    Image(systemName: "xmark")
                        .foregroundColor(xmarkColor.opacity(0.4))
                        .font(.body)
                        .setHidden(self.hidesXmark)
                    Rectangle()
                        .foregroundColor(signatureLineColor.opacity(0.4))
                        .frame(height: 1)
                        .setHidden(self.hidesSignatureLine)
                }
                .padding([.leading, .trailing]).padding(.bottom, 30)
            }
        }
    }

    func setEditing() {
        self.isEditing = true
    }

    func clear() {
        fullSignatureImage = nil
        currentDrawing = Drawing()
        drawings.removeAll()
    }

    func onSave(_ uiImage: UIImage) {
        _onSave?(uiImage)
    }

    func onDelete() {
        _onDelete?()
    }
}

// View modifiers
public extension SignatureCaptureView {
    /**
     A view modifier to set the title font.

     The default is `Font.body`.

     - parameter width: The desired stroke width.
     */
    func titleFont(_ font: Font?) -> Self {
        guard let font = font else {
            return self
        }
        var newSelf = self
        newSelf.titleFont = font
        return newSelf
    }

    /**
     A view modifier to set the title text color.

     The default is `Color.preferredColor(.primaryLabel)`.

     - parameter width: The desired stroke width.
     */
    func titleColor(_ color: Color?) -> Self {
        guard let color = color else {
            return self
        }
        var newSelf = self
        newSelf.titleColor = color
        return newSelf
    }

    /**
     A view modifier to set the stroke width.

     The default stroke width is 3 px.

     - parameter width: The desired stroke width.
     */
    func strokeWidth(_ width: CGFloat) -> Self {
        var newSelf = self
        newSelf.strokeWidth = width
        return newSelf
    }

    /**
     A view modifier to set the stroke color.

     The default stroke color is Fiori color style ".primaryLabel".

     - parameter width: The desired stroke color.
     */
    func strokeColor(_ color: Color) -> Self {
        var newSelf = self
        newSelf.strokeColor = color
        return newSelf
    }

    /**
     A view modifier to set the drawing area background color.

     The default background color is Fiori color style ".primaryBackground".

     - parameter width: The desired stroke color.
     */
    func drawingViewBackgroundColor(_ color: Color) -> Self {
        var newSelf = self
        newSelf.drawingViewBackgroundColor = color
        return newSelf
    }

    /**
     A view modifier to set the maximum height of the drawing area.

     - parameter height: The maximum height of the drawing area. Set it to `nil` indicates to use the max height of the device screen.
     */
    func _drawingViewMaxHeight(_ height: CGFloat?) -> Self {
        var newSelf = self
        newSelf._drawingViewMaxHeight = height

        return newSelf
    }

    /**
     A view modifier to set if the saved image should crop the extra spaces or not. The default is not to crop.

     - parameter cropsImage: Indicates if the saved image should crop the extra spaces or not.
     */
    func cropsImage(_ cropsImage: Bool) -> Self {
        var newSelf = self
        newSelf.cropsImage = cropsImage
        return newSelf
    }

    /**
     A view modifier to set the color of the "X" mark.

     - parameter color: The desired color of the "X" mark.
     */
    func xmarkColor(_ color: Color?) -> Self {
        guard let color = color else {
            return self
        }
        var newSelf = self
        newSelf.xmarkColor = color
        return newSelf
    }

    /**
     A view modifier to set the color of the signature line.

     - parameter color: The desired color for the signature line.
     */
    func signatureLineColor(_ color: Color?) -> Self {
        guard let color = color else {
            return self
        }
        var newSelf = self
        newSelf.signatureLineColor = color
        return newSelf
    }

    /**
     A view modify to indicate to hide XMark or not.

     - parameter hidesXmark: Set this to true to hide the X Mark.
     */
    func hidesXmark(_ hidesXmark: Bool) -> Self {
        var newSelf = self
        newSelf.hidesXmark = hidesXmark
        return newSelf
    }

    /**
     A view modify to indicate to hide XMark or not.

     - parameter hidesSignatureLine: Set this to true to hide the signature line.
     */
    func hidesSignatureLine(_ hidesSignatureLine: Bool) -> Self {
        var newSelf = self
        newSelf.hidesSignatureLine = hidesSignatureLine
        return newSelf
    }
}

private struct VStackPreferenceKey: PreferenceKey {
    static var defaultValue: [CGFloat] = []
    static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
        value.append(contentsOf: nextValue())
    }
}

private struct VStackPreferenceSetter: View {
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(Color.clear)
                .preference(key: VStackPreferenceKey.self,
                            value: [geometry.size.height])
        }
    }
}

extension View {
    @ViewBuilder func setHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
