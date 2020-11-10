import Foundation

public enum NetworkError: Error {
    case invalidURL(url: String)
    case badAccess
    case noData
}
