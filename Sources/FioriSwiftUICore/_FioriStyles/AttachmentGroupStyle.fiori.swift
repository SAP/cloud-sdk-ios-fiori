import FioriThemeManager
import Foundation
import os.log
import SwiftUI

// Base Layout style
public struct AttachmentGroupBaseStyle: AttachmentGroupStyle {
    @State private var showingConfirmation = false
    @State var previewURL: URL? = nil
    @State var deleteURL: URL? = nil

    public func makeBody(_ configuration: AttachmentGroupConfiguration) -> some View {
        VStack(alignment: .leading, spacing: AttachmentConstants.cellVerticalSpacing) {
            configuration.title
                .id("Attachment:Title:\(configuration.title)")
                .accessibilityIdentifier("Attachment:Title:\(configuration.title)")
                .padding(.bottom, AttachmentConstants.extraTitleBottomPadding)
            
            LazyVGrid(columns: Array(repeating: GridItem(.adaptive(minimum: AttachmentConstants.thumbnailWidth), alignment: .top), count: 1), spacing: AttachmentConstants.cellVerticalSpacing) {
                if configuration.controlState != .readOnly {
                    if let maxCount = configuration.maxCount {
                        if maxCount > configuration.attachments.count {
                            configuration.operations
                                .id("Attachment:\(configuration.title):AddButton")
                                .accessibilityIdentifier("Attachment:\(configuration.title):AddButton")
                                .disabled(configuration.context.isUploading)
                        }
                    } else {
                        configuration.operations
                            .id("Attachment:\(configuration.title):AddButton")
                            .accessibilityIdentifier("Attachment:\(configuration.title):AddButton")
                            .disabled(configuration.context.isUploading)
                    }
                }
                
                ForEach(configuration.attachments) { attachment in
                    AttachmentElement(attachmentInfo: attachment, controlState: configuration.controlState) { extraInfo in
                        switch attachment {
                        case .uploaded(let destinationURL, let sourceURL, _):
                            configuration.attachments = configuration.attachments.map { doc in
                                doc == attachment ? .uploaded(destinationURL: destinationURL, sourceURL: sourceURL, extraInfo: extraInfo) : doc
                            }
                            return
                        default:
                            return
                        }
                    } onPreview: { info in
                        if let showPreview = configuration.onPreview {
                            showPreview(info.primaryURL)
                        } else {
                            self.previewURL = attachment.primaryURL
                        }
                    } onDelete: { info in
                        switch info {
                        case .uploaded:
                            self.deleteURL = attachment.primaryURL
                            self.showingConfirmation.toggle()
                        case .error:
                            configuration.context.delete(attachment: info.primaryURL)
                        case .uploading:
                            return
                        }
                    }
                }
            }
            .ifApply(configuration.maxCount == nil) {
                $0.onDrop(of: [.item], isTargeted: nil, perform: { providers, _ in
                    providers.forEach { configuration.context.upload(contentFrom: $0) }
                    return true
                })
            }
            .accessibilityElement(children: .contain)
        }
        .accessibilityElement(children: .contain)
        .quickLookPreview(self.$previewURL, in: configuration.attachments.map(\.primaryURL))
        .alert(NSLocalizedString("Delete Attachment?", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Delete Attachment?"), isPresented: self.$showingConfirmation) {
            Button(NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Cancel"), role: .cancel) {}
            Button(NSLocalizedString("Delete", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Delete"), role: .destructive) {
                if let deleteURL {
                    configuration.context.delete(attachment: deleteURL)
                    self.deleteURL = nil
                    // os_log("Attachment at %@ deleted", log: OSLog.coreLogger, type: .info, deleteURL.absoluteString)
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
                configuration.context.delegate = configuration.delegate
                configuration.context.configuration = configuration
                configuration.context.onDefaultExtraInfo = configuration.defaultAttachmentExtraInfo
                return configuration.context
            }()
        )
    }
    
    func preview(configuration: AttachmentGroupConfiguration, index: Int) {
        if let showPreview = configuration.onPreview {
            showPreview(configuration.attachments[index].primaryURL)
        } else {
            self.previewURL = configuration.attachments[index].primaryURL
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
