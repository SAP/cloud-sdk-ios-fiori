import Foundation
import SwiftUI

extension String {
    func boundingBoxSize(with fontSize: CGFloat) -> CGSize {
        #if os(iOS) || os(tvOS) || os(watchOS)
            let font = UIFont.systemFont(ofSize: fontSize)
        #elseif os(macOS)
            let font = NSFont.systemFont(ofSize: fontSize)
        #endif
        
        let size = (self as NSString)
            .boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)),
                          options: .usesLineFragmentOrigin,
                          attributes: [NSAttributedString.Key.font: font],
                          context: nil).size
        
        return size
    }
}
