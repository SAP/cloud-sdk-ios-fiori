import Foundation
import SwiftUI

public enum StyleSheetParsingError: Error {
    case invalidStyleSheet(String)
}

/**
 API to load and apply style sheet information (to override color definitions)
 
 Changes made to the manager affect all future calls to `Color.preferredColor(_:background:interface:display:)`.
 
 **Example Usage**
 
 ```swift
 var colorOverrides = """
 @primaryLabel:#FF6000;
 @primaryLabel_darkBackground:#00FFFF;
 """
 
 try? StyleSheetSettings.loadStylesheetByString(content: colorOverrides)
 ```
 */
public struct StyleSheetSettings {
    static var shared = StyleSheetSettings()
    private init() {}
    
    private(set) var globalDefinitions = StyleSheetGlobalDefinitions()
    
    public static func reset() {
        StyleSheetSettings.shared.globalDefinitions = StyleSheetGlobalDefinitions()
        ThemeManager.shared.reset()
    }
    
    /// Load a specific stylesheet for theming with an given URL to the style sheet
    ///
    /// - parameter url: The `URL` to the style sheet
    public static func loadStylesheetByURL(url: URL) throws {
        let parser = StyleSheetParser()
        guard let stylesheet = try? parser.loadStylesheetByURL(url: url) else { return }
        for (key, value) in stylesheet.globalDefinitions {
            StyleSheetSettings.shared.globalDefinitions.updateValue(value, forKey: key)
        }
    }
    
    /// Load a stylesheet as `String` representation of style sheet file
    ///
    /// - Parameter content: the `String` representation of a style sheet file document
    public static func loadStylesheetByString(content: String) throws {
        let parser = StyleSheetParser()
        guard let stylesheet = try? parser.loadStylesheetByString(content: content) else { return }
        for (key, value) in stylesheet.globalDefinitions {
            StyleSheetSettings.shared.globalDefinitions.updateValue(value, forKey: key)
        }
    }
}
