import Foundation
import os.log
import SwiftUI

extension Font {
    /// Register Fiori fonts in the app.
    ///
    /// Call `Font.registerFioriFonts()` in AppDelegate to load all the fiori fonts into your app. If it is not called, `Font.fiori(forTextStyle:)` will return system font instead.
    
    // Add a static variable to track the registered fonts
    private static var registeredFonts = Set<String>()
    
    public static func registerFioriFonts() {
        self.registerFont("72-Black", fileExtension: "ttf")
        self.registerFont("72-Bold", fileExtension: "ttf")
        self.registerFont("72-BoldItalic", fileExtension: "ttf")
        self.registerFont("72-Condensed", fileExtension: "ttf")
        self.registerFont("72-CondensedBold", fileExtension: "ttf")
        self.registerFont("72-Italic", fileExtension: "ttf")
        self.registerFont("72-Light", fileExtension: "ttf")
        self.registerFont("72-Regular", fileExtension: "ttf")
        self.registerFont("72-Semibold", fileExtension: "ttf")
        self.registerFont("72-SemiboldDuplex", fileExtension: "ttf")
        os_log("Done registering 72 fonts", log: OSLog.fontLogger, type: .info)
    }
    
    // stackoverflow: https://stackoverflow.com/questions/62681206/xcode-12b1-swift-packages-custom-fonts
    static func registerFont(_ name: String, fileExtension: String, bundle: Bundle = Bundle.accessor) {
        // Create a unique identifier that includes the font name and extension
        let fontKey = "\(name).\(fileExtension)"
        
        // Check if this font is already registered. If it is, skip it.
        guard !self.registeredFonts.contains(fontKey) else {
            os_log("Font %@ already registered, skipping", log: OSLog.fontLogger, type: .info, fontKey)
            return
        }
        
        guard let fontURL = bundle.url(forResource: name, withExtension: fileExtension) else {
            os_log("No font named %@.%@ was found in the module bundle", log: OSLog.fontLogger, type: .default, name, fileExtension)
            return
        }

        var error: Unmanaged<CFError>?
        CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &error)
        if let error {
            os_log("Error registering font: %@", log: OSLog.fontLogger, type: .default, "\(error)")
        } else {
            // Add to the registered font set
            self.registeredFonts.insert(fontKey)
            os_log("Successfully registered font: %@", log: OSLog.fontLogger, type: .info, name)
        }
    }
}

extension OSLog {
    /// Logs `Font` related events.
    static let fontLogger = OSLog(subsystem: "FioriThemeManager", category: "FioriThemeManager.Font")
}
