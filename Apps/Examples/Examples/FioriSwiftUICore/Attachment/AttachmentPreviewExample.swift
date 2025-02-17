import FioriSwiftUICore
import PhotosUI
import SwiftUI

struct AttachmentPreviewExample: View {
    @State var urls = [
        Bundle.main.url(forResource: "Square Image", withExtension: "jpeg")!,
        Bundle.main.url(forResource: "Big Tree with spring picnic - Landscape", withExtension: "jpg")!,
        Bundle.main.url(forResource: "Burr Oaked Redux - Portrait", withExtension: "jpg")!,
        Bundle.main.url(forResource: "Blocks and Tables", withExtension: "dwf")!,
        Bundle.main.url(forResource: "Color Wheel", withExtension: "dwg")!,
        Bundle.main.url(forResource: "Excel File Example", withExtension: "xlsx")!,
        Bundle.main.url(forResource: "Flv File Example", withExtension: "flv")!,
        Bundle.main.url(forResource: "HTML File Example", withExtension: "html")!,
        Bundle.main.url(forResource: "MD File Example", withExtension: "md")!,
        Bundle.main.url(forResource: "MP4 File Example", withExtension: "mp4")!,
        Bundle.main.url(forResource: "PDF advances in foundation - Landscape", withExtension: "pdf")!,
        Bundle.main.url(forResource: "PDF Introducing Combine - Portrait", withExtension: "pdf")!,
        Bundle.main.url(forResource: "SVG File Example", withExtension: "svg")!,
        Bundle.main.url(forResource: "Text File Example", withExtension: "txt")!,
        Bundle.main.url(forResource: "Word File Example", withExtension: "docx")!,
        Bundle.main.url(forResource: "XML File Example", withExtension: "xml")!,
        Bundle.main.url(forResource: "ZIP File Example", withExtension: "zip")!,
        URL(string: "https://ace.com/My Sound.8svx")!,
        URL(string: "https://ace.com/My Image.bpg")!,
        URL(string: "https://ace.com/My PDF.pdf")!,
        URL(string: "https://ace.com/My Presentation.pptm")!,
        URL(string: "https://ace.com/My Video.f4b")!,
        URL(string: "https://ace.com/My Text.rtf")!,
        URL(string: "https://ace.com/My Document/")!
    ]
    
    @State var erorMessage: AttributedString? = nil

    var body: some View {
        ScrollView {
            VStack {
                AttachmentGroup(title: { Text("Attachments") }, attachments: self.$urls, controlState: .readOnly, maxCount: 20, errorMessage: self.$erorMessage) {
                    AttachmentButtonImage()
                }
            }
        }
    }
}

#Preview {
    AttachmentPreviewExample()
}
