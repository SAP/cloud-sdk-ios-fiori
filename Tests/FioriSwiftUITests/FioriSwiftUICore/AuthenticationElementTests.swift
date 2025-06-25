@testable import FioriSwiftUICore
import XCTest

final class AuthenticationElementTests: XCTestCase {
    func testBothLeftAndRightSamePadding() {
        // Test small screen devices (iPhone SE)
        XCTAssertEqual(AuthenticationElement.bothLeftAndRightSamePadding(320), 16.0)
        
        // Test standard iPhone screen
        XCTAssertEqual(AuthenticationElement.bothLeftAndRightSamePadding(375), 24.0)
        
        // Test iPhone Plus/Max
        XCTAssertEqual(AuthenticationElement.bothLeftAndRightSamePadding(428), 32.1, accuracy: 0.0001)
        
        // Test iPad landscape mode
        XCTAssertEqual(AuthenticationElement.bothLeftAndRightSamePadding(744), 104.16, accuracy: 0.0001)
        
        // Test larger screen devices
        XCTAssertEqual(AuthenticationElement.bothLeftAndRightSamePadding(1024), 286.72, accuracy: 0.0001)
    }
    
    func testTopPadding() {
        // Test detailImage padding
        XCTAssertEqual(AuthenticationElement.detailImage.topPadding, 56.0)
        
        // Test title padding for different heights
        XCTAssertEqual(AuthenticationElement.title(400).topPadding, 16.0) // Small devices, range 375-440
        XCTAssertEqual(AuthenticationElement.title(700).topPadding, 16.0) // Medium devices, range 667-768
        XCTAssertEqual(AuthenticationElement.title(900).topPadding, 32.0) // Large devices, range 810-956
        XCTAssertEqual(AuthenticationElement.title(1100).topPadding, 80.0) // Extra large devices, range 1024-1210
        XCTAssertEqual(AuthenticationElement.title(1366).topPadding, 212.0) // Extra extra large devices, ≥1366
        
        // Test subtitle padding for different heights
        XCTAssertEqual(AuthenticationElement.subtitle(400).topPadding, 32.0) // Small devices
        XCTAssertEqual(AuthenticationElement.subtitle(700).topPadding, 40.0) // Medium devices
        XCTAssertEqual(AuthenticationElement.subtitle(900).topPadding, 24.0) // Large devices
        XCTAssertEqual(AuthenticationElement.subtitle(1100).topPadding, 64.0) // Extra large devices
        XCTAssertEqual(AuthenticationElement.subtitle(1366).topPadding, 64.0) // Extra extra large devices
        
        // Test authInput padding for different heights
        XCTAssertEqual(AuthenticationElement.authInput(400).topPadding, 32.0) // Small devices
        XCTAssertEqual(AuthenticationElement.authInput(700).topPadding, 32.0) // Medium devices
        XCTAssertEqual(AuthenticationElement.authInput(900).topPadding, 32.0) // Large devices
        XCTAssertEqual(AuthenticationElement.authInput(1100).topPadding, 64.0) // Extra large devices
        XCTAssertEqual(AuthenticationElement.authInput(1366).topPadding, 64.0) // Extra extra large devices
        
        // Test applyAction padding
        XCTAssertEqual(AuthenticationElement.applyAction(0).topPadding, 42.0)
    }
}
