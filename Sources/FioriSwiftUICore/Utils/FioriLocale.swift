import Foundation
import SwiftUI

/**
 A singleton object to customize the `Locale` to be used.
 */
public class FioriLocale: NSObject {
    /**
     The shared singleton `FioriLocale`.
     */
    public static let shared = FioriLocale()

    /**
     The customized `Locale` to be used to display the default messages by SAPFiori components.

     The default value is `nil`, which means using the device locale setting.
     */
    public var locale: Locale? {
        didSet {
            guard let locale, var languageCode = locale.language.languageCode?.identifier else {
                self.bundle = nil
                return
            }
            let language = locale.language
            var regionLanguage: String? = nil
            switch languageCode {
            case "de", "en", "es", "fr", "it", "pt":
                // For these languages we support sub-languages based on the region code
                if let regionID = language.region?.identifier {
                    regionLanguage = languageCode + "-" + regionID
                }
            case "zh":
                // For Chinese, need to add script code
                if let scriptCode = locale.language.script?.identifier {
                    languageCode.append("-\(scriptCode)")
                } else {
                    languageCode.append("-Hans")
                }
            default:
                break
            }
            if let regionLanguage, let path = Bundle.accessorBase.path(forResource: regionLanguage, ofType: "lproj") {
                self.bundle = Bundle(path: path)
                return
            }
            if let path = Bundle.accessorBase.path(forResource: languageCode, ofType: "lproj") {
                self.bundle = Bundle(path: path)
                return
            }
            self.bundle = nil
        }
    }

    var bundle: Bundle?

    private init(locale: Locale? = nil) {
        self.locale = locale
    }
}

public extension View {
    /**
     Sets the `locale` of the singleton `FioriLocale`.
     - parameter locale: The desired `Locale` to be used.
     - returns: The `View` itself.
     */
    func setFioriLocale(_ locale: Locale?) -> some View {
        FioriLocale.shared.locale = locale
        return self
    }
}
