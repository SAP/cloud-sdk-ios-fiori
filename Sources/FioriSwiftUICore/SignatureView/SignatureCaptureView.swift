import Combine
import SwiftUI

/**
 A SignatureCaptureView object is used to draw and capture a user's signature.
 */
public struct SignatureCaptureView: View {
    /// Stroke width for drawing lines
    public let strokeWidth: CGFloat
    
    /// Stroke color for drawing lines
    public let imageStrokeColor: Color
    
    /// Background color of the drawing pad
    public let backgroundColor: Color
    
    public var _onSave: ((UIImage) -> Void)?
    public var onSave: ((Image) -> Void)?
    
    public var onCancel: (() -> Void)?
    
    /// Initializes and returns a segmented control with segments having the given titles.
    /// - Parameters:
    ///   - strokeWidth: Stroke width for drawing lines
    ///   - imageStrokeColor: Stroke color for drawing lines
    ///   - backgroundColor: Background color of the drawing pad
    public init(strokeWidth: CGFloat = 3.0, imageStrokeColor: Color = Color.preferredColor(.primaryLabel), backgroundColor: Color = Color.preferredColor(.primaryBackground), _onSave: ((UIImage) -> Void)? = nil, onSave: ((Image) -> Void)? = nil, onCancel: (() -> Void)? = nil) {
        self.strokeWidth = strokeWidth
        self.imageStrokeColor = imageStrokeColor
        self.backgroundColor = backgroundColor
        self._onSave = _onSave
        self.onSave = onSave
        self.onCancel = onCancel
    }
    
    @State private var currentDrawing = Drawing()
    @State private var drawings = [Drawing]()
    @State private var isEditing = false
    @State private var isSaved = false
    
    public var body: some View {
        GeometryReader { _ in
            if !self.isEditing {
                VStack {
                    HStack {
                        Text(NSLocalizedString("Signature", comment: "Signature"))
                        Spacer()
                    }
                    ZStack {
                        Color.preferredColor(.quarternaryFill).cornerRadius(10)
                        Text(NSLocalizedString("Tap to Sign", comment: "Tap to Sign")).foregroundColor(Color.preferredColor(.tintColor)).font(.body)
                    }
                    // .frame(width: geometry.size.width, height: 300)
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
            } else {
                VStack {
                    HStack {
                        Text(NSLocalizedString("Signature", comment: "Signature"))
                        Spacer()
                        if !self.isSaved {
                            Button(action: {
                                self.drawings.removeAll()
                                self.isSaved = false
                                self.onCancel?()
                                self.isEditing = false
                            }) {
                                Text(NSLocalizedString("Cancel", comment: "Cancel"))
                            }
                        }
                    }
                    ZStack {
                        ZStack(alignment: .bottom) {
                            DrawingPad(currentDrawing: self.$currentDrawing,
                                       drawings: self.$drawings,
                                       isSave: self.$isSaved,
                                       _onSave: self._onSave,
                                       onSave: self.onSave,
                                       strokeColor: self.imageStrokeColor,
                                       lineWidth: self.strokeWidth,
                                       backgroundColor: self.backgroundColor)
                                .foregroundColor(Color.preferredColor(.cellBackground))
                            if !self.isSaved {
                                HStack {
                                    Image(systemName: "xmark")
                                        .foregroundColor(Color.preferredColor(.quarternaryLabel))
                                        .font(.body)
                                        .opacity(0.4)
                                    Rectangle().background(Color.preferredColor(.quarternaryLabel)).opacity(0.4).frame(height: 1)
                                }.padding([.leading, .trailing]).padding(.bottom, 30)
                            }
                        }
                        
                        if !self.isSaved {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.preferredColor(.separator), lineWidth: 1)
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.preferredColor(.separator), lineWidth: 1)
                                .background(Color.preferredColor(.quarternaryFill)).cornerRadius(10)
                        }
                    }
                    HStack {
                        if !self.isSaved {
                            Button(action: {
                                self.drawings.removeAll()
                            }) {
                                Text(NSLocalizedString("Clear", comment: "Clear"))
                            }.disabled(self.drawings.isEmpty)
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    self.isSaved = true
                                }
                            }) {
                                Text(NSLocalizedString("Save", comment: "Save"))
                            }.disabled(self.drawings.isEmpty)
                        } else {
                            Button(action: {
                                withAnimation {
                                    self.drawings.removeAll()
                                    self.onCancel?()
                                    self.isSaved = false
                                }
                            }) {
                                Text(NSLocalizedString("Re-enter Signature", comment: "Re-enter Signature"))
                            }
                        }
                    }
                }
            }
        }.padding(16) // .frame(height: 298)
    }
}
