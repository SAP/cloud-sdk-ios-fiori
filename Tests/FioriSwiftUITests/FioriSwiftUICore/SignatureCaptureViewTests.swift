
@testable import FioriSwiftUICore
import SwiftUI
import UIKit
import XCTest

class SignatureCaptureTests: XCTestCase {
    var isOnSaveCalled = false

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBasic() throws {
        let signagureCaptureView = SignatureCaptureView(onSave: self.onSave)

        XCTAssertEqual(signagureCaptureView.bundle, Bundle.module)
        XCTAssertEqual(signagureCaptureView.tableName, "FioriSwiftUICore")
        XCTAssertEqual(signagureCaptureView._drawingViewMinHeight, CGFloat(256))
        XCTAssertNil(signagureCaptureView._drawingViewMaxHeight)

        // test default property values
        XCTAssertEqual(signagureCaptureView.strokeWidth, CGFloat(3))
        XCTAssertEqual(signagureCaptureView.strokeColor, Color.preferredColor(.primaryLabel))
        XCTAssertEqual(signagureCaptureView.drawingViewBackgroundColor, Color.preferredColor(.primaryBackground))

        self.isOnSaveCalled = false
        let uiImage = UIImage(systemName: "xmark")!
        let image = Image(uiImage: uiImage)
        let result = SignatureCaptureView.Result(image: image, uiImage: uiImage)
        signagureCaptureView.onSave?(result)
        XCTAssertTrue(self.isOnSaveCalled)
    }

    func testModifiers() throws {
        let signagureCaptureView = SignatureCaptureView(onSave: self.onSave)
            ._drawingViewMaxHeight(256)
            .strokeWidth(10)
            .strokeColor(.blue)
            .drawingViewBackgroundColor(.yellow)

        XCTAssertEqual(signagureCaptureView._drawingViewMaxHeight, CGFloat(256))
        XCTAssertEqual(signagureCaptureView.strokeWidth, CGFloat(10))
        XCTAssertEqual(signagureCaptureView.strokeColor, .blue)
        XCTAssertEqual(signagureCaptureView.drawingViewBackgroundColor, .yellow)
    }

    func onSave(_ result: SignatureCaptureView.Result) {
        self.isOnSaveCalled = true
    }
}
