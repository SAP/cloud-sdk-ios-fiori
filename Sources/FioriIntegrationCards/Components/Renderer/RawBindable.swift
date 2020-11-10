import Foundation

protocol RawBindable {
    associatedtype Binding: Decodable
    init(data: [String: Any], binding: Binding)
}
