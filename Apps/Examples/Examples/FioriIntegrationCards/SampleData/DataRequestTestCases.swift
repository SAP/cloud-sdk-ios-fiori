import FioriIntegrationCards
import Foundation

enum DataRequestTestCases: String, CaseIterable, Identifiable, CardTestCase {
    case ListDataRequestStaticData = "list (load data with request)"

    var id: String {
        rawValue
    }

    func name() -> String {
        rawValue
    }

    func path() -> URL? {
        nil
    }

    func manifest() -> Manifest? {
        do {
            return try Manifest(withCardBundleAt: URL(string: "https://openui5.hana.ondemand.com/test-resources/sap/ui/integration/demokit/cardExplorer/webapp/")!, manifestPath: "samples/data/manifest.json")
        } catch {
            print(error)
        }
        return nil
    }
}
