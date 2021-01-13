//
//  SignatureInlineView.swift
//  FioriSwiftUICore
//
//  Created by Wirjo, Fred on 12/30/20.
//

import SwiftUI

public struct SignatureViewInline: View {
    
    @State private var currentDrawing: Drawing = Drawing()
    @State private var drawings: [Drawing] = [Drawing]()
    @State private var imageStrokeColor: Color = Color.black
    @State private var strokeWidth: CGFloat = 3.0
    @State private var isSignatureEditable = false
    @State private var isSaved = false
    @State private var rect1: CGRect = .zero
    @State var imageView: Image? = nil
    
    
    var body: some View {
        GeometryReader { geometry in
            if !isSignatureEditable {
                VStack {
                    HStack {
                        Text("Signature*")
                        Spacer()
                    }
                    ZStack {
                        Color.gray
                        Text("Tap to Sign")
                    }
                    .frame(width: geometry.size.width, height: 300)
                    .overlay(
                            RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray, lineWidth: 4)
                    )
                    .onTapGesture {
                        isSignatureEditable = true
                    }
                }
            } else {
                VStack {
                    HStack {
                        Text("Signature*")
                        Spacer()
                        Button(action: {
                            drawings.removeAll()
                            isSaved = false
                            self.imageView = nil
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
                                           color: $imageStrokeColor,
                                           lineWidth: $strokeWidth)
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
                                drawings.removeAll()
                            }) {
                                Text("Clear")
                            }.disabled(drawings.isEmpty)
                            Spacer()
                            Button(action: {
                                isSaved = true
                                let uimage = UIApplication.shared.windows[0].rootViewController?.view.asImage(rect: self.rect1)
                                let imageview = Image(uiImage: uimage!)
                                self.imageView = imageview
                            }) {
                                Text("Save")
                            }.disabled(drawings.isEmpty)
                        } else {
                            Button(action: {
                                drawings.removeAll()
                                self.imageView = nil
                                isSaved = false
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
