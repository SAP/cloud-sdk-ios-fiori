import Foundation

struct StyleSheetParser {
    func loadStylesheetByString(content: String) throws -> StyleSheet {
        guard let stylesheet = parse(content) else {
            let errMsg = "Failed to parse stylesheet:\(content). Please check .nss file for validity."
            throw StyleSheetParsingError.invalidStyleSheet(errMsg)
        }
        return stylesheet
    }
    
    func loadStylesheetByURL(url: URL) throws -> StyleSheet {
        let content = try String(contentsOf: url, encoding: String.Encoding.utf8)
        guard let stylesheet = parse(content) else {
            let errMsg = "Failed to parse stylesheet:\(content). Please check .nss file for validity."
            throw StyleSheetParsingError.invalidStyleSheet(errMsg)
        }
        return stylesheet
    }
    
    func parse(_ content: String) -> StyleSheet? {
        var styleSheet = StyleSheet()
        let lineArray = content.components(separatedBy: .newlines)
        
        for line in lineArray {
            guard line.first == "@" else { continue } // only global definitions (example: @tintColor:#FF00F9; ) are supported by this parser
            let globalDefinition = line.dropFirst().dropLast().components(separatedBy: ":")
            guard let propertyName = globalDefinition.first, let value = globalDefinition.last, globalDefinition.count == 2 else { continue }
            
            if !styleSheet.globalDefinitions.keys.contains(propertyName) {
                styleSheet.globalDefinitions.updateValue(value, forKey: propertyName)
            }
        }
        
        return styleSheet
    }
}
