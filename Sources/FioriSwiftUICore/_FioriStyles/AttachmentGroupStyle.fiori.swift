import FioriThemeManager
import Foundation
import os.log
import SwiftUI

// Base Layout style
public struct AttachmentGroupBaseStyle: AttachmentGroupStyle {
    @State var context = AttachmentContext()
    @State private var showingConfirmation = false
    @State var previewURL: URL? = nil
    @State var deleteIndex: Int? = nil

    @ViewBuilder
    func makeAttachemnt(of configuration: AttachmentGroupConfiguration, at index: Int) -> some View {
        if let (fileURL, name, fileSize, fileModificationDate) = getFileInfo(fileUrl: configuration.attachments[index]) {
            Attachment(
                attachmentTitle: {
                    Text("\(name)")
                },
                attachmentSubtitle: {
                    if let fileSize {
                        Text(format(size: fileSize))
                    }
                },
                attachmentFootnote: {
                    if let fileModificationDate {
                        Text(format(date: fileModificationDate))
                    }
                },
                url: fileURL,
                controlState: configuration.controlState
            )
            .ifApply(configuration.controlState == .normal) {
                $0.contextMenu {
                    Button {
                        if let showPreview = configuration.onPreview {
                            showPreview(configuration.attachments[index])
                        } else {
                            self.previewURL = configuration.attachments[index]
                        }
                    } label: {
                        Label(NSLocalizedString("Preview", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Preview"), systemImage: "viewfinder")
                    }
                    
                    Button(role: .destructive) {
                        self.deleteIndex = index
                        self.showingConfirmation.toggle()
                    } label: {
                        Label(NSLocalizedString("Delete", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Delete"), systemImage: "delete.left")
                    }
                }
            }
        } else {
            EmptyView()
        }
    }
    
    public func makeBody(_ configuration: AttachmentGroupConfiguration) -> some View {
        VStack(alignment: .leading, spacing: AttachmentConstants.cellVerticalSpacing) {
            configuration.title
                .accessibilityIdentifier("Attachment:Title-\(configuration.title)-\(UUID().uuidString)")
                .padding(.bottom, AttachmentConstants.extraTitleBottomPadding)
            
            LazyVGrid(columns: Array(repeating: GridItem(.adaptive(minimum: AttachmentConstants.thumbnailWidth), alignment: .top), count: 1), spacing: AttachmentConstants.cellVerticalSpacing) {
                if configuration.controlState != .readOnly {
                    if let maxCount = configuration.maxCount {
                        if maxCount > configuration.attachments.count {
                            configuration.operations
                                .accessibilityIdentifier("Attachment:AddButton-\(UUID().uuidString)")
                                .environment(self.context)
                        }
                    } else {
                        configuration.operations
                            .accessibilityIdentifier("Attachment:AddButton-\(UUID().uuidString)")
                            .environment(self.context)
                    }
                }
                
                ForEach(0 ..< configuration.attachments.count, id: \.self) { index in
                    self.makeAttachemnt(of: configuration, at: index)
                        .accessibilityIdentifier("Attachment:Thumbnail\(configuration.attachments[index].absoluteString)")
                        .accessibilityElement(children: .combine)
                        .onTapGesture {
                            if let showPreview = configuration.onPreview {
                                showPreview(configuration.attachments[index])
                            } else {
                                self.previewURL = configuration.attachments[index]
                            }
                        }
                        .ifApply(configuration.controlState == .readOnly) {
                            $0.accessibilityAction(named: NSLocalizedString("Preview", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Preview")) {
                                self.preivew(configuration: configuration, index: index)
                            }
                        }
                        .ifApply(configuration.controlState == .normal) {
                            $0.accessibilityAction(named: NSLocalizedString("Preview", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Preview")) {
                                self.preivew(configuration: configuration, index: index)
                            }
                            .accessibilityAction(named: NSLocalizedString("Delete", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Delete")) {
                                self.context.delete(attachment: configuration.attachments[index])
                            }
                        }
                }
            }
            .ifApply(configuration.maxCount == nil) {
                $0.onDrop(of: [.item], isTargeted: nil, perform: { providers, _ in
                    providers.forEach { self.context.upload(contentFrom: $0) }
                    return true
                })
            }
            .accessibilityElement(children: .contain)
        }
        .accessibilityElement(children: .contain)
        .quickLookPreview(self.$previewURL, in: configuration.attachments)
        .alert(NSLocalizedString("Delete Attachment?", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Delete Attachment?"), isPresented: self.$showingConfirmation) {
            Button(NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Cancel"), role: .cancel) {}
            Button(NSLocalizedString("Delete", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Delete"), role: .destructive) {
                if let index = deleteIndex {
                    self.context.delete(attachment: configuration.attachments[index])
                    os_log("Attachment at %@ deleted", log: OSLog.coreLogger, type: .info, index)
                    self.deleteIndex = nil
                } else {
                    os_log("No attchement found for deletion", log: OSLog.coreLogger, type: .info)
                }
            }
        }
        .informationView(isPresented: Binding(get: { configuration.errorMessage != nil }, set: { _ in }), description: configuration.errorMessage ?? AttributedString(""))
        .informationViewStyle(.error)
        .disabled(configuration.controlState == .disabled)
        .padding(.horizontal, AttachmentConstants.horizontalPadding)
        .padding(.vertical, AttachmentConstants.verticalPadding)
        .environment(
            {
                self.context.delegate = configuration.delegate
                self.context.configuration = configuration
                return self.context
            }()
        )
    }
    
    func preivew(configuration: AttachmentGroupConfiguration, index: Int) {
        if let showPreview = configuration.onPreview {
            showPreview(configuration.attachments[index])
        } else {
            self.previewURL = configuration.attachments[index]
        }
    }
}

// Default fiori styles
extension AttachmentGroupFioriStyle {
    struct ContentFioriStyle: AttachmentGroupStyle {
        func makeBody(_ configuration: AttachmentGroupConfiguration) -> some View {
            AttachmentGroup(configuration)
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let attachmentGroupConfiguration: AttachmentGroupConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(self.attachmentGroupConfiguration.controlState == .disabled ? Color.preferredColor(.quaternaryLabel) : Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
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
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    func format(size: Int) -> String {
        ByteCountFormatter.string(fromByteCount: Int64(size), countStyle: .file)
    }
}
