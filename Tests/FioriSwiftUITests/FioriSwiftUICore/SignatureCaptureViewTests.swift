
@testable import FioriSwiftUICore
import SwiftUI
import UIKit
import XCTest

class SignatureCaptureTests: XCTestCase {
    var isOnSaveCalled = false
    var isOnDeleteCalled = false

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBasic() throws {
        let signagureCaptureView = SignatureCaptureView(onSave: self.onSave, onDelete: self.onDelete)

        XCTAssertEqual(signagureCaptureView.bundle, Bundle.module)
        XCTAssertEqual(signagureCaptureView.tableName, "FioriSwiftUICore")
        XCTAssertEqual(signagureCaptureView._drawingViewMinHeight, CGFloat(256))
        XCTAssertNil(signagureCaptureView._drawingViewMaxHeight)

        // test default property values
        XCTAssertEqual(signagureCaptureView.strokeWidth, CGFloat(3))
        if #available(iOS 14.0, *) {
            XCTAssertEqual(signagureCaptureView.strokeColor.cgColor, Color.preferredColor(.primaryLabel).cgColor)
            XCTAssertEqual(signagureCaptureView.drawingViewBackgroundColor.cgColor, Color.preferredColor(.primaryBackground).cgColor)
        }

        self.isOnSaveCalled = false
        let uiImage = UIImage(systemName: "xmark")!
        let image = Image(uiImage: uiImage)
        let result = SignatureCaptureView.Result(image: image, uiImage: uiImage)

        self.isOnSaveCalled = false
        signagureCaptureView.onSave?(result)
        XCTAssertTrue(self.isOnSaveCalled)

        self.isOnDeleteCalled = false
        signagureCaptureView.onDelete?()
        XCTAssertTrue(self.isOnDeleteCalled)
    }

    func testModifiers() throws {
        let signagureCaptureView = SignatureCaptureView(onSave: self.onSave, onDelete: nil)
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

    func onDelete() {
        self.isOnDeleteCalled = true
    }
}
