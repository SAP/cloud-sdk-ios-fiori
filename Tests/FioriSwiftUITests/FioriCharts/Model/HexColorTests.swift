@testable import FioriSwiftUICore
@testable import FioriThemeManager
import UIKit
import XCTest

class HexColorTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyInit() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let color = HexColor()
        
        let traits = UIView().traitCollection
        
        // Light foreground color should be initialized using .dark color scheme
        let lightVariant = color.getVariant(traits: traits, background: .darkConstant, interface: .baseConstant, display: .normalConstant)
        let lightColorString = color.hex(lightVariant)
        let lightForegroundColor = color.rgba(lightColorString)
        XCTAssertEqual(Int(255 * lightForegroundColor.r), 0x0)
        XCTAssertEqual(Int(255 * lightForegroundColor.g), 0x0)
        XCTAssertEqual(Int(255 * lightForegroundColor.b), 0x0)
        XCTAssertEqual(Int(255 * lightForegroundColor.a), 0xff)
        
        // Dark foreground color should be initialized using .dark color scheme
        let darkVariant = color.getVariant(traits: traits, background: .lightConstant, interface: .baseConstant, display: .normalConstant)
        let darkColorString = color.hex(darkVariant)
        let darkForegroundColor = color.rgba(darkColorString)
        XCTAssertEqual(Int(255 * darkForegroundColor.r), 0xff)
        XCTAssertEqual(Int(255 * darkForegroundColor.g), 0xff)
        XCTAssertEqual(Int(255 * darkForegroundColor.b), 0xff)
        XCTAssertEqual(Int(255 * darkForegroundColor.a), 0xff)
    }
    
    func testInit() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // Expected result:
        //  - For .light color scheme, should return the dark variant of a HexColor
        //  - For .dark color scheme, should return the light variant of a HexColor
        let color = HexColor(lightColor: "12345678", darkColor: "abCDef")
        
        let traits = UIView().traitCollection
        
        let lightVariant = color.getVariant(traits: traits, background: .darkConstant, interface: .baseConstant, display: .normalConstant)
        let lightColorString = color.hex(lightVariant)
        let lightForegroundColor = color.rgba(lightColorString)
        XCTAssertEqual(Int(255 * lightForegroundColor.r), 0x12)
        XCTAssertEqual(Int(255 * lightForegroundColor.g), 0x34)
        XCTAssertEqual(Int(255 * lightForegroundColor.b), 0x56)
        XCTAssertEqual(Int(255 * lightForegroundColor.a), 0x78)
        
        let darkVariant = color.getVariant(traits: traits, background: .lightConstant, interface: .baseConstant, display: .normalConstant)
        let darkColorString = color.hex(darkVariant)
        let darkForegroundColor = color.rgba(darkColorString)
        XCTAssertEqual(Int(255 * darkForegroundColor.r), 0xab)
        XCTAssertEqual(Int(255 * darkForegroundColor.g), 0xcd)
        XCTAssertEqual(Int(255 * darkForegroundColor.b), 0xef)
        XCTAssertEqual(Int(255 * darkForegroundColor.a), 0xff)
    }
}
