import Foundation
import UIKit

struct Screen {
    private init() {}
    
    static var scale: CGFloat {
        #if os(visionOS)
            1.0
        #else
            UIScreen.main.scale
        #endif
    }
    
    static var bounds: CGRect {
        #if os(visionOS)
            CGRect(x: 0, y: 0, width: 1280, height: 720) // default window size for visionOS
        #else
            UIScreen.main.bounds
        #endif
    }
}
