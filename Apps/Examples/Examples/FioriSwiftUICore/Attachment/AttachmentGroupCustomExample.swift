import FioriSwiftUICore
import PhotosUI
import SwiftUI

struct AttachmentGroupCustomExample: View {
    @State var urls = [
        Bundle.main.url(forResource: "Text File Example", withExtension: "txt")!,
        Bundle.main.url(forResource: "XML File Example", withExtension: "xml")!,
        Bundle.main.url(forResource: "HTML File Example", withExtension: "html")!
    ]
    
    @State private var showFileImporter = false
    @State private var showPhotoPicker = false
    
    @State var images = [UIImage]()
    @State var selectedPhotos = [PhotosPickerItem]()
    
    @State private var errorMessage: AttributedString? = nil
    
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack {
                AttachmentGroup(title: { Text("Attachments") }, attachments: self.$urls, errorMessage: self.$errorMessage) {
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
                            // app's logic goes here
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
                    // app's logic goes here
                }
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
            MyPhotoPickerButton()
                .offset(x: getOffsetX(index: 5, count: 6), y: getOffsetY(index: 5, count: 6))
        }
    }
}

struct MyPhotoPickerButton: View {
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
