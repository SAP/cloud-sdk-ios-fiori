import Foundation
import SourceryRuntime

extension AttributeList {
    var string: String {
        self.keys.map { name in
            "@\(name)"
        }
        .joined(separator: " ")
    }
}
