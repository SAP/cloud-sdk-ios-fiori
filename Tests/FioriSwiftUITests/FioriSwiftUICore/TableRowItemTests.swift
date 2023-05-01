@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class TableRowItemTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDataTextItem() throws {
        let item1 = DataTextItem("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis tristique pretium.", Font.body, Color.green)
        let item2 = DataTextItem("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis tristique pretium.", Font.body, Color.green)
        let item3 = DataTextItem("Hello", Font.body, Color.green)
        let item4 = DataTextItem("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis tristique pretium.", Font.footnote, Color.green)
        let item5 = DataTextItem("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis tristique pretium.", Font.footnote, Color.blue)
        
        XCTAssertTrue(item1 == item2)
        XCTAssertTrue(item1 != item3)
        XCTAssertTrue(item1 != item4)
        XCTAssertTrue(item1 != item5)
    }

    func testDataImageItem() throws {
        let item1 = DataImageItem(Image(systemName: "sun.min"), Color.gray)
        let item2 = DataImageItem(Image(systemName: "sun.min"), Color.gray)
        let item3 = DataImageItem(Image(systemName: "snowflake"), Color.gray)
        let item4 = DataImageItem(Image(systemName: "sun.min"), Color.green)
        XCTAssertTrue(item1 == item2)
        XCTAssertTrue(item1 != item3)
        XCTAssertTrue(item1 != item4)
    }
    
    func testDataDateItem() throws {
        let item1 = DataDateItem(Date(timeIntervalSinceReferenceDate: TimeInterval(100)), Font.body, Color.black)
        let item2 = DataDateItem(Date(timeIntervalSinceReferenceDate: TimeInterval(100)), Font.body, Color.black)
        let item3 = DataDateItem(Date.now, Font.body, Color.black)
        let item4 = DataDateItem(Date(timeIntervalSinceReferenceDate: TimeInterval(100)), Font.footnote, Color.black)
        let item5 = DataDateItem(Date(timeIntervalSinceReferenceDate: TimeInterval(100)), Font.body, Color.gray)
        
        XCTAssertTrue(item1 == item2)
        XCTAssertTrue(item1 != item3)
        XCTAssertTrue(item1 != item4)
        XCTAssertTrue(item1 != item5)
    }
    
    func testDataTimeItem() throws {
        let item1 = DataTimeItem(Date(timeIntervalSinceReferenceDate: TimeInterval(100)), Font.body, Color.black)
        let item2 = DataTimeItem(Date(timeIntervalSinceReferenceDate: TimeInterval(100)), Font.body, Color.black)
        let item3 = DataTimeItem(Date.now, Font.body, Color.black)
        let item4 = DataTimeItem(Date(timeIntervalSinceReferenceDate: TimeInterval(100)), Font.footnote, Color.black)
        let item5 = DataTimeItem(Date(timeIntervalSinceReferenceDate: TimeInterval(100)), Font.body, Color.gray)
        
        XCTAssertTrue(item1 == item2)
        XCTAssertTrue(item1 != item3)
        XCTAssertTrue(item1 != item4)
        XCTAssertTrue(item1 != item5)
    }
    
    func testDataDurationItem() throws {
        let item1 = DataDurationItem(TimeInterval(6000), Font.body, Color.black)
        let item2 = DataDurationItem(TimeInterval(6000), Font.body, Color.black)
        let item3 = DataDurationItem(TimeInterval(5000), Font.body, Color.black)
        let item4 = DataDurationItem(TimeInterval(6000), Font.footnote, Color.black)
        let item5 = DataDurationItem(TimeInterval(6000), Font.body, Color.gray)
        
        XCTAssertTrue(item1 == item2)
        XCTAssertTrue(item1 != item3)
        XCTAssertTrue(item1 != item4)
        XCTAssertTrue(item1 != item5)
    }
    
    func testDataListItem() throws {
        let item1 = DataTextItem("San Jose", Font.body, Color.green)
        let item2 = DataTextItem("San Jose", Font.body, Color.green)
        let item3 = DataTextItem("San Ramon", Font.body, Color.green)
        let item4 = DataTextItem("San Jose", Font.footnote, Color.green)
        let item5 = DataTextItem("San Jose", Font.footnote, Color.blue)
        
        XCTAssertTrue(item1 == item2)
        XCTAssertTrue(item1 != item3)
        XCTAssertTrue(item1 != item4)
        XCTAssertTrue(item1 != item5)
    }
    
    func testAccessoryItem() throws {
        let icon: AccessoryItem = .icon(Image(systemName: "arrow.triangle.2.circlepath"))
        let icon2: AccessoryItem = .icon(Image(systemName: "snowflake"))
        let button: AccessoryItem = .button(.init(image: Image(systemName: "cart.badge.plus"), title: "cart", action: {
            print("Accessory button tapped")
        }))
        let button2: AccessoryItem = .button(.init(image: Image(systemName: "cart.badge.plus"), title: "bucket", action: {
            print("Accessory button tapped")
        }))
        
        XCTAssertTrue(icon == icon)
        XCTAssertTrue(icon != icon2)
        XCTAssertTrue(button == button)
        XCTAssertTrue(icon != button)
        XCTAssertTrue(button != button2)
    }
    
    func testTableRowItem() throws {
        let icon: AccessoryItem = .icon(Image(systemName: "snowflake"))
        let button: AccessoryItem = .button(.init(image: Image(systemName: "cart.badge.plus"), title: "cart", action: {
            print("Accessory button tapped")
        }))
        
        let textItem1 = DataTextItem("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis tristique pretium.", Font.body, Color.green)
        let textItem2 = DataTextItem("Hello", Font.body, Color.green)
        let imageItem = DataImageItem(Image(systemName: "sun.min"), Color.gray)
        let dateItem = DataDateItem(Date(timeIntervalSinceReferenceDate: TimeInterval(100)), Font.body, Color.black)
        let timeItem = DataTimeItem(Date(timeIntervalSinceReferenceDate: TimeInterval(100)), Font.body, Color.black)
        let durationItem = DataDurationItem(TimeInterval(6000), Font.body, Color.black)
        let listItem = DataTextItem("San Jose", Font.body, Color.green)
        
        let row1 = TableRowItem(leadingAccessories: [icon], trailingAccessory: button, data: [textItem1, imageItem, dateItem, timeItem, durationItem, listItem])
        let row2 = TableRowItem(leadingAccessories: [icon, button], trailingAccessory: button, data: [textItem1, imageItem, dateItem, timeItem, durationItem, listItem])
        let row3 = TableRowItem(leadingAccessories: [icon], trailingAccessory: button, data: [dateItem, textItem1, imageItem, timeItem, durationItem, listItem])
        let row4 = TableRowItem(leadingAccessories: [icon], trailingAccessory: button, data: [textItem2, dateItem, dateItem, imageItem, timeItem, durationItem, listItem])
        
        XCTAssertTrue(row1 == row1)
        XCTAssertTrue(row1 != row2)
        XCTAssertTrue(row1 != row3)
        XCTAssertTrue(row1 != row4)
    }
}
