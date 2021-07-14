import FioriIntegrationCards
import Foundation

enum DataRequestTestCases: String, CaseIterable, Identifiable, CardTestCase {
    case data = "list (feat. requesting data)"
    case parameters = "manifest Parameters"

    var id: String {
        rawValue
    }

    func name() -> String {
        switch self {
        default:
            return rawValue.prefix(1).capitalized + rawValue.dropFirst()
        }
    }

    func manifestPath() -> String {
        switch self {
        case .data:
            return "samples/data/basic/manifest.json"
        case .parameters:
            return "samples/parameters/parameters/manifest.json"
        }
    }

    func path() -> URL? {
        nil
    }

    func manifest() -> Manifest? {
        do {
            return try Manifest(withCardBundleAt: URL(string: "https://ui5.sap.com/test-resources/sap/ui/integration/demokit/cardExplorer/webapp/")!, manifestPath: self.manifestPath())
        } catch {
            print(error)
        }
        return nil
    }
}
