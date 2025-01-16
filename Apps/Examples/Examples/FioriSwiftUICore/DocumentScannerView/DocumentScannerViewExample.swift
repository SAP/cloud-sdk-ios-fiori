import FioriSwiftUICore
import PDFKit
import SwiftUI

struct DocumentScannerViewExample: View {
    @State private var isScannerPresented = false
    @State private var scannedImages: [UIImage] = []
    @State private var pdfDocument: PDFDocument?
    @State private var isPDFDocument: Bool = false
    @State private var pdfIdentifier = 0
    @State private var viewerTitle: String = "Results as Images"
    
    var body: some View {
        VStack {
            Toggle("Save Results as PDF", isOn: self.$isPDFDocument)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .onChange(of: self.isPDFDocument) { _ in
                    if self.isPDFDocument {
                        self.viewerTitle = "Results as PDF"
                    } else {
                        self.viewerTitle = "Results as Images"
                    }
                }
            VStack(alignment: .center) {
                Button {
                    self.isScannerPresented.toggle()
                } label: {
                    Image(systemName: "doc.viewfinder")
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                        .frame(width: 40, height: 40)
                }
                .buttonStyle(.plain)
                .fontWeight(.bold)
                Text("Scan to Capture Documents")
                    .font(.footnote)
            }
            ScrollView {
                Text(self.viewerTitle)
                    .font(.subheadline)
                    .foregroundColor(.accentColor)
                Group {
                    if self.isPDFDocument, let pdfDoc = self.pdfDocument {
                        PDFViewer(pdfDocument: pdfDoc, id: self.pdfIdentifier)
                            .scaledToFill()
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .center) {
                                ForEach(self.scannedImages, id: \.self) { image in
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 300, height: 300)
                                }
                            }
                        }
                    }
                }
            }
            .background(Color.preferredColor(.grey1))
            .frame(minHeight: 300)
        }
        .navigationTitle("Document Scanner")
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
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct PDFViewer: UIViewRepresentable {
    let pdfDocument: PDFDocument
    let id: Int
    
    func makeUIView(context: UIViewRepresentableContext<PDFViewer>) -> PDFView {
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
