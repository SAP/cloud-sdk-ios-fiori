
@testable import FioriSwiftUICore
import SwiftUI
import UIKit
import XCTest

class _SignatureCaptureTests: XCTestCase {
    var isOnSaveCalled = false
    var isOnDeleteCalled = false

    @State var signature: Image? = nil

    func testBasic() throws {
        let signatureCaptureView = SignatureCaptureView(
            onSave: { [unowned self] image in
                self.onSave(image)
            },
            onDelete: { [unowned self] in
                self.onDelete()
            }
        )

        XCTAssertNil(signatureCaptureView.drawingViewMaxHeight)

        // test default property values
        XCTAssertEqual(signatureCaptureView.strokeWidth, CGFloat(3))
        if #available(iOS 14.0, *) {
            XCTAssertEqual(signatureCaptureView.strokeColor.cgColor, Color.preferredColor(.primaryLabel).cgColor)
            XCTAssertEqual(signatureCaptureView.drawingViewBackgroundColor.cgColor, Color.preferredColor(.primaryBackground).cgColor)
        }

        self.isOnSaveCalled = false
        let uiImage = UIImage(systemName: "xmark")!

        self.isOnSaveCalled = false
        signatureCaptureView.onSave?(uiImage)
        XCTAssertTrue(self.isOnSaveCalled)

        self.isOnDeleteCalled = false
        signatureCaptureView.onDelete?()
        XCTAssertTrue(self.isOnDeleteCalled)
    }

    func testModifiers() throws {
        let signatureCaptureView = SignatureCaptureView(
            drawingViewMaxHeight: 256,
            onSave: { [unowned self] image in
                self.onSave(image)
            }
        )
        XCTAssertEqual(signatureCaptureView.drawingViewMaxHeight, CGFloat(256))
    }

    func onSave(_ image: UIImage) {
        self.isOnSaveCalled = true
    }

    func onDelete() {
        self.isOnDeleteCalled = true
    }
}
