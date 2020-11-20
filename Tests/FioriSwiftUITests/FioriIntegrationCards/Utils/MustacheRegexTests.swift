@testable import FioriIntegrationCards
import XCTest

class MustacheRegex: XCTestCase {
    // single curly brackets
    func testReplacingPlaceHoldersForData() throws {
        let string = "Today is {dateString}"
        let resolved = string.replacingPlaceholders(withValuesIn: ["dateString": "09-07-2020"])

        XCTAssertEqual(resolved, "Today is 09-07-2020")
    }

    func testReplacingPlaceHoldersForDataMultiple() throws {
        let string = "Today is {dateString} which feels {mood}"
        let resolved = string.replacingPlaceholders(withValuesIn: ["dateString": "09-07-2020", "mood": "great"])

        XCTAssertEqual(resolved, "Today is 09-07-2020 which feels great")
    }

    // double curly brackets
    func testReplacingPlaceHoldersForUserDefinedManifestParameters() throws {
        let parameterJSON = """
        {
        "value": "good",
        "type": "string"
        }
        """

        let jsonData = parameterJSON.data(using: .utf8)!
        let configurationParameter = try JSONDecoder().decode(Configuration.Parameter.self, from: jsonData)

        let string = "Today is {{parameters.mood}}"
        let resolved = string.replacingPlaceholders(withValuesIn: ["mood": configurationParameter])

        XCTAssertEqual(resolved, "Today is good")
    }

    func testReplacingPlaceHoldersForPredefinedManifestParameter_TODAY_ISO() throws {
        let string = "Today is {{parameters.TODAY_ISO}}"
        let resolved = string.replacingPlaceholders(withValuesIn: ["doesNotMatter": "predefinedManifestParametersDoNotNeedToBeDefined"])

        XCTAssertNotEqual(resolved, "Today is {{parameters.TODAY_ISO}}")
    }

    func testReplacingPlaceHoldersForPredefinedManifestParameter_NOW_ISO() throws {
        let string = "Today is {{parameters.NOW_ISO}}"
        let resolved = string.replacingPlaceholders(withValuesIn: ["doesNotMatter": "predefinedManifestParametersDoNotNeedToBeDefined"])

        XCTAssertNotEqual(resolved, "Today is {{parameters.NOW_ISO}}")
    }

    func testReplacingPlaceHoldersForPredefinedManifestParameter_LOCALE() throws {
        let string = "{{parameters.LOCALE}}"
        let resolved = string.replacingPlaceholders(withValuesIn: ["doesNotMatter": "predefinedManifestParametersDoNotNeedToBeDefined"])

        XCTAssertEqual(resolved, "\(Locale.current.languageCode!)")
    }
}
