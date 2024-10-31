import FioriSwiftUICore
import PDFKit
import SwiftUI

struct DocumentScannerViewExample: View {
    @State private var isScannerPresented = false
    @State private var scannedImages: [UIImage] = []
    @State private var pdfDocument: PDFDocument?
    @State private var isPDFDocument: Bool = false
    @State private var pdfIdentifier = 0
    
    var body: some View {
        VStack {
            Toggle("Scan PDF Document", isOn: self.$isPDFDocument)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            ScrollView {
                LazyVStack(content: {
                    if self.isPDFDocument, let pdfDoc = self.pdfDocument {
                        Text("PDF Viewer")
                            .foregroundColor(.accentColor)
                        PDFKitView(pdfDocument: pdfDoc, id: self.pdfIdentifier)
                            .scaledToFill()
                    } else {
                        ForEach(self.scannedImages, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300)
                        }
                    }
                })
                .background(Color.preferredColor(.grey1))
            }
        }
        .navigationTitle("Document Scanner")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    self.isScannerPresented.toggle()
                } label: {
                    Image(systemName: "doc.viewfinder")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.blue)
                }
                .buttonStyle(.plain)
                .fontWeight(.bold)
            }
        }
        .fullScreenCover(isPresented: self.$isScannerPresented) {
            DocumentScannerView(onCompletion: { result in
                switch result {
                case .success(.images(let images)):
                    self.scannedImages = images
                    self.pdfDocument = nil
                case .success(.pdf(let pdf)):
                    self.pdfDocument = pdf
                    self.pdfIdentifier += 1
                    self.scannedImages = []
                case .failure(let error):
                    print("Failed to scan: \(error)")
                }
            }, outputFormat: self.isPDFDocument ? .pdf : .images)
        }
    }
}

struct PDFKitView: UIViewRepresentable {
    let pdfDocument: PDFDocument
    let id: Int
    
    func makeUIView(context: UIViewRepresentableContext<PDFKitView>) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = self.pdfDocument
        return pdfView
    }
    
    func updateUIView(_ pdfView: PDFView, context: Context) {
        pdfView.document = self.pdfDocument
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
