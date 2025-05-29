import Combine
@testable import FioriSwiftUICore
import SwiftUI
import Testing
import XCTest

final class ToolbarTests: XCTestCase {
    func testToolbarSizeHandler() {
        let sizeHandler = FioriToolbarHandler()
        sizeHandler.containerSize = UIScreen.main.bounds.size
        sizeHandler.itemsSize = [0: CGSize(width: 100, height: 40), 1: CGSize(width: 80, height: 40)]
        
        XCTAssertEqual(sizeHandler.itemsCurrentWidth, UIScreen.main.bounds.width)
        XCTAssertNil(sizeHandler.itemsWidth.first?.1)
        XCTAssertEqual(sizeHandler.moreActionsIndex.count, 0)
    }
    
    func testItemsWidthCalculation() {
        let expectation = XCTestExpectation(description: "Async calculation")
        let handler = FioriToolbarHandler()
        handler.totalItemsCount = 4
        handler.numOfDisplayItems = 2
        
        DispatchQueue.main.async {
            handler.itemsSize = [0: CGSize(width: 100, height: 40),
                                 1: CGSize(width: 80, height: 40),
                                 2: CGSize(width: 90, height: 40),
                                 3: CGSize(width: 130, height: 40)]
            handler.containerSize = CGSize(width: 375, height: 800)
            XCTAssertEqual(handler.itemsWidth.count, 3)
            XCTAssertNotNil(handler.moreActionWidth)
            XCTAssertEqual(handler.moreActionsIndex.count, 2)
            let width = (375 - 48 - handler.moreActionWidth) / 2
            XCTAssertEqual(handler.itemsCurrentWidth, width * 2 + 8)
            XCTAssertEqual(handler.itemsWidth.last?.1, width)
            expectation.fulfill()
        }
            
        wait(for: [expectation], timeout: 1.0)
    }
}
