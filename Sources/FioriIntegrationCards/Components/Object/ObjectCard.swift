import AnyCodable
import Combine
import Foundation

open class ObjectCard: ManyManyCard<[ObjectGroup]> {}

extension ObjectCard: Hashable {
    public static func == (lhs: ObjectCard, rhs: ObjectCard) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Array: Placeholding where Element: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> [Element] {
        map { $0.replacingPlaceholders(withValuesIn: object) }
    }
}
