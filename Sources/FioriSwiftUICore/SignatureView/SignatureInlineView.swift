//
//  SignatureInlineView.swift
//  FioriSwiftUICore
//
//  Created by Wirjo, Fred on 12/30/20.
//

import SwiftUI

extension SignatureViewInline {
    class Model: ObservableObject {
        @Published var imageStrokeColor: Color = Color.black
        @Published var strokeWidth: CGFloat = 3.0
    }
}

public struct SignatureViewInline: View {
    
    public var strokeWidth: CGFloat {
        get {
            return model.strokeWidth
        } set {
            model.strokeWidth = newValue
        }
    }
    
    public var imageStrokeColor: Color {
        get {
            return model.imageStrokeColor
        } set {
            model.imageStrokeColor = newValue
        }
    }
    
    @ObservedObject private var model: Model = Model()
    
    public init(strokeWidth: CGFloat = 3.0, imageStrokeColor: Color = Color.black) {
        self.strokeWidth = strokeWidth
        self.imageStrokeColor = imageStrokeColor
    }
    
    @State private var currentDrawing: Drawing = Drawing()
    @State private var drawings: [Drawing] = [Drawing]()
    @State private var isSignatureEditable = false
    @State private var isSaved = false
    @State private var rect1: CGRect = .zero
    @State private var imageView: Image? = nil
    
    public var body: some View {
        GeometryReader { geometry in
            if !isSignatureEditable {
                VStack {
                    HStack {
                        Text("Signature*")
                        Spacer()
                    }
                    ZStack {
                        Color(.sRGB, red: 137/255, green: 145/255, blue: 154/255, opacity: 0.12)
                        Text("Tap to Sign")
                    }
                    .frame(width: geometry.size.width, height: 300)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.sRGB, red: 137/255, green: 145/255, blue: 154/255, opacity: 0.12), lineWidth: 4)
                    )
                    .onTapGesture {
                        self.isSignatureEditable = true
                    }
                }
            } else {
                VStack {
                    HStack {
                        Text("Signature*")
                        Spacer()
                        Button(action: {
                            self.drawings.removeAll()
                            isSaved = false
                            imageView = nil
                            isSignatureEditable = false
                        }) {
                            Text("Cancel")
                        }
                    }
                    ZStack {
                        VStack(alignment: .center) {
                            if imageView == nil {
                                DrawingPad(currentDrawing: $currentDrawing,
                                           drawings: $drawings,
                                           color: $model.imageStrokeColor,
                                           lineWidth: $model.strokeWidth)
                                    .background(RectGetter(rect: $rect1))
                                HStack {
                                    Image(systemName: "xmark")
                                    Rectangle().background(Color.black).frame(width: 250, height: 1)
                                }.padding([.leading, .trailing])
                            } else {
                                imageView
                            }
                        }.frame(width: geometry.size.width, height: 300)
                        
                        if !isSaved {
                            RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray, lineWidth: 4)
                        } else {
                            
                            RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray, lineWidth: 4)
                            .background(Color.gray.opacity(0.5))
                        }
                    }
                    Divider()
                    HStack {
                        if !isSaved {
                            Button(action: {
                                self.drawings.removeAll()
                            }) {
                                Text("Clear")
                            }.disabled(self.drawings.isEmpty)
                            Spacer()
                            Button(action: {
                                self.isSaved = true
                                let uimage = UIApplication.shared.windows[0].rootViewController?.view.asImage(rect: self.rect1)
                                let tempimageview = Image(uiImage: uimage!)
                                self.imageView = tempimageview
                            }) {
                                Text("Save")
                            }.disabled(self.drawings.isEmpty)
                        } else {
                            Button(action: {
                                self.drawings.removeAll()
                                self.imageView = nil
                                self.isSaved = false
                            }) {
                                Text("Re-enter Signature")
                            }
                        }
                    }
                }
            }
        }.frame(height: 500)
    }
 }
