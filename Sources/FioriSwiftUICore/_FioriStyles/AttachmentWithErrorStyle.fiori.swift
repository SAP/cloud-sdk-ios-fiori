import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentWithErrorBaseStyle: AttachmentWithErrorStyle {
    public func makeBody(_ configuration: AttachmentWithErrorConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .center) {
                Image(fioriName: "fiori.notification.3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundStyle(Color.preferredColor(.negativeLabel))
            }
            .frame(width: AttachmentConstants.iconWidth, height: AttachmentConstants.iconHeight)
            .frame(width: AttachmentConstants.thumbnailWidth, height: AttachmentConstants.thumbnailHeight)
            .clipShape(
                RoundedRectangle(cornerRadius: AttachmentConstants.thumbnailCornerRadius)
            )
            .overlay(
                RoundedRectangle(cornerRadius: AttachmentConstants.thumbnailCornerRadius)
                    .stroke(Color.preferredColor(.separator), lineWidth: AttachmentConstants.thumbnailBorderLineWidth)
            )

            VStack(alignment: .leading, spacing: 2) {
                configuration.attachmentErrorTitle
            }
        }
        .id("Attachment:Error\(configuration.attachmentInfo.primaryURL.absoluteString)")
        .accessibilityIdentifier("Attachment:Error\(configuration.attachmentInfo.primaryURL.absoluteString)")
        .accessibilityElement(children: .combine)
        .accessibilityLabel(formatErrorMessage(configuration: configuration))
        .accessibilityAction(named: NSLocalizedString("Delete", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Delete")) {
            if case .error = configuration.attachmentInfo {
                configuration.onDelete?(configuration.attachmentInfo)
            }
        }
        .frame(width: AttachmentConstants.thumbnailWidth)
        .addErrorMessage {
            makeErrorView(message: configuration.attachmentInfo.errorMessage)
        }
        .contextMenu {
            Button(role: .destructive, action: {
                if case .error = configuration.attachmentInfo {
                    configuration.onDelete?(configuration.attachmentInfo)
                }
            }) {
                Label(NSLocalizedString("Delete", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Delete"), systemImage: "trash")
            }
        }
    }
}

extension AttachmentWithErrorBaseStyle {
    func formatErrorMessage(configuration: AttachmentWithErrorConfiguration) -> String {
        let localizedErrorMessage = NSLocalizedString("Attachment error", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Attachment upload failed")
        return String(format: localizedErrorMessage, configuration.attachmentInfo.primaryURL.lastPathComponent, configuration.attachmentInfo.errorMessage ?? "")
    }
    
    @ViewBuilder
    func makeErrorView(message: String?) -> some View {
        if let message {
            Text(message)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
                .font(Font.fiori(forTextStyle: .footnote))
                .foregroundColor(.preferredColor(.primaryLabel))
                .padding()
                .presentationCompactAdaptation(.popover)
        } else {
            EmptyView()
        }
    }
}

struct ErrorMessageModifier<PopoverContent: View>: ViewModifier {
    @State var isPresented: Bool = false
    @ViewBuilder var popoverContent: () -> PopoverContent

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                self.isPresented.toggle()
            }
            .popover(isPresented: self.$isPresented, content: self.popoverContent)
    }
}

extension View {
    func addErrorMessage(@ViewBuilder content: @escaping () -> some View) -> some View {
        self.modifier(ErrorMessageModifier(popoverContent: content))
    }
}

// Default fiori styles
extension AttachmentWithErrorFioriStyle {
    struct ContentFioriStyle: AttachmentWithErrorStyle {
        func makeBody(_ configuration: AttachmentWithErrorConfiguration) -> some View {
            AttachmentWithError(configuration)
        }
    }
    
    struct AttachmentErrorTitleFioriStyle: AttachmentErrorTitleStyle {
        let attachmentWithErrorConfiguration: AttachmentWithErrorConfiguration
        
        func makeBody(_ configuration: AttachmentErrorTitleConfiguration) -> some View {
            AttachmentErrorTitle(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .caption2, weight: .semibold))
                .lineLimit(2)
        }
    }
}
