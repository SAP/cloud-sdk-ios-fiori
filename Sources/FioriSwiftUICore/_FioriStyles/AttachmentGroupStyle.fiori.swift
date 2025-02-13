import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentGroupBaseStyle: AttachmentGroupStyle {
    @State var context = AttachmentContext()
    @State private var showingConfirmation = false

    public func makeBody(_ configuration: AttachmentGroupConfiguration) -> some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.adaptive(minimum: 110), alignment: .top), count: 1), spacing: 10) {
                configuration.menu
                    .environment(self.context)
                
                ForEach(0 ..< configuration.urls.count, id: \.self) { index in
                    if let (fileURL, name, fileSize, fileModificationDate) = getFileInfo(fileUrl: configuration.urls[index]) {
                        Attachment(url: fileURL) {
                            Text("\(name)")
                        } subtitle: {
                            if let fileSize {
                                Text(format(size: fileSize))
                            }
                        } timestamp: {
                            if let fileModificationDate {
                                Text(format(date: fileModificationDate))
                            }
                        }
                        .onTapGesture {
                            configuration.onPreview?(index)
                        }
                        .contextMenu {
                            Button {
                                print("Preview")
                            } label: {
                                Label("Preview", systemImage: "viewfinder")
                            }
                            
                            Button(role: .destructive) {
                                self.showingConfirmation.toggle()
                            } label: {
                                Label("Delete", systemImage: "delete.left")
                            }
                        }
                    }
                }
            }
        }
        .alert("Delete Attachment?", isPresented: self.$showingConfirmation) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {
                print("Attachment deleted")
            }
        }
//        .confirmationDialog("Delete Attachment", isPresented: $showingConfirmation) {
//            Button("Cancel", role: .cancel) { }
//            Button("Delete", role: .destructive) {
//                print("Attachment deleted")
//            }
//        } message: {
//            Text("Delete Attachment?")
//        }
    }
}

// Default fiori styles
extension AttachmentGroupFioriStyle {
    struct ContentFioriStyle: AttachmentGroupStyle {
        func makeBody(_ configuration: AttachmentGroupConfiguration) -> some View {
            AttachmentGroup(configuration)
            // Add default style for its content
            // .background()
        }
    }
}

extension AttachmentGroupBaseStyle {
    func getFileInfo(fileUrl: URL) -> (URL, String, Int?, Date?)? {
        guard let resourceValues = try? fileUrl.resourceValues(forKeys: [.fileSizeKey, .creationDateKey, .contentModificationDateKey, .nameKey]) else { return nil }
        return (fileUrl, fileUrl.lastPathComponent, resourceValues.fileSize, resourceValues.contentModificationDate)
    }
    
    func format(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm"
        return formatter.string(from: date)
    }
    
    func format(size: Int) -> String {
        ByteCountFormatter.string(fromByteCount: Int64(size), countStyle: .file)
    }
}
