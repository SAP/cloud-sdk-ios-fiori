import Foundation
import SourceryRuntime

extension Array where Element == String {
    func valuesBeforeColon() -> [Element] {
        compactMap {
            guard let split = $0.split(separator: ":")
                .map({ $0.trimmingCharacters(in: .whitespacesAndNewlines) })
                .first else { return nil }
            return String(split)
        }
    }
}

public extension Array where Element == String {
    var viewModifierPropertyDecls: String {
        map { "@Environment(\\.\($0)Modifier) private var \($0)Modifier" }.joined(separator: "\n\t")
    }
}

extension Array where Element == String {
    var types: [Type] {
        let context = ProcessInfo().context.type
        return compactMap { context[$0] }
    }
}
