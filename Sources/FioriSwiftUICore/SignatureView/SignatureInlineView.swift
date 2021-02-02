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

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.sRGB, red: 50/255, green: 54/255, blue: 58/255, opacity: 1))
    }
}

extension Color {
    static let lightGrayColor = Color(.sRGB, red: 137/255, green: 145/255, blue: 154/255, opacity: 0.12)
    static let otherLightGrayColor = Color(.sRGB, red: 50/255, green: 54/255, blue: 58/255, opacity: 0.55)
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
                        Color.lightGrayColor
                        Text("Tap to Sign")
                    }
                    .frame(width: geometry.size.width, height: 300)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.sRGB, red: 137/255, green: 145/255, blue: 154/255, opacity: 0.12), lineWidth: 1)
                    )
                    .onTapGesture {
                        self.isSignatureEditable = true
                    }
                }.frame(height: 258)
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
                                    Text("X").foregroundColor(Color.otherLightGrayColor)
                                        .font(.system(size: 17))
                                        .fontWeight(.regular)
                                        .kerning(-0.41)
                                        .frame(width: 17, height: 22)
                                    Rectangle().background(Color.otherLightGrayColor).frame(width: 270, height: 1)
                                }.padding([.leading, .trailing]).padding(.bottom, 40)
                            } else {
                                imageView
                            }
                        }.frame(width: geometry.size.width, height: 300)
                        
                        if !isSaved {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.lightGrayColor, lineWidth: 1)
                        } else {
                            
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.lightGrayColor, lineWidth: 1)
                                .background(Color.lightGrayColor.opacity(0.5))
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
        }.padding(16).frame(height: 298)
    }
 }
