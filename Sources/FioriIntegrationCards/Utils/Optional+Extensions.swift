import Foundation

extension Optional {
    static func isNil(_ object: Wrapped) -> Bool {
        switch object as Any {
        // swiftformat:disable:next typeSugar
        case Optional<Any>.none:
            return true
        default:
            return false
        }
    }
}
