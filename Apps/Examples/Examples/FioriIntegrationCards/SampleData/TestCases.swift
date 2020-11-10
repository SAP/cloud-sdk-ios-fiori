import FioriIntegrationCards
import Foundation
import Zip

enum TestCardBundle: String, CaseIterable, Identifiable {
    case analyticColumn = "card-explorer-stacked-column-card"
    case analyticDonut = "card-explorer-donut-card"
    case analyticLine = "card-explorer-line-card"
    case listHighlight = "card-explorer-highlight-list-card"
    case listIcon = "card-explorer-icon-list-card"
    // TODO: case listNumeric = "card-explorer-numeric-list-card"
    case listLinks = "card-explorer-quick-links-list-card"
    case object = "card-explorer-object-card"
    case table = "card-explorer-table-card"
    case timeline0 = "card-explorer-activities-timeline-card"
    case timeline1 = "card-explorer-members-timeline-card"
    case calendar = "card-explorer-simple-calendar-card"
    case adaptive0 = "adativecard-embedded"
    case adaptive1 = "adativecard-embedded1"
    case adaptive2 = "adativecard-embedded2"
    case adaptive3 = "adativecard-embedded3"
    case adaptive4 = "adativecard-embedded4"
    case adaptive5 = "adativecard-embedded5"
    case adaptive6 = "adativecard-embedded6"
    
    var id: String {
        rawValue
    }
    
    func path() -> URL? {
        let destinationDir = FileManager.default.temporaryDirectory.appendingPathComponent(rawValue, isDirectory: true)
        if FileManager.default.fileExists(atPath: destinationDir.path) {
            return destinationDir
        } else {
            let sourceFile = Bundle.main.url(forResource: rawValue, withExtension: "card.zip")!
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
        guard let path = path()?.appendingPathComponent("manifest.json") else { return nil }
        do {
            let data = try Data(contentsOf: path)
            return try JSONDecoder().decode(Manifest.self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
}
