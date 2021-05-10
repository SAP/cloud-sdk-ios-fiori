import Combine
import FioriThemeManager
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

    let bundle = Bundle.module
    let tableName = "FioriSwiftUICore"

    let minHeight: CGFloat
    let maxHeight: CGFloat?
    
    /// An optional closure for handling save button tap action
    public var onSave: ((Result) -> Void)?
    
    /// An optional closure for handling cancel button tap action
    public var onCancel: (() -> Void)?
    
    /// :nodoc:
    public private(set) var _heightDidChangePublisher = CurrentValueSubject<CGFloat, Never>(0)
    
    /// Initializes and returns a segmented control with segments having the given titles.
    /// - Parameters:
    ///   - strokeWidth: Stroke width for drawing lines
    ///
    ///     The default is 3 px
    ///   - imageStrokeColor: Stroke color for drawing lines
    ///   - backgroundColor: Background color of the drawing pad
    ///   - minHeight: The minimum height of the drawing area.
    ///
    ///     The default is 256 px.
    ///   - maxHeight: The maximum height of the drawing area.
    ///
    ///     The default is nil, means not specified.
    ///   - onSave: The block to be executed when user tapped the "Save" button.
    ///   - onCancel: The block to be executed when  user tapped the "Cancel" button.
    public init(strokeWidth: CGFloat = 3.0, imageStrokeColor: Color = Color.preferredColor(.primaryLabel), backgroundColor: Color = Color.preferredColor(.primaryBackground), minHeight: CGFloat = 256, maxHeight: CGFloat? = nil, onSave: ((Result) -> Void)? = nil, onCancel: (() -> Void)? = nil) {
        self.strokeWidth = strokeWidth
        self.imageStrokeColor = imageStrokeColor
        self.backgroundColor = backgroundColor
        self.minHeight = minHeight
        self.maxHeight = maxHeight
        self.onSave = onSave
        self.onCancel = onCancel
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
    
    public var body: some View {
        VStack {
            if !self.isEditing {
                VStack {
                    HStack {
                        Text("Signature", tableName: tableName, bundle: bundle)
                        Spacer()
                    }
                    ZStack {
                        Color.preferredColor(.quarternaryFill).cornerRadius(10)
                        Text("Tap to Sign", tableName: tableName, bundle: bundle).foregroundColor(Color.preferredColor(.tintColor)).font(.body)
                    }
                    .frame(minHeight: minHeight, maxHeight: maxHeight)
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
                        Text("Signature", tableName: tableName, bundle: bundle)
                        Spacer()
                        if !self.isSaved {
                            Button(action: {
                                self.drawings.removeAll()
                                self.isSaved = false
                                self.onCancel?()
                                self.isEditing = false
                            }) {
                                Text("Cancel", tableName: tableName, bundle: bundle)
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
                                .frame(minHeight: minHeight, maxHeight: maxHeight)
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
                                    self.onCancel?()
                                    self.isSaved = false
                                }
                            }) {
                                Text("Re-enter Signature", tableName: tableName, bundle: bundle)
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
