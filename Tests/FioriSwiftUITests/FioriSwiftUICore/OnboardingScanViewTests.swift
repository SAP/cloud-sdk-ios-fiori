@testable import FioriSwiftUICore
import XCTest

final class OnboardingScanViewTests: XCTestCase {
    func testProperties() {
        let context = OnboardingScanViewContext()
        let onboardingScanView = OnboardingScanView(scanViewContext: context, shouldValidateScanResult: { scanResult in
            scanResult == "success"
        }, didCancel: {}, usesCameraOnly: false,
        didTapContinue: {})
        
        XCTAssertEqual(onboardingScanView.usesCameraOnly, false)
        XCTAssertEqual(onboardingScanView.scanViewContext.scanViewTitleString, "Scan".localizedFioriString())
    }
}
