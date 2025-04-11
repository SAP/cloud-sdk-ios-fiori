import SwiftUI
import UniformTypeIdentifiers

/// Constants for AttachmentGroup and Attachment component implementations. Also available to App so that App specific customization fits into SAP design and implementation.
public enum AttachmentConstants {
    /// Thumbnail width
    public static let thumbnailWidth: CGFloat = 109
    
    /// Thumbnail height
    public static let thumbnailHeight: CGFloat = 109

    /// Thumbnail corner radius
    public static let thumbnailCornerRadius: CGFloat = 16
    
    /// Vertical spacing between thumbnail and (title, subtitle, and footnote)
    public static let cellVerticalSpacing: CGFloat = 10
    
    /// Extra title bottom padding
    public static let extraTitleBottomPadding: CGFloat = 1

    /// Attachment icon width
    public static let iconWidth: CGFloat = 24
    
    /// Attachment icon height
    public static let iconHeight: CGFloat = 24
    
    /// Vertical spacing between attachment rows
    public static let fixedRowSpacing: CGFloat = 10
    
    /// Vertical spacing between thumbnail and (title, subtitle, and footnote)
    public static let fixedSpacingBetweenThumbnailAndText: CGFloat = 4
    
    /// Vertical spacing between last attachment row and error message
    public static let spacingBetweenAttachmentsAndErrorMessage: CGFloat = 8
    
    /// Bottom padding for error message
    public static let errorMessageBottomPadding: CGFloat = 11
    
    /// Thumbnail border width
    public static let thumbnailBorderLineWidth: CGFloat = 1.5
    
    /// Horizontal padding (to remove either this or leftAndRightPadding)
    public static let horizontalPadding: CGFloat = 16
    
    /// Vertical padding
    public static let verticalPadding: CGFloat = 10
    
    /// Default allowed file importer filter of UTTypes
    public static let defaultFileImporterFilter: [UTType] = [.image, .pdf, .text, .spreadsheet, .presentation, UTType("org.openxmlformats.wordprocessingml.document")].compactMap { $0 }
}
