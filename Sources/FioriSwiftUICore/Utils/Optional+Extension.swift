import Foundation

protocol _NilChecking {
    var isNil: Bool { get }
}

extension Optional: _NilChecking {
    var isNil: Bool {
        self == nil
    }
}
