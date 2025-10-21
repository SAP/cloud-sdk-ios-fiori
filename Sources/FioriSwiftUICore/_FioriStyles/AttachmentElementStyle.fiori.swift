import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentElementBaseStyle: AttachmentElementStyle {
    public func makeBody(_ configuration: AttachmentElementConfiguration) -> some View {
        Group {
            switch configuration.attachmentInfo {
            case .uploading:
                if configuration.controlState == .normal {
                    AttachmentInProgress(
                        attachmentInProgressTitle: {
                            Text(configuration.attachmentInfo.attachmentName)
                        },
                        attachmentInfo: configuration.attachmentInfo,
                        onPreview: configuration.onPreview,
                        onDelete: configuration.onDelete
                    )
                }
                
            case .uploaded:
                self.makeAttachemnt(of: configuration)
                
            case .error:
                if configuration.controlState == .normal {
                    AttachmentWithError(
                        attachmentErrorTitle: {
                            Text(configuration.attachmentInfo.attachmentName)
                        },
                        attachmentInfo: configuration.attachmentInfo,
                        onPreview: configuration.onPreview,
                        onDelete: configuration.onDelete
                    )
                }
            }
        }
    }
}

extension AttachmentElementBaseStyle {
    @ViewBuilder
    func makeAttachemnt(of configuration: AttachmentElementConfiguration) -> some View {
        if let (fileName, fileSize, fileModificationDate) = getFileInfo(fileUrl: configuration.attachmentInfo.primaryURL) {
            Attachment(
                attachmentTitle: {
                    Text("\(fileName)")
                },
                attachmentSubtitle: {
                    if let fileSize {
                        Text(self.format(size: fileSize))
                    }
                },
                attachmentFootnote: {
                    if let fileModificationDate {
                        Text(self.format(date: fileModificationDate))
                    }
                },
                attachmentInfo: configuration.attachmentInfo,
                controlState: configuration.controlState,
                onExtraInfoChange: configuration.onExtraInfoChange,
                onPreview: configuration.onPreview,
                onDelete: configuration.onDelete
            )
        } else {
            EmptyView()
        }
    }

    func getFileInfo(fileUrl: URL) -> (String, Int?, Date?)? {
        guard let resourceValues = try? fileUrl.resourceValues(forKeys: [.fileSizeKey, .creationDateKey, .contentModificationDateKey, .nameKey]) else { return nil }
        return (fileUrl.lastPathComponent, resourceValues.fileSize, resourceValues.contentModificationDate)
    }
    
    func format(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    func format(size: Int) -> String {
        ByteCountFormatter.string(fromByteCount: Int64(size), countStyle: .file)
    }
}

// Default fiori styles
extension AttachmentElementFioriStyle {
    struct ContentFioriStyle: AttachmentElementStyle {
        func makeBody(_ configuration: AttachmentElementConfiguration) -> some View {
            AttachmentElement(configuration)
        }
    }
}
