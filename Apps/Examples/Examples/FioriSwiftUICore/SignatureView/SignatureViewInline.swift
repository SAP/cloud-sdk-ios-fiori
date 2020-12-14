//
//  SignatureViewInline.swift
//  Examples
//
//  Created by Wirjo, Fred on 11/23/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SwiftUI

struct SignatureViewInline: View {
    
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

class HostingCell: UITableViewCell {
    var host: UIHostingController<AnyView>?
}

struct UIList: UIViewRepresentable {

    func makeUIView(context: Context) -> UITableView {
        let collectionView = UITableView(frame: .zero, style: .plain)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        collectionView.register(HostingCell.self, forCellReuseIdentifier: "Cell")
        return collectionView
    }

    func updateUIView(_ uiView: UITableView, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HostingCell

            let view = SignatureViewInline()

            // create & setup hosting controller only once
            if tableViewCell.host == nil {
                let controller = UIHostingController(rootView: AnyView(view))
                tableViewCell.host = controller

                let tableCellViewContent = controller.view!
                tableCellViewContent.translatesAutoresizingMaskIntoConstraints = false
                tableViewCell.contentView.addSubview(tableCellViewContent)
                tableCellViewContent.topAnchor.constraint(equalTo: tableViewCell.contentView.topAnchor).isActive = true
                tableCellViewContent.leftAnchor.constraint(equalTo: tableViewCell.contentView.leftAnchor).isActive = true
                tableCellViewContent.bottomAnchor.constraint(equalTo: tableViewCell.contentView.bottomAnchor).isActive = true
                tableCellViewContent.rightAnchor.constraint(equalTo: tableViewCell.contentView.rightAnchor).isActive = true
            } else {
                // reused cell, so just set other SwiftUI root view
                tableViewCell.host?.rootView = AnyView(view)
            }
            tableViewCell.setNeedsLayout()
            return tableViewCell
        }
    }
}
