//
//  SignatureView.swift
//  Examples
//
//  Created by Wirjo, Fred on 11/4/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SwiftUI

struct Drawing {
    public var points: [CGPoint] = [CGPoint]()
}

struct footnoteInfo {
    public var footnoteAlignment: NSTextAlignment?
    public var footnoteFont = UIFont.systemFont(ofSize: 17, weight: .regular)
    public var footnoteColor = UIColor.black
    public var footnoteLine1: NSAttributedString?
    public var footnoteLine2: NSAttributedString?
}

struct DrawingPad: View {
    @Binding var currentDrawing: Drawing
    @Binding var drawings: [Drawing]
    @Binding var color: Color
    @Binding var lineWidth: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for drawing in self.drawings {
                    self.add(drawing: drawing, toPath: &path)
                }
                self.add(drawing: self.currentDrawing, toPath: &path)
            }
            .stroke(self.color, lineWidth: self.lineWidth)
               .background(Color(white: 1))//0.95))
                .gesture(
                    DragGesture(minimumDistance: 0.1)
                        .onChanged({ (value) in
                            let currentPoint = value.location
                            if currentPoint.y >= 0
                                && currentPoint.y < geometry.size.height {
                                self.currentDrawing.points.append(currentPoint)
                            }
                        })
                        .onEnded({ (value) in
                            self.drawings.append(self.currentDrawing)
                            self.currentDrawing = Drawing()
                        })
            )
        }
        .frame(maxHeight: .infinity)
    }
    
    private func add(drawing: Drawing, toPath path: inout Path) {
        let points = drawing.points
        if points.count > 1 {
            for i in 0..<points.count-1 {
                let current = points[i]
                let next = points[i+1]
                path.move(to: current)
                path.addLine(to: next)
            }
        }
    }
    
}

struct SignatureView: View {
    
    @State private var currentDrawing: Drawing = Drawing()
    @State private var drawings: [Drawing] = [Drawing]()
    @State private var imageStrokeColor: Color = Color.black
    @State private var strokeWidth: CGFloat = 3.0
    @State private var rect1: CGRect = .zero
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                HStack {
                    Button(action: {
                        drawings.removeAll()
                    }) {
                        Text("Cancel")
                    }
                    Spacer()
                    Button(action: {
                        let imageSaver = ImageSaver()
                        
                        let uimage = UIApplication.shared.windows[0].rootViewController?.view.asImage(rect: self.rect1)
                        imageSaver.writeToPhotoAlbum(image: uimage!)
                        drawings.removeAll()
                    }) {
                        Text("Done")
                    }

                }.padding([.leading, .trailing])
                DrawingPad(currentDrawing: $currentDrawing,
                           drawings: $drawings,
                           color: $imageStrokeColor,
                           lineWidth: $strokeWidth)
                    .background(RectGetter(rect: $rect1))
                HStack {
                    Image(systemName: "xmark")
                    Rectangle().background(Color.black).frame(width: 250, height: 1)
                }.padding([.leading, .trailing])
            }
        }
    }
}

struct SignatureView_Previews: PreviewProvider {
    static var previews: some View {
        SignatureView()
    }
}

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}

extension UIView {
    func asImage(rect: CGRect) -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: rect)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
struct RectGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { proxy in
            self.createView(proxy: proxy)
        }
    }

    func createView(proxy: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            self.rect = proxy.frame(in: .global)
        }

        return Rectangle().fill(Color.clear)
    }
}
