import Foundation

public struct HavingData<Model: Decodable>: Decodable {
    let data: Model
}
