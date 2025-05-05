@testable import FioriSwiftUICore
import XCTest

final class ActivationScreenTests: XCTestCase {
    func testSupportType() {
        XCTAssertEqual(FioriOnboardingUtil.currentSupportedType(height: 440), FioriOnboardingUtil.SupportedType.small)
        XCTAssertEqual(FioriOnboardingUtil.currentSupportedType(height: 768), FioriOnboardingUtil.SupportedType.medium)
        XCTAssertEqual(FioriOnboardingUtil.currentSupportedType(height: 926), FioriOnboardingUtil.SupportedType.large)
        XCTAssertEqual(FioriOnboardingUtil.currentSupportedType(height: 1080), FioriOnboardingUtil.SupportedType.extraLarge)
        XCTAssertEqual(FioriOnboardingUtil.currentSupportedType(height: 1366), FioriOnboardingUtil.SupportedType.extraExtraLarge)
    }
    
    func testTopPadding() {
        // Test left padding for different heights
        XCTAssertEqual(getActivationScreenSpec(height: 440).activationLeftPadding, 32.0) // Small devices, range 375-440
        XCTAssertEqual(getActivationScreenSpec(height: 768).activationLeftPadding, 32.0) // Medium devices, range 667-768
        XCTAssertEqual(getActivationScreenSpec(height: 926).activationLeftPadding, 32.0) // Large devices, range 810-956
        XCTAssertEqual(getActivationScreenSpec(height: 1080).activationLeftPadding, 76.0) // Extra large devices, range 1024-1210
        XCTAssertEqual(getActivationScreenSpec(height: 1366).activationLeftPadding, 76.0) // Extra extra large devices, ≥1366
        
        // Test head line label top padding for different heights
        XCTAssertEqual(getActivationScreenSpec(height: 440).activationHeadlineLabelTopPadding, 20.0) // Small devices
        XCTAssertEqual(getActivationScreenSpec(height: 768).activationHeadlineLabelTopPadding, 48.0) // Medium devices
        XCTAssertEqual(getActivationScreenSpec(height: 926).activationHeadlineLabelTopPadding, 48.0) // Large devices
        XCTAssertEqual(getActivationScreenSpec(height: 1080).activationHeadlineLabelTopPadding, 80.0) // Extra large devices
        XCTAssertEqual(getActivationScreenSpec(height: 1366).activationHeadlineLabelTopPadding, 212.0) // Extra extra large devices
        
        // Test detail label top padding for different heights
        XCTAssertEqual(getActivationScreenSpec(height: 440).activationDetailLabelTopPadding, 32.0) // Small devices
        XCTAssertEqual(getActivationScreenSpec(height: 768).activationDetailLabelTopPadding, 40.0) // Medium devices
        XCTAssertEqual(getActivationScreenSpec(height: 926).activationDetailLabelTopPadding, 40.0) // Large devices
        XCTAssertEqual(getActivationScreenSpec(height: 1080).activationDetailLabelTopPadding, 60.0) // Extra large devices
        XCTAssertEqual(getActivationScreenSpec(height: 1366).activationDetailLabelTopPadding, 64.0) // Extra extra large devices
    }
}
