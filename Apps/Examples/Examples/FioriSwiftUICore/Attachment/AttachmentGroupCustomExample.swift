import FioriSwiftUICore
import PhotosUI
import SwiftUI

struct AttachmentGroupCustomExample: View {
    @State var urls = [
        Bundle.main.url(forResource: "Text File Example", withExtension: "txt")!,
        Bundle.main.url(forResource: "XML File Example", withExtension: "xml")!,
        Bundle.main.url(forResource: "HTML File Example", withExtension: "html")!
    ]
    
    @State var previewUrl: URL? = nil
    
    @State var previewIndex: Int = 0
    
    @State private var showFileImporter = false
    
    @State private var showPhotoPicker = false
    @State var images = [UIImage]()
    @State var selectedPhotos = [PhotosPickerItem]()
    
    @State private var defaultPreview: Bool = true
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView { // no scroll view, then toggle stops working. why?
            VStack {
                Toggle(self.defaultPreview ? "SwiftUI QuickLookPreview" : "Custom Preview", isOn: self.$defaultPreview)
                    .padding()
                
                AttachmentGroup(readonly: true, maxCount: 20, urls: self.$urls) {
                    self.previewIndex = $0
                    self.previewUrl = self.urls[self.previewIndex]
                } menu: {
                    Image(systemName: "plus")
                        .foregroundColor(self.colorScheme == .dark ? .white : .blue)
                        .font(.system(size: 24))
                        .padding()
                        .frame(width: 90, height: 90)
                        .overlay(
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5, 5]))
                                .foregroundColor(self.colorScheme == .dark ? .white : .blue)
                        )
                        .operationsOverlay {
                            self.overlayMenu
                        }
                        .frame(width: 109, height: 109)
                } onAdd: { _ in
                    
                } onDelete: { index in
                    self.urls.remove(at: index)
                    // delete physical file here
                }
                .modifier {
                    if self.defaultPreview {
                        // default SwiftUI QuickLookPreivew
                        $0.quickLookPreview(self.$previewUrl, in: self.$urls.wrappedValue)
                    } else {
                        // custom preview
                        $0.fullScreenCover(isPresented: self.shouldShowPreview) {
                            AttachmentPreview(urls: self.$urls, previewIndex: self.$previewIndex) { index in
                                print("Delete atttachment \(index)")
                                self.urls.remove(at: index)
                            } onDismiss: {
                                self.previewUrl = nil
                            }
                        }
                    }
                }
                .fileImporter(
                    isPresented: self.$showFileImporter,
                    allowedContentTypes: [.pdf, .text, .png, .plainText],
                    allowsMultipleSelection: false
                ) { result in
                    switch result {
                    case .success(let files):
                        files.forEach { file in
                            let gotAccess = file.startAccessingSecurityScopedResource()
                            if !gotAccess { return }
                            // handleSelectedFile(url: file)
                            file.stopAccessingSecurityScopedResource()
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
                .sheet(isPresented: self.$showPhotoPicker) {
                    PhotosPicker(
                        "Pick a photo",
                        selection: self.$selectedPhotos,
                        maxSelectionCount: 1, // make sure alwasy to use 1
                        selectionBehavior: .ordered,
                        matching: .images
                    )
                    .photosPickerStyle(.inline)
                }
                .onChange(of: self.selectedPhotos) { _, _ in
                    //                convertDataToImage()
                }
                .padding()
            }
        }
    }
    
    var shouldShowPreview: Binding<Bool> {
        Binding<Bool> {
            self.previewUrl != nil
        } set: {
            if $0 == false {
                self.previewUrl = nil
            }
        }
    }
    
    var overlayMenu: some View {
        func getOffsetX(index: Int, count: Int) -> CGFloat {
            let radius: CGFloat = 35
            let angle = CGFloat.pi * 1.5 / CGFloat(max(count - 1, 1))
            let elementAngle = CGFloat.pi * 1.25 + angle * CGFloat(index)
            return radius * cos(elementAngle)
        }
        
        func getOffsetY(index: Int, count: Int) -> CGFloat {
            let radius: CGFloat = 35
            let angle = CGFloat.pi * 1.5 / CGFloat(max(count - 1, 1))
            let elementAngle = CGFloat.pi * 1.25 + angle * CGFloat(index)
            return radius * sin(elementAngle)
        }

        return ZStack {
            Image(systemName: "camera")
                .font(.body)
                .foregroundStyle(.white)
                .padding(6)
                .background(.red)
                .clipShape(Circle())
                .offset(x: getOffsetX(index: 0, count: 6), y: getOffsetY(index: 0, count: 6))
                .onTapGesture {
                    self.showPhotoPicker.toggle()
                }
            
            Image(systemName: "photo")
                .font(.body)
                .foregroundStyle(.white)
                .padding(6)
                .background(.orange)
                .clipShape(Circle())
                .offset(x: getOffsetX(index: 1, count: 6), y: getOffsetY(index: 1, count: 6))
                .onTapGesture {
                    self.showPhotoPicker.toggle()
                }
            
            Image(systemName: "square.and.arrow.up")
                .font(.body)
                .foregroundStyle(.white)
                .padding(6)
                .background(.yellow)
                .clipShape(Circle())
                .offset(x: getOffsetX(index: 2, count: 6), y: getOffsetY(index: 2, count: 6))
                .onTapGesture {
                    self.showFileImporter.toggle()
                }
            
            Image(systemName: "book.closed.circle")
                .font(.body)
                .foregroundStyle(.white)
                .padding(6)
                .background(.green)
                .clipShape(Circle())
                .offset(x: getOffsetX(index: 3, count: 6), y: getOffsetY(index: 3, count: 6))
                .onTapGesture {}
            
            Image(systemName: "doc.viewfinder")
                .font(.body)
                .foregroundStyle(.white)
                .padding(6)
                .background(.blue)
                .clipShape(Circle())
                .offset(x: getOffsetX(index: 4, count: 6), y: getOffsetY(index: 4, count: 6))
                .onTapGesture {}
            
            // popping default file picker
            MyButton()
                .offset(x: getOffsetX(index: 5, count: 6), y: getOffsetY(index: 5, count: 6))
        }
    }
}

struct MyButton: View {
    @Environment(AttachmentContext.self) var context

    var body: some View {
        Button {
            self.context.showPhotosPicker.toggle()
        } label: {
            Image(systemName: "star.fill")
                .font(.body)
                .foregroundStyle(.white)
                .padding(6)
                .background(.yellow)
                .clipShape(Circle())
        }
    }
}

/*
 let views = [
     Image(systemName: "camera")
         .font(.body)
         .foregroundStyle(.white)
         .padding(6)
         .background(.red)
         .clipShape(Circle())
         .onTapGesture {
             showPhotoPicker.toggle()
         },
     
     Image(systemName: "photo")
         .font(.body)
         .foregroundStyle(.white)
         .padding(6)
         .background(.orange)
         .clipShape(Circle())
         .onTapGesture {
             showPhotoPicker.toggle()
         },
     
     Image(systemName: "square.and.arrow.up")
         .font(.body)
         .foregroundStyle(.white)
         .padding(6)
         .background(.yellow)
         .clipShape(Circle())
         .onTapGesture {
             showFileImporter.toggle()
         },
     
     Image(systemName: "book.closed.circle")
         .font(.body)
         .foregroundStyle(.white)
         .padding(6)
         .background(.green)
         .clipShape(Circle())
         .onTapGesture {
             
         },
     
     Image(systemName: "doc.viewfinder")
         .font(.body)
         .foregroundStyle(.white)
         .padding(6)
         .background(.blue)
         .clipShape(Circle())
         .onTapGesture {
             
         }
     
     ,MyButton()
 ]
 ForEach(0..<views.count, id: \.self) { index in
     let elementAngle = CGFloat.pi * 1.25 + self.angle * CGFloat(index)
     views[index]
         .offset(
             x: self.radius * cos(elementAngle),
             y: self.radius * sin(elementAngle)
         )
 }

 */
