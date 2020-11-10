import Foundation

public struct HavingContent<ContentModel: Decodable>: Decodable {
    let content: ContentModel
}
