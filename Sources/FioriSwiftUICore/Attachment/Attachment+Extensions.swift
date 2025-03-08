// import FioriSwiftUICore
import SwiftUI

extension View {
    func getFileInfo(fileUrl: URL) -> (URL, String, Int?, Date?)? {
        guard let resourceValues = try? fileUrl.resourceValues(forKeys: [.fileSizeKey, .creationDateKey, .contentModificationDateKey, .nameKey]) else { return nil }
        return (fileUrl, fileUrl.lastPathComponent, resourceValues.fileSize, resourceValues.contentModificationDate)
    }
    
    func format(date: Date) -> String { // TODO: delete or put it into localization bundle
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm"
        return formatter.string(from: date)
    }
    
    func format(size: Int) -> String {
        ByteCountFormatter.string(fromByteCount: Int64(size), countStyle: .file)
    }
}
