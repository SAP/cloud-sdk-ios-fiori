import Combine
import FioriThemeManager
import SwiftUI

/**
 A SignatureCaptureView object is used to draw and capture a user's signature.
 */
public struct SignatureCaptureView: View {
    let bundle = Bundle.module
    let tableName = "FioriSwiftUICore"
    
    /// An optional closure for handling save button tap action
    public var onSave: ((Result) -> Void)?

    /// An optional closure for handling "Re-enter Signature" button tap action to delete the signature,
    public var onDelete: (() -> Void)?
    
    /// :nodoc:
    public private(set) var _heightDidChangePublisher = CurrentValueSubject<CGFloat, Never>(0)

    /// Initializes and returns a `SignatureCaptureView`.
    /// - Parameters:
    ///   - onSave: The block to be executed when user tapped the "Save" button.
    ///   - onDelete: The block to be executed when  user tapped the "Re-enter Signature" button.
    public init(onSave: ((Result) -> Void)? = nil, onDelete: (() -> Void)? = nil) {
        self.onSave = onSave
        self.onDelete = onDelete
    }
    
    struct VStackPreferenceKey: PreferenceKey {
        static var defaultValue: [CGFloat] = []
        static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
            value.append(contentsOf: nextValue())
        }
    }
    
    struct VStackPreferenceSetter: View {
        var body: some View {
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color.clear)
                    .preference(key: VStackPreferenceKey.self,
                                value: [geometry.size.height])
            }
        }
    }
    
    @State private var currentDrawing = Drawing()
    @State private var drawings = [Drawing]()
    @State private var isEditing = false
    @State private var isSaved = false
    @State private var uiImage: UIImage? = nil
    @State private var savedSignatureImage: UIImage? = nil
    @State private var drawingPadSize: CGSize = .zero
    @State private var displaysSignatureImage = true
    @State private var isReEnterSignagureTapped = false

    // use internal properties so that the unit test could access them
    let _drawingViewMinHeight: CGFloat = 256
    var _drawingViewMaxHeight: CGFloat?
    var strokeWidth: CGFloat = 3.0
    var strokeColor = Color.preferredColor(.primaryLabel)
    var drawingViewBackgroundColor = Color.preferredColor(.primaryBackground)
    var cropsImage = false
    var signatureImage: UIImage?

    public var body: some View {
        VStack {
            if !self.isEditing && !showsSignatureImage() && !showsSavedSignatureImage() {
                VStack {
                    HStack {
                        Text("Signature", tableName: tableName, bundle: bundle)
                        Spacer()
                    }
                    ZStack {
                        Color.preferredColor(.quarternaryFill).cornerRadius(10)
                        Text("Tap to Sign", tableName: tableName, bundle: bundle).foregroundColor(Color.preferredColor(.tintColor)).font(.body)
                    }
                    .frame(minHeight: _drawingViewMinHeight, maxHeight: _drawingViewMaxHeight)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.preferredColor(.separator), lineWidth: 1)
                    )
                    .onTapGesture {
                        withAnimation {
                            self.isEditing = true
                        }
                    }
                }.padding(EdgeInsets(top: 11, leading: 16, bottom: 16, trailing: 16))
            } else {
                VStack {
                    HStack {
                        Text("Signature", tableName: tableName, bundle: bundle)
                        Spacer()
                        if !self.isSaved && !showsImage() {
                            Button(action: {
                                self.drawings.removeAll()
                                self.isSaved = false
                                self.isEditing = false
                                self.uiImage = savedSignatureImage
                                self.displaysSignatureImage = true
                            }) {
                                Text("Cancel", tableName: tableName, bundle: bundle)
                            }
                        }
                    }
                    ZStack {
                        ZStack {
                            ZStack(alignment: .bottom) {
                                DrawingPad(currentDrawing: self.$currentDrawing,
                                           drawings: self.$drawings,
                                           isSave: self.$isSaved,
                                           drawingPadSize: self.$drawingPadSize,
                                           onSave: self.onSave,
                                           strokeColor: self.strokeColor,
                                           lineWidth: self.strokeWidth,
                                           backgroundColor: self.drawingViewBackgroundColor,
                                           cropsImage: self.cropsImage)
                                    .foregroundColor(Color.preferredColor(.cellBackground))
                                    .frame(minHeight: _drawingViewMinHeight, maxHeight: _drawingViewMaxHeight)
                                if !self.isSaved {
                                    HStack {
                                        Image(systemName: "xmark")
                                            .foregroundColor(Color.preferredColor(.quarternaryLabel))
                                            .font(.body)
                                            .opacity(0.4)
                                        Rectangle().background(Color.preferredColor(.quarternaryLabel)).opacity(0.4).frame(height: 1)
                                    }.padding([.leading, .trailing]).padding(.bottom, 30)
                                }
                            }.setHidden(showsImage())
                            if let image = savedSignatureImage ?? (displaysSignatureImage ? signatureImage : nil) {
                                Image(uiImage: image)
                                    .frame(minHeight: _drawingViewMinHeight, maxHeight: _drawingViewMaxHeight)
                                    .cornerRadius(10)
                                    .setHidden(!showsImage())
                            }
                        }
                        
                        if !self.isSaved && !showsSignatureImage() {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.preferredColor(.separator), lineWidth: 1)
                                .frame(minHeight: _drawingViewMinHeight, maxHeight: _drawingViewMaxHeight)
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.preferredColor(.separator), lineWidth: 1)
                                .background(Color.preferredColor(.quarternaryFill)).cornerRadius(10)
                                .frame(minHeight: _drawingViewMinHeight, maxHeight: _drawingViewMaxHeight)
                        }
                    }.padding(.bottom, 8)
                    HStack {
                        if !self.isSaved && !showsImage() {
                            Button(action: {
                                self.drawings.removeAll()
                            }) {
                                Text("Clear", tableName: tableName, bundle: bundle)
                            }.disabled(self.drawings.isEmpty)
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    self.isSaved = true
                                }
                            }) {
                                Text("Save", tableName: tableName, bundle: bundle)
                            }.disabled(self.drawings.isEmpty)
                        } else {
                            Button(action: {
                                withAnimation {
                                    self.drawings.removeAll()
                                    self.isSaved = false
                                    self.isEditing = true
                                    self.uiImage = nil
                                    self.savedSignatureImage = nil
                                    self.displaysSignatureImage = false
                                    self.isReEnterSignagureTapped = true
                                    onDelete?()
                                }
                            }) {
                                Text("Re-enter Signature", tableName: tableName, bundle: bundle)
                            }
                        }
                    }
                }.padding(EdgeInsets(top: 11, leading: 16, bottom: 11, trailing: 16))
            }
        }
        .background(VStackPreferenceSetter())
        .onPreferenceChange(VStackPreferenceKey.self) { heights in
            guard let height = heights.first else {
                return
            }
            self._heightDidChangePublisher.send(height)
        }
    }

    func showsSignatureImage() -> Bool {
        !self.isReEnterSignagureTapped && self.displaysSignatureImage && self.signatureImage != nil
    }

    func showsImage() -> Bool {
        self.uiImage != nil || self.showsSignatureImage()
    }

    func showsSavedSignatureImage() -> Bool {
        self.savedSignatureImage != nil || self.showsSignatureImage()
    }
}

// View modifiers
public extension SignatureCaptureView {
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
     A view modifier to set the signature image.

     - parameter image: The existing signature image.
     */
    func signatureImage(_ image: UIImage) -> Self {
        var newSelf = self
        newSelf.signatureImage = image
        return newSelf
    }
}

public extension SignatureCaptureView {
    /// Result holds an `Image` and a `UIImage` type for the same signature image
    struct Result {
        /// Signature Image
        public let image: Image

        /// SIgnature UIImage
        public let uiImage: UIImage

        // This is the original not-cropped signature image to be displayed after the image is saved
        internal let originalUIImage: UIImage
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
