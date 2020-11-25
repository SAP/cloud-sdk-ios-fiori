import FioriIntegrationCards
import Foundation

protocol CardTestCase {
    var id: String { get }
    func name() -> String
    func manifest() -> Manifest?
}

enum InlineTestCases: String, CaseIterable, Identifiable, CardTestCase {
    case analytical
    case list
    case listicon
    case listnumeric
    case timeLine = "timeline"
    case object
    case table
    
    var id: String {
        rawValue
    }

    func name() -> String {
        switch self {
        case .listicon:
            return "List (Icons)"
        case .listnumeric:
            return "List (Numeric)"
        default:
            return rawValue.prefix(1).capitalized + rawValue.dropFirst()
        }
    }
    
    func path() -> URL? {
        let bundle = Bundle.main.url(forResource: self.id, withExtension: "json")
        return bundle
    }
    
    func manifest() -> Manifest? {
        guard let path = path() else {
            return nil
        }
        do {
            let data = try Data(contentsOf: path)
            return try CardDecoder().decode(Manifest.self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
}
