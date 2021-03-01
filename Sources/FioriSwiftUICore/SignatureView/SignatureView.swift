//
//  SignatureView.swift
//  
//
//  Created by Wirjo, Fred on 11/4/20.
//

import SwiftUI

public struct SignatureView: View {
    
    @State private var currentDrawing: Drawing = Drawing()
    @State private var drawings: [Drawing] = [Drawing]()
    @State private var imageStrokeColor: Color = Color.black
    @State private var strokeWidth: CGFloat = 3.0
    @State private var rect1: CGRect = .zero
    @State private var shouldRemoveWhitespace = true
    @State private var backgroundColor = Color.white
    
    public init() {
        
    }
    
    public var body: some View {
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
                        if shouldRemoveWhitespace {
                            var maxX = -1 * CGFloat.greatestFiniteMagnitude
                            var maxY = -1 * CGFloat.greatestFiniteMagnitude
                            var minX = CGFloat.greatestFiniteMagnitude
                            var minY = CGFloat.greatestFiniteMagnitude
                            
                            for drawing in drawings {
                                if drawing.maxX > maxX { maxX = drawing.maxX }
                                if drawing.maxY > maxY { maxY = drawing.maxY }
                                if drawing.minX < minX { minX = drawing.minX }
                                if drawing.minY < minY { minY = drawing.minY }
                            }
                            
                            let rectWidth = maxX - minX < 100 ? 100 : maxX - minX
                            let rectHeight = maxY - minY < 100 ? 100 : maxY - minY
                            rect1 = CGRect(x: minX+rect1.minX, y: minY+rect1.minY, width: rectWidth, height: rectHeight)
                        }
                        
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
                           strokeColor: $imageStrokeColor,
                           lineWidth: $strokeWidth,
                           backgroundColor: $backgroundColor)
                    .background(RectGetter(rect: $rect1))
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
