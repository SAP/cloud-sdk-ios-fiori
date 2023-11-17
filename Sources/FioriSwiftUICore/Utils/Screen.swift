import Foundation

struct Screen {
    private init() {}
    
    static var scale: CGFloat {
        #if os(xrOS)
            1.0
        #elseif canImport(UIKit)
            UIScreen.main.scale
        #endif
    }
    
    static var bounds: CGRect {
        #if os(xrOS)
            .zero
        #elseif canImport(UIKit)
            UIScreen.main.bounds
        #endif
    }
}
