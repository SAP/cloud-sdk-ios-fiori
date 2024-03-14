import Foundation
import SwiftUI
import UIKit

enum StyleSheetConverter {
    static func toColor(value: String) -> Color? {
        // Check standard color names
        switch value {
        case "black":
            return .black
        case "darkGray":
            return Color(.darkGray)
        case "lightGray":
            return Color(.lightGray)
        case "white":
            return .white
        case "gray":
            return .gray
        case "red":
            return .red
        case "green":
            return .green
        case "blue":
            return .blue
        case "cyan":
            #if swift(>=5.5)
                if #available(iOS 15.0, watchOS 8.0, *) {
                    return .cyan
                } else {
                    return Color(.cyan)
                }
            #else
                return Color(.cyan)
            #endif
        case "yellow":
            return .yellow
        case "magenta":
            return nil
        case "orange":
            return .orange
        case "purple":
            return .purple
        case "brown":
            #if swift(>=5.5)
                if #available(iOS 15.0, watchOS 8.0, *) {
                    return .brown
                } else {
                    return Color(.brown)
                }
            #else
                return Color(.brown)
            #endif
        case "clear":
            return .clear
        default:
            break
        }
        
        // Check names of supported Fiori styles (e.g.:  "primary1", "primary1_lightBackground", "primary1_darkBackground")
        if let fioriConstantColor = ColorStyle.color(from: value) {
            return fioriConstantColor
        }
        
        // Remove all whitespace.
        let cString = value.components(
            separatedBy: NSCharacterSet.whitespacesAndNewlines).reduce("", +).uppercased()
        
        // example of such a value: #1EA65395, where "1E" is 30% for alpha; "A6" is R in hex; "53" is G in hex; "95" is R in hex
        // alpha range is 0% to 100%.  When the given value is more than 100%, the value would be automatically reset to 100%
        // An example of online tool to convert decimal to Hex: http://www.rapidtables.com/convert/number/decimal-to-hex.htm
        let hexAlphaStrings = self.getCapturedStrings(content: cString, withPattern: "(?:0X|#)([0-9A-F]{8})") ??
            // example of such a value: #A65395, where "A6" is R in hex; "53" is G in hex; "95" is B in hex; alpha is default to 1.0
            self.getCapturedStrings(content: cString, withPattern: "(?:0X|#)([0-9A-F]{6})") ??
            // example of such a value: #A59, which is equal to #AA5599, where "AA" is R in hex; "55" is G in hex; "99" is B in hex; alpha is default to 1.0
            self.getCapturedStrings(content: cString, withPattern: "(?:0X|#)([0-9A-F]{3})")
        if let hexAlphaStrings {
            return Color(hex: hexAlphaStrings[1])
        }
        
        return nil
    }

    /**
     Matches the given content against the regular expression pattern, extracting
     any captured groups into an array. Unmatched captured groups are represented
     by an empty string instances in the returned array.
     */
    static func getCapturedStrings(content: String, withPattern pattern: String) -> [String]? {
        var regex: NSRegularExpression
        
        do {
            regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options(rawValue: 0))
        } catch {
            return nil
        }
        
        guard let result = regex.firstMatch(in: content, options: NSRegularExpression.MatchingOptions(rawValue: 0),
                                            range: NSRange(location: 0, length: content.count))
        else { return nil }
        
        var capturedStrings = [String]()
        
        for i in 0 ... regex.numberOfCaptureGroups {
            //            let capturedRange = result.range(at: i).toRange()
            let capturedRange = Range(result.range(at: i))
            
            if let capturedRange {
                let start = content.index(content.startIndex, offsetBy: capturedRange.lowerBound)
                let end = content.index(content.startIndex, offsetBy: capturedRange.upperBound)
                let range = start ..< end

                capturedStrings.append(String(content[range]))
            } else {
                capturedStrings.append("")
            }
        }
        
        return capturedStrings
    }
}
