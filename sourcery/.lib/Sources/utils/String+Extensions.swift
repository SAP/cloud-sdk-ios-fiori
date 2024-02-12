import Foundation

public extension String {
    func prependAssignmentIfNeeded() -> String {
        isEmpty ? self : " = " + self
    }
    
    func commented() -> String {
        self.components(separatedBy: "\n")
            .map { "//" + $0 }
            .joined(separator: "\n")
    }
}

public extension String {
    func capitalizingFirst() -> String {
        prefix(1).capitalized + dropFirst()
    }

    func lowercasingFirst() -> String {
        prefix(1).lowercased() + dropFirst()
    }
}

public extension String {
    func lineBreaking() -> String {
        self + "\n"
    }
}

public extension String {
    func trim() -> String {
        self.replacingOccurrences(of: "_", with: "")
    }
}
