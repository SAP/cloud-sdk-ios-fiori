import Foundation
import SwiftUI

extension SwiftUI.View {
    func toVC(size: CGSize? = nil) -> UIViewController {
        guard let refSize = size else {
            return UIHostingController(rootView: self)
        }
        let copiedView = self.frame(width: refSize.width, height: refSize.height)
        return UIHostingController(rootView: copiedView)
    }
}
