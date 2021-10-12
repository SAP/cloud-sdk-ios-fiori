import Foundation

extension Bundle {
    static var accessor: Bundle {
        #if SWIFT_PACKAGE
            return Bundle.module
        #else
            return Bundle.main
        #endif
    }
}
