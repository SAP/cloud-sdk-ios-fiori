import Foundation
import SwiftUI

extension Font {
    /// Register Fiori fonts in the app.
    ///
    /// Call `Font.registerFioriFonts()` in AppDelegate to load all the fiori fonts into your app. If it is not called, `Font.fiori(forTextStyle:)` will return system font instead.
    public static func registerFioriFonts() {
        self.registerFont("72-Black", fileExtension: "ttf")
        self.registerFont("72-Bold", fileExtension: "ttf")
        self.registerFont("72-BoldItalic", fileExtension: "ttf")
        self.registerFont("72-Condensed", fileExtension: "ttf")
        self.registerFont("72-CondensedBold", fileExtension: "ttf")
        self.registerFont("72-Italic", fileExtension: "ttf")
        self.registerFont("72-Light", fileExtension: "ttf")
        self.registerFont("72-Regular", fileExtension: "ttf")
        print("All 72 font names: \(UIFont.fontNames(forFamilyName: "72"))")
    }
    
    // stackoverflow: https://stackoverflow.com/questions/62681206/xcode-12b1-swift-packages-custom-fonts
    static func registerFont(_ name: String, fileExtension: String, bundle: Bundle = Bundle.module) {
        guard let fontURL = bundle.url(forResource: name, withExtension: fileExtension) else {
            print("No font named \(name).\(fileExtension) was found in the module bundle")
            return
        }

        var error: Unmanaged<CFError>?
        CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &error)
        print(error ?? "Successfully registered font: \(name)")
    }
}
