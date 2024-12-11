
import Foundation
import SwiftUI

class NSSParser {
    static func parseNssContent(_ content: String) throws -> [String: NSSStyleData] {
        var style: [String: [String: Any]] = [:]
        
        // Remove comments and redundant whitespaces.
        let cleanContent = self.removeComments(from: content)
        
        // Split style
        let (styleBlocks, variables) = self.splitStyleBlocks(cleanContent)
        
        for block in styleBlocks {
            let (selector, properties) = try parseStyleBlock(block)
            var updatedProperties = properties
            for (key, value) in properties {
                if let strValue = value as? String,
                   strValue.hasPrefix("@"),
                   let variableValue = variables[strValue]
                {
                    updatedProperties[key] = variableValue
                }
            }
            style[selector] = updatedProperties
        }

        return style
    }
    
    private static func splitStyleBlocks(_ content: String) -> ([String], NSSStyleData) {
        var blocks: [String] = []
        var currentBlock = ""
        var braceCount = 0
        var variables: NSSStyleData = [:]
        let lines = content.components(separatedBy: .newlines)
        
        for line in lines {
            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmed.starts(with: "@") {
                let parts = trimmed.components(separatedBy: ":")
                if parts.count == 2 {
                    let key = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
                    let value = parts[1].replacingOccurrences(of: ";", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
                    variables[key] = value
                }
                continue
            }
            for char in line {
                currentBlock.append(char)
                if char == "{" {
                    braceCount += 1
                } else if char == "}" {
                    braceCount -= 1
                    if braceCount == 0 {
                        blocks.append(currentBlock.trimmingCharacters(in: .whitespacesAndNewlines))
                        currentBlock = ""
                    }
                }
            }
        }
        
        return (blocks, variables)
    }
    
    static func removeComments(from content: String) -> String {
        var result = ""
        var inMultiLineComment = false
        var inSingleLineComment = false
        var inString = false
        
        let characters = Array(content)
        var i = 0
        
        while i < characters.count {
            // Process string literals
            if characters[i] == "\"", i == 0 || characters[i - 1] != "\\" {
                if !inMultiLineComment, !inSingleLineComment {
                    inString.toggle()
                    result.append(characters[i])
                }
                i += 1
                continue
            }
            
            // If in a string, add characters directly.
            if inString {
                result.append(characters[i])
                i += 1
                continue
            }
            
            // Check for the start of a multi-line comment.
            if i < characters.count - 1, characters[i] == "/", characters[i + 1] == "*", !inSingleLineComment, !inMultiLineComment {
                inMultiLineComment = true
                i += 2
                continue
            }
            
            // Check for end of multi-line comment
            if i < characters.count - 1, characters[i] == "*", characters[i + 1] == "/", inMultiLineComment {
                inMultiLineComment = false
                i += 2
                continue
            }
            
            // Check single-line comments
            if i < characters.count - 1, characters[i] == "/", characters[i + 1] == "/", !inMultiLineComment, !inSingleLineComment {
                inSingleLineComment = true
                i += 2
                continue
            }
            
            // Check the end of single-line comment (encounter a newline character).
            if characters[i] == "\n", inSingleLineComment {
                inSingleLineComment = false
                result.append(characters[i])
                i += 1
                continue
            }
            
            // If not in any comment, add characters.
            if !inMultiLineComment, !inSingleLineComment {
                result.append(characters[i])
            }
            
            i += 1
        }
        
        return result
    }
    
    // Parse a single style block.
    private static func parseStyleBlock(_ block: String) throws -> (String, [String: Any]) {
        // Separate selectors and properties.
        guard let openBrace = block.firstIndex(of: "{"),
              let closeBrace = block.lastIndex(of: "}")
        else {
            throw NSSError.invalidSyntax("Invalid style block format")
        }
        
        let selector = String(block[..<openBrace]).trimmingCharacters(in: .whitespacesAndNewlines)
        let propertiesString = String(block[block.index(after: openBrace) ..< closeBrace])
        
        return try (selector, self.parseProperties(propertiesString))
    }
    
    // Parse properties
    private static func parseProperties(_ propertiesString: String) throws -> [String: Any] {
        var properties: [String: Any] = [:]
        
        let declarations = propertiesString.components(separatedBy: ";")
        
        for declaration in declarations {
            let trimmed = declaration.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmed.isEmpty else { continue }
            
            let parts = trimmed.components(separatedBy: ":")
            guard parts.count == 2 else {
                throw NSSError.invalidSyntax("Invalid property declaration:\(trimmed)")
            }
            
            let key = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
            let value = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Convert value types
            properties[key] = value
        }
        
        return properties
    }
}
