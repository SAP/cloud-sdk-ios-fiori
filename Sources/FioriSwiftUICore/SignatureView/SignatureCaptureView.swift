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
    
    /// An optional closure for handling save button tap action
    public var onSave: ((Result) -> Void)?
    
    /// An optional closure for handling cancel button tap action
    public var onCancel: (() -> Void)?
    
    /// :nodoc:
    public private(set) var _heightDidChangePublisher = CurrentValueSubject<CGFloat, Never>(0)
    
    /// Initializes and returns a segmented control with segments having the given titles.
    /// - Parameters:
    ///   - strokeWidth: Stroke width for drawing lines
    ///   - imageStrokeColor: Stroke color for drawing lines
    ///   - backgroundColor: Background color of the drawing pad
    public init(strokeWidth: CGFloat = 3.0, imageStrokeColor: Color = Color.preferredColor(.primaryLabel), backgroundColor: Color = Color.preferredColor(.primaryBackground), onSave: ((Result) -> Void)? = nil, onCancel: (() -> Void)? = nil) {
        self.strokeWidth = strokeWidth
        self.imageStrokeColor = imageStrokeColor
        self.backgroundColor = backgroundColor
        self.onSave = onSave
        self.onCancel = onCancel
    }
    
    struct VStackPreferenceKey: PreferenceKey {
        typealias Value = [CGFloat]

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
    
    public var body: some View {
        VStack {
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
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.preferredColor(.separator), lineWidth: 1)
                    )
                    .onTapGesture {
                        withAnimation {
                            self.isEditing = true
                        }
                    }
                }.padding(16)
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
                                       onSave: self.onSave,
                                       strokeColor: self.imageStrokeColor,
                                       lineWidth: self.strokeWidth,
                                       backgroundColor: self.backgroundColor)
                                .foregroundColor(Color.preferredColor(.cellBackground))
                                .frame(minHeight: 300)
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
                }.padding(16)
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
}

public extension SignatureCaptureView {
    /// Result holds an `Image` and a `UIImage` type for the same signature image
    struct Result {
        /// Signature Image
        public let image: Image
        /// SIgnature UIImage
        public let uiImage: UIImage
    }
}
