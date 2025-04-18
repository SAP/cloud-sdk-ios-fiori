import SwiftUI

extension Locale {
    func text(_ key: String) -> String {
        guard identifier != "" else { return key } // required for unit tests when accessing Environment<Locale>'s value outside of being installed on a View.
        let resourceIdentifier = identifier.components(separatedBy: "_")[0] // drop region, "de_DE" -> "de.lproj" or "zh-Hant_CN -> "zh-Hant"
        let path = Bundle.accessor.path(forResource: resourceIdentifier, ofType: "lproj") ?? Bundle.accessor.bundlePath
        let bundle = Bundle(path: path) ?? Bundle.accessor
        return NSLocalizedString(key, tableName: "FioriSwiftUICore", bundle: bundle, value: "", comment: "")
    }
}
