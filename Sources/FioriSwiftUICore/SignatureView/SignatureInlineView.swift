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
                        Color.preferredColor(.quarternaryFill).cornerRadius(10)
                        Text("Tap to Sign").foregroundColor(Color.preferredColor(.tintColor)).font(.body)
                    }
                    .frame(width: geometry.size.width, height: 300)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.preferredColor(.separator), lineWidth: 1)
                    )
                    .onTapGesture {
                        withAnimation {
                            self.isSignatureEditable = true
                        }
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
                        if imageView == nil {
                        ZStack(alignment: .bottom) {
                          //  if imageView == nil {
                                DrawingPad(currentDrawing: $currentDrawing,
                                           drawings: $drawings,
                                           color: $model.imageStrokeColor,
                                           lineWidth: $model.strokeWidth)
                                    .background(RectGetter(rect: $rect1))
                                if !isSaved {
                                    HStack {
                                        Image(systemName: "xmark")
                                            .foregroundColor(Color.preferredColor(.quarternaryLabel))
                                            .font(.body)
                                            .opacity(0.4)
                                        Rectangle().background(Color.preferredColor(.quarternaryLabel)).opacity(0.4).frame(width: 270, height: 1)
                                    }.padding([.leading, .trailing]).padding(.bottom, 30)
                                }
                       //     } else {
                       //         imageView
                       //     }
                        }.frame(width: geometry.size.width, height: 300)
                        } else  {
                            imageView
                        }
                        
                        
                        if !isSaved {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.preferredColor(.separator), lineWidth: 1)
                        } else {
                            
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.preferredColor(.separator), lineWidth: 1)
                                .background(Color.preferredColor(.quarternaryFill)).cornerRadius(10)
 
                        }
                    }
                    HStack {
                        if !isSaved {
                            Button(action: {
                                self.drawings.removeAll()
                            }) {
                                Text("Clear")
                            }.disabled(self.drawings.isEmpty)
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    self.isSaved = true
                                }
                                let subviews = UIApplication.shared.windows[0].rootViewController?.view.subviews
                                for view in subviews! {
                                    if view is Drawing {
                                        let tempview = view.asImage(rect: self.rect1)
                                        let tempimageview = Image(uiImage: tempview)
                                        self.imageView = tempimageview
                                    }
                                }
                                //let uimage = UIApplication.shared.windows[0].rootViewController?.view.asImage(rect: self.rect1)
                                //let tempimageview = Image(uiImage: uimage!)
                                //self.imageView = tempimageview
                            }) {
                                Text("Save")
                            }.disabled(self.drawings.isEmpty)
                        } else {
                            Button(action: {
                                withAnimation {
                                    self.drawings.removeAll()
                                    self.imageView = nil
                                    self.isSaved = false
                                }
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
