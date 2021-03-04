import Foundation

struct HavingGroups<Model: Decodable>: Decodable {
    let groups: Model
}
