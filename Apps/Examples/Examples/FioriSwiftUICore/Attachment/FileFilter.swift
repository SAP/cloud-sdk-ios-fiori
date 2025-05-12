import UniformTypeIdentifiers

struct FileFilter: Hashable {
    let title: String
    let type: UTType
    
    static let allCases: [FileFilter] = [
        FileFilter(title: "PDF", type: .pdf),
        FileFilter(title: "Text", type: .text),
        FileFilter(title: "EPUB", type: .epub),
        FileFilter(title: "JSON", type: .json)
    ]
}
