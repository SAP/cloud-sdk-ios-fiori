import SwiftUI
import UniformTypeIdentifiers

public enum AttachmentConstants {
    public static let cellWidth: CGFloat = 109
    public static let cellHeight: CGFloat = 109

    public static let cellCornerRadius: CGFloat = 16
    public static let cellVerticalSpacing: CGFloat = 10
    
    public static let extraTitleBottomPadding: CGFloat = 1

    public static let iconWidth: CGFloat = 24
    public static let iconHeight: CGFloat = 24
    
    public static let fixedRowSpacing: CGFloat = 10
    
    public static let extraTittleBottomPadding: CGFloat = 1
    
    public static let fixedSpacingBetweenThumbnailAndText: CGFloat = 4
    
    public static let spacingBetweenAttachmentsAndErrorMessage: CGFloat = 8
    
    public static let errorMessageBottomPadding: CGFloat = 11
    
    public static let leftAndRightPadding: CGFloat = 16
    
    public static let thumbnailBorderLineWidth: CGFloat = 1.5
    
    public static let horizontalPadding: CGFloat = 16
    public static let verticalPadding: CGFloat = 10
    
    public static let defaultFileImporterFilter: [UTType] = [.image, .pdf, .text, .spreadsheet, .presentation, UTType("org.openxmlformats.wordprocessingml.document")].compactMap { $0 }
}
