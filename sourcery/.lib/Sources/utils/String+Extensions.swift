import Foundation

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
