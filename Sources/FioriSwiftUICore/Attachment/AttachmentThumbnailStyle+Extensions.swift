import QuickLook
import SwiftUI

extension AttachmentThumbnailStyle {
    static func getDefaultThumbnail(url: URL) -> Image {
        switch url.pathExtension.lowercased() {
        // Audio files defined in https://en.wikipedia.org/wiki/Audio_file_format
        case "aa", "aac", "aax", "act", "aiff", "amr", "ape", "au", "awb", "dct", "dss", "dvf", "flac", "gsm", "iklax", "ivs", "m4a", "m4b", "mmf", "mp3", "mpc", "msv", "nsf", "oga", "mogg", "opus", "ra", "raw", "sln", "tta", "vox", "wav", "wma", "wv", "8svx":
            return Image(systemName: "waveform")
            
        case "csv":
            return Image(systemName: "doc.text")
            
        // Major image file extensions defined in https://en.wikipedia.org/wiki/Image_file_formats
        case "jpg", "jpeg", "jfif", "jpeg 2000", "exif", "tiff", "gif", "bmp", "png", "ppm", "pgm", "pbm", "pnm", "webp", "hdr", "heif", "bat", "bpg":
            return Image(systemName: "photo")
            
        case "pdf":
            return Image(systemName: "doc.richtext.fill")
            
        case "ppt", "pptx", "pptm", "key":
            return Image(systemName: "doc.richtext")
            
        case "xls", "xlsx", "xlsm", "xltx", "xltm":
            return Image(systemName: "doc.richtext")
            
        case "txt", "rtf":
            return Image(systemName: "doc.text")
            
        // Video file extensions from https://en.wikipedia.org/wiki/Video_file_format
        case "webm", "mkv", "flv", "vob", "ogv", "ogg", "drc", "gifv", "mng", "avi", "mov", "qt", "wmv", "yuv", "rm", "rmvb", "asf", "amv", "mp4", "m4p", "m4v", "mpg", "mp2", "mpeg", "mpe", "mpv", "m2v", "svi", "3gp", "3g2", "mxf", "roq", "nsv", "f4v", "f4p", "f4a", "f4b":
            return Image(systemName: "video")
            
        default:
            return Image(systemName: "doc")
        }
    }
}

extension AttachmentThumbnailBaseStyle {
    func generateThumbnail(url: URL) {
        let size = CGSize(width: AttachmentConstants.cellWidth, height: AttachmentConstants.cellHeight)
        let scale = UIScreen.main.scale
        
        let request = QLThumbnailGenerator.Request(
            fileAt: url,
            size: size,
            scale: scale,
            representationTypes: .thumbnail
        )
        
        let generator = QLThumbnailGenerator.shared
        generator.generateBestRepresentation(for: request) { thumbnail, error in
            DispatchQueue.main.async {
                if let error {
                    print(error)
                    return
                }
                if let thumbnailUiImage = thumbnail?.uiImage {
                    self.image = AnyView(Image(uiImage: thumbnailUiImage))
                }
            }
        }
    }
}
