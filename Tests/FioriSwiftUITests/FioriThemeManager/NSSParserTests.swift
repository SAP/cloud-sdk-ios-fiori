@testable import FioriThemeManager
import SwiftUI
import XCTest

final class NSSParserTests: XCTestCase {
    func testBasicStyleParsing() throws {
        let input = """
        button {
            color: red;
            font-size: 14;
        }
        """
        
        let result = try NSSParser.parseNssContent(input)
        
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result["button"]?["color"] as? String, "red")
        XCTAssertEqual(result["button"]?["font-size"] as? String, "14")
    }
    
    func testVariableReplacement() throws {
        let input = """
        @primary-color: #FF0000;
        @font-size: 16;
        
        button {
            color: @primary-color;
            font-size: @font-size;
        }
        """
        
        let result = try NSSParser.parseNssContent(input)
        
        XCTAssertEqual(result["button"]?["color"] as? String, "#FF0000")
        XCTAssertEqual(result["button"]?["font-size"] as? String, "16")
    }
    
    func testCommentRemoval() throws {
        let input = """
        // This is a comment
        button {
            color: red; // inline comment
            font-size: 14;
        }
        """
        
        let result = try NSSParser.parseNssContent(input)
        
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result["button"]?["color"] as? String, "red")
        XCTAssertEqual(result["button"]?["font-size"] as? String, "14")
    }
    
    func testMultipleBlocks() throws {
        let input = """
        button {
            color: red;
        }
        
        text {
            color: blue;
        }
        """
        
        let result = try NSSParser.parseNssContent(input)
        
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result["button"]?["color"] as? String, "red")
        XCTAssertEqual(result["text"]?["color"] as? String, "blue")
    }
    
    func testInvalidSyntax() {
        let input = """
        button {
            color: red
            font-size: 14;
        }
        """
        
        XCTAssertThrowsError(try NSSParser.parseNssContent(input)) { error in
            XCTAssertTrue(error is NSSError)
        }
    }
}
