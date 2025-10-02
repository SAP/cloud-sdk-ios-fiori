import Foundation
import SwiftUI

/**
 A singleton object to customize the `Locale` to be used.
 */
public class FioriLocale: NSObject {
    /**
     The shared signleton `FioriLocale`.
     */
    public static let shared = FioriLocale()

    /**
     The customized `Locale` to be used to display the default messages by SAPFiori components.

     The default valie is `nil`, which means using the device locale setting.
     */
    public var locale: Locale? {
        didSet {
            guard let locale, var languageCode = locale.language.languageCode?.identifier else {
                self.bundle = nil
                return
            }
            if let path = Bundle.accessorBase.path(forResource: languageCode, ofType: "lproj") {
                self.bundle = Bundle(path: path)
                return
            }
            if let scriptCode = locale.language.script?.identifier {
                languageCode.append("-\(scriptCode)")
            }
            guard let path = Bundle.accessorBase.path(forResource: languageCode, ofType: "lproj") else {
                self.bundle = nil
                return
            }
            self.bundle = Bundle(path: path)
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
