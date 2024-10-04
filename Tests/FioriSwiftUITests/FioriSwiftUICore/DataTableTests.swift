@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class DataTableTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTextItemReadonly() throws {
        let textItem0 = DataTextItem("Hello", Font.body, Color.green)
        let textItem1 = DataTextItem("Hello", Font.body, Color.green, isReadonly: false)
        let textItem2 = DataTextItem("Hello", Font.body, Color.green, isReadonly: true)
        XCTAssertEqual(textItem0.isReadonly, nil)
        XCTAssertEqual(textItem1.isReadonly, false)
        XCTAssertEqual(textItem2.isReadonly, true)
    }
    
    func testRowReadonly() throws {
        let textItem1 = DataTextItem("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis tristique pretium.", Font.body, Color.green)
        let textItem2 = DataTextItem("Hello", Font.body, Color.green, isReadonly: true)
        let imageItem = DataImageItem(Image(systemName: "sun.min"), Color.gray)
        let dateItem = DataDateItem(Date(timeIntervalSinceReferenceDate: TimeInterval(100)), Font.body, Color.black, isReadonly: true)
        let timeItem = DataTimeItem(Date(timeIntervalSinceReferenceDate: TimeInterval(100)), Font.body, Color.black)
        let durationItem = DataDurationItem(TimeInterval(6000), Font.body, Color.black, isReadonly: false)
        let listItem = DataTextItem("San Jose", Font.body, Color.green, isReadonly: true)
        
        let row1 = TableRowItem(data: [textItem1, imageItem, dateItem, timeItem, durationItem, listItem])
        let row2 = TableRowItem(data: [textItem1, imageItem, dateItem, timeItem, durationItem, listItem], isReadonly: false)
        let row3 = TableRowItem(data: [dateItem, textItem1, imageItem, timeItem, durationItem, listItem], isReadonly: true)
        let row4 = TableRowItem(data: [textItem2, dateItem, dateItem, imageItem, timeItem, durationItem, listItem])
        
        XCTAssertTrue(row1.isReadonly == nil)
        XCTAssertTrue(row2.isReadonly == false)
        XCTAssertTrue(row3.isReadonly == true)
        XCTAssertTrue(textItem1.isReadonly == nil)
        XCTAssertTrue(textItem2.isReadonly == true)
        XCTAssertTrue(dateItem.isReadonly == true)
        XCTAssertTrue(timeItem.isReadonly == nil)
        XCTAssertTrue(durationItem.isReadonly == false)
        XCTAssertTrue(listItem.isReadonly == true)
    }
    
    func testColumnReadonly() throws {
        let column1Attr = ColumnAttribute(textAlignment: .leading)
        let column2Attr = ColumnAttribute(textAlignment: .leading, isReadonly: false)
        let column3Attr = ColumnAttribute(textAlignment: .leading, isReadonly: true)
        
        XCTAssertTrue(column1Attr.isReadonly == nil)
        XCTAssertTrue(column2Attr.isReadonly == false)
        XCTAssertTrue(column3Attr.isReadonly == true)
    }
    
    func testMixedReadonly() throws {
        let ld = LayoutData()
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: nil, columnIsReadonly: nil, cellIsReadonly: nil) == false)
        
        /// Set the cell only
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: nil, columnIsReadonly: nil, cellIsReadonly: false) == false)
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: nil, columnIsReadonly: nil, cellIsReadonly: true) == true)
        
        /// Set the row only
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: false, columnIsReadonly: nil, cellIsReadonly: nil) == false)
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: true, columnIsReadonly: nil, cellIsReadonly: nil) == true)
        
        /// Set the column only
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: nil, columnIsReadonly: false, cellIsReadonly: nil) == false)
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: nil, columnIsReadonly: true, cellIsReadonly: nil) == true)
        
        /// Set the row and column
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: false, columnIsReadonly: false, cellIsReadonly: nil) == false)
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: false, columnIsReadonly: true, cellIsReadonly: nil) == false)
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: true, columnIsReadonly: false, cellIsReadonly: nil) == true)
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: true, columnIsReadonly: true, cellIsReadonly: nil) == true)
        
        /// Set different values for the row, column, and cell
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: false, columnIsReadonly: true, cellIsReadonly: false) == false)
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: true, columnIsReadonly: false, cellIsReadonly: false) == false)
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: true, columnIsReadonly: true, cellIsReadonly: false) == false)
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: false, columnIsReadonly: true, cellIsReadonly: true) == true)
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: true, columnIsReadonly: false, cellIsReadonly: true) == true)
        XCTAssertTrue(ld.isReadonlyForCell(rowIsReadonly: true, columnIsReadonly: true, cellIsReadonly: true) == true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
