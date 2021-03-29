import SwiftUI

struct SignatureView: View {
    /// Stroke width for drawing lines
    let strokeWidth: CGFloat
    
    /// Stroke color for drawing lines
    let imageStrokeColor: Color
    
    /// Background color of the drawing pad
    let backgroundColor: Color
    
    public var onSave: ((UIImage) -> Void)?
    
    public var onCancel: (() -> Void)?
    
    @State private var currentDrawing = Drawing()
    @State private var drawings = [Drawing]()
    @State private var rect1: CGRect = .zero
    @State private var shouldRemoveWhitespace = true
    @State private var isSaved = false
    
    init(strokeWidth: CGFloat = 3.0, imageStrokeColor: Color = Color.preferredColor(.primaryLabel), backgroundColor: Color = Color.preferredColor(.primaryBackground), onSave: ((UIImage) -> Void)? = nil, onCancel: (() -> Void)? = nil) {
        self.strokeWidth = strokeWidth
        self.imageStrokeColor = imageStrokeColor
        self.backgroundColor = backgroundColor
        self.onSave = onSave
        self.onCancel = onCancel
    }
    
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .center) {
                HStack {
                    Button(action: {
                        self.drawings.removeAll()
                        self.onCancel?()
                    }) {
                        Text("Cancel")
                    }
                    Spacer()
                    Button(action: {
                        if self.shouldRemoveWhitespace {
                            var maxX = -1 * CGFloat.greatestFiniteMagnitude
                            var maxY = -1 * CGFloat.greatestFiniteMagnitude
                            var minX = CGFloat.greatestFiniteMagnitude
                            var minY = CGFloat.greatestFiniteMagnitude
                            
                            for drawing in self.drawings {
                                if drawing.maxX > maxX { maxX = drawing.maxX }
                                if drawing.maxY > maxY { maxY = drawing.maxY }
                                if drawing.minX < minX { minX = drawing.minX }
                                if drawing.minY < minY { minY = drawing.minY }
                            }
                            
                            let rectWidth = maxX - minX < 100 ? 100 : maxX - minX
                            let rectHeight = maxY - minY < 100 ? 100 : maxY - minY
                            self.rect1 = CGRect(x: minX + self.rect1.minX, y: minY + self.rect1.minY, width: rectWidth, height: rectHeight)
                        }
                        
                        let imageSaver = ImageSaver()
                        guard let uimage = UIApplication.shared.windows[0].rootViewController?.view.asImage(rect: self.rect1) else { return }
                        imageSaver.writeToPhotoAlbum(image: uimage)
                        self.onSave?(uimage)
                        self.drawings.removeAll()
                    }) {
                        Text("Done")
                    }

                }.padding([.leading, .trailing])
                DrawingPad(currentDrawing: self.$currentDrawing,
                           drawings: self.$drawings,
                           isSave: self.$isSaved,
                           onSave: self.onSave,
                           strokeColor: self.imageStrokeColor,
                           lineWidth: self.strokeWidth,
                           backgroundColor: self.backgroundColor)
                    .background(RectGetter(rect: self.$rect1))
                HStack {
                    Text("X")
                        .font(.system(size: 17))
                        .fontWeight(.regular)
                        .kerning(-0.41)
                        .frame(width: 17, height: 22)
                    Rectangle().frame(width: 270, height: 1)
                }.frame(height: 40).padding([.leading, .trailing]).padding(.bottom, 40)
            }
        }
    }
}

struct SignatureView_Previews: PreviewProvider {
    static var previews: some View {
        SignatureView()
    }
}
