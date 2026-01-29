@testable import FioriThemeManager
import SwiftUI
import XCTest

class StyleSheetParserTests: XCTestCase {
    func testGlobalDefinition() throws {
        let content = """
        @primaryLabel:blue;
        @primaryLabel_darkBackground:blue;
        """
        let parser = StyleSheetParser()
        let styleSheet = try XCTUnwrap(try? parser.loadStylesheetByString(content: content))
        
        XCTAssertEqual(styleSheet.globalDefinitions.keys.count, 2)
        XCTAssertEqual(styleSheet.globalDefinitions["primaryLabel"], "blue")
        XCTAssertEqual(styleSheet.globalDefinitions["primaryLabel_darkBackground"], "blue")
    }

    func testPrecedence() throws {
        let content = """
        @primaryLabel:red;
        @primaryLabel_darkBackground:red;
        @primaryLabel:blue;
        @primaryLabel_darkBackground:blue;
        """
        let parser = StyleSheetParser()
        let styleSheet = try XCTUnwrap(try? parser.loadStylesheetByString(content: content))
        
        XCTAssertEqual(styleSheet.globalDefinitions.keys.count, 2)
        XCTAssertEqual(styleSheet.globalDefinitions["primaryLabel"], "red")
        XCTAssertEqual(styleSheet.globalDefinitions["primaryLabel_darkBackground"], "red")
    }

    func testIngoreNonGlobalDefinitionContent() throws {
        let content = """
        
        BarButton {
            background-color-top: #9D3024;
            background-color-bottom: #872A1F;
            border-color: #681C13;
            border-width: 1;
            corner-radius: 7;
            font-name: @primaryFontNameBold;
            font-color: #FFFFFF;
            font-size: 15;
            text-shadow-color: clear;
        }
        """
        let parser = StyleSheetParser()
        let styleSheet = try XCTUnwrap(try? parser.loadStylesheetByString(content: content))
        
        XCTAssertEqual(styleSheet.globalDefinitions.keys.count, 0)
    }
    
    func testLoadFromURL() throws {
        let parser = StyleSheetParser()
        let styleSheet = try XCTUnwrap(try? parser.loadStylesheetByURL(url: Bundle.module.url(forResource: "styleSheet", withExtension: "nss")!))
        
        XCTAssertNotEqual(styleSheet.globalDefinitions.keys.count, 0)
    }
    
    func testBCP2370020386() throws {
        XCTAssertNoThrow(try? StyleSheetSettings.loadStylesheetByURL(url: Bundle.module.url(forResource: "BCP2370020386", withExtension: "nss")!))
        
        #if os(iOS)
            // tintColor light variant
            var tintColor = Color.preferredColor(.tintColor, background: .darkConstant, interface: .baseConstant, display: .normalConstant).toHex()
            XCTAssertEqual(tintColor!, "0CBB74", "Incorrect tintColor light variant")
        
            // tintColor dark variant
            tintColor = Color.preferredColor(.tintColor, background: .lightConstant, interface: .baseConstant, display: .normalConstant).toHex()
            XCTAssertEqual(tintColor!, "0070F2", "Incorrect tintColor dark variant")
        
            // tintColor elevatedLight variant
            tintColor = Color.preferredColor(.tintColor, background: .darkConstant, interface: .elevatedConstant, display: .normalConstant).toHex()
            XCTAssertEqual(tintColor!, "0CBB74", "Incorrect tintColor elevatedLight variant")
        
            // tintColor elevatedDark variant
            tintColor = Color.preferredColor(.tintColor, background: .lightConstant, interface: .elevatedConstant, display: .normalConstant).toHex()
            XCTAssertEqual(tintColor!, "0070F2", "Incorrect tintColor elevatedDark variant")
        
            // tintColor contrastLight variant
            tintColor = Color.preferredColor(.tintColor, background: .darkConstant, interface: .baseConstant, display: .highConstant).toHex()
            XCTAssertEqual(tintColor!, "0CBB74", "Incorrect tintColor contrastLight variant")
        
            // tintColor contrastDark variant
            tintColor = Color.preferredColor(.tintColor, background: .lightConstant, interface: .baseConstant, display: .highConstant).toHex()
            XCTAssertEqual(tintColor!, "0046A8", "Incorrect tintColor contrastDark variant")
        
            // tintColor elevatedContrastLight variant
            tintColor = Color.preferredColor(.tintColor, background: .darkConstant, interface: .elevatedConstant, display: .highConstant).toHex()
            XCTAssertEqual(tintColor!, "0CBB74", "Incorrect tintColor elevatedContrastLight variant")
        
            // tintColor elevatedContrastDark variant
            tintColor = Color.preferredColor(.tintColor, background: .lightConstant, interface: .elevatedConstant, display: .highConstant).toHex()
            XCTAssertEqual(tintColor!, "0070F2", "Incorrect tintColor elevatedContrastDark variant")
        #endif
    }
}
