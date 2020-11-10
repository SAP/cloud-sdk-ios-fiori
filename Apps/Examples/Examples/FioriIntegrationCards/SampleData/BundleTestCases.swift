import FioriIntegrationCards
import Foundation
import Zip

enum BundleTestCases: String, CaseIterable, Identifiable {
    case HTTPTimelineVarients = "HTTPTimelineVariants.card"
    case HTTPObjectVarients = "HTTPObjectVariants.card"
    case BundleTimelineVarients = "TimelineVariants.card"
    case BundleObjectVarients = "ObjectVariants.card"
    case BundleTableVarients = "TableVariants.card"
    case BundleAnalyticalVarients = "AnalyticalVariants.card"
    case BundleListVarients = "ListVariants.card"
    
    var id: String {
        rawValue
    }
    
    func path() -> URL? {
        let destinationDir = FileManager.default.temporaryDirectory.appendingPathComponent(rawValue, isDirectory: true)
        if FileManager.default.fileExists(atPath: destinationDir.path) {
            return destinationDir
        } else {
            let sourceFile = Bundle.main.url(forResource: rawValue, withExtension: "zip")!
            do {
                try Zip.unzipFile(sourceFile, destination: FileManager.default.temporaryDirectory, overwrite: true, password: nil)
                return destinationDir
            } catch {
                print(error)
            }
        }
        return nil
    }
    
    func manifest() -> Manifest? {
        guard let url = path() else {
            return nil
        }
        do {
            let model = try Manifest(withCardBundleAt: url)
            return model
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
