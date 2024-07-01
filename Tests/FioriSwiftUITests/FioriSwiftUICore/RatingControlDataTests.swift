@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class RatingControlDataTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @State var rating = 2
    func testEditable() throws {
        let ratingConfig = RatingControlConfiguration(rating: $rating, ratingControlStyle: .editable, ratingBounds: 0 ... 5, onImage: nil, offImage: nil, itemSize: nil, onColor: nil, offColor: nil, interItemSpacing: nil)
        XCTAssertEqual(ratingConfig.getOnColor().cgColor, Color.preferredColor(.tintColor).cgColor)
        XCTAssertEqual(ratingConfig.getOffColor().cgColor, Color.preferredColor(.tintColor).cgColor)
        XCTAssertEqual(ratingConfig.getScale(), Image.Scale.large)
        XCTAssertEqual(ratingConfig.getItemSize(), CGSize(width: 28, height: 28))
        XCTAssertEqual(ratingConfig.getItemSpacing(), CGFloat(4))
    }

    func testEditableDisabled() throws {
        let ratingConfig = RatingControlConfiguration(rating: $rating, ratingControlStyle: .editableDisabled, ratingBounds: 0 ... 5, onImage: nil, offImage: nil, itemSize: nil, onColor: nil, offColor: nil, interItemSpacing: nil)
        XCTAssertEqual(ratingConfig.getOnColor().cgColor, Color.preferredColor(.tintColor).cgColor)
        XCTAssertEqual(ratingConfig.getOffColor().cgColor, Color.preferredColor(.tintColor).cgColor)
        XCTAssertEqual(ratingConfig.getScale(), Image.Scale.large)
        XCTAssertEqual(ratingConfig.getItemSize(), CGSize(width: 28, height: 28))
        XCTAssertEqual(ratingConfig.getItemSpacing(), CGFloat(4))
    }

    func testStandard() throws {
        let ratingConfig = RatingControlConfiguration(rating: $rating, ratingControlStyle: .standard, ratingBounds: 0 ... 5, onImage: nil, offImage: nil, itemSize: nil, onColor: nil, offColor: nil, interItemSpacing: nil)
        XCTAssertEqual(ratingConfig.getOnColor().cgColor, Color.preferredColor(.tertiaryLabel).cgColor)
        XCTAssertEqual(ratingConfig.getOffColor().cgColor, Color.preferredColor(.tertiaryLabel).cgColor)
        XCTAssertEqual(ratingConfig.getScale(), Image.Scale.small)
        XCTAssertEqual(ratingConfig.getItemSize(), CGSize(width: 16, height: 16))
        XCTAssertEqual(ratingConfig.getItemSpacing(), CGFloat(2))
    }

    func testAccented() throws {
        let ratingConfig = RatingControlConfiguration(rating: $rating, ratingControlStyle: .accented, ratingBounds: 0 ... 5, onImage: nil, offImage: nil, itemSize: nil, onColor: nil, offColor: nil, interItemSpacing: nil)
        XCTAssertEqual(ratingConfig.getOnColor().cgColor, Color.preferredColor(.mango4).cgColor)
        XCTAssertEqual(ratingConfig.getOffColor().cgColor, Color.preferredColor(.mango4).cgColor)
        XCTAssertEqual(ratingConfig.getScale(), Image.Scale.small)
        XCTAssertEqual(ratingConfig.getItemSize(), CGSize(width: 16, height: 16))
        XCTAssertEqual(ratingConfig.getItemSpacing(), CGFloat(2))
    }

    func testRatingItems() throws {
        let ratingConfig = RatingControlConfiguration(rating: $rating, ratingControlStyle: .editable, ratingBounds: 0 ... 5, onImage: nil, offImage: nil, itemSize: nil, onColor: nil, offColor: nil, interItemSpacing: nil)
        let items = ratingConfig.ratingItems(2)
        XCTAssertEqual(items.count, 5)
        XCTAssertEqual(items[0].isOn, true)
        XCTAssertEqual(items[1].isOn, true)
        XCTAssertEqual(items[2].isOn, false)
        XCTAssertEqual(items[3].isOn, false)
        XCTAssertEqual(items[4].isOn, false)

        let ratingConfig2 = RatingControlConfiguration(rating: $rating, ratingControlStyle: .accented, ratingBounds: -5 ... 5, onImage: nil, offImage: nil, itemSize: nil, onColor: nil, offColor: nil, interItemSpacing: nil)
        let items2 = ratingConfig2.ratingItems(2)
        XCTAssertEqual(items2.count, 10)
        XCTAssertEqual(items2[0].isOn, true)
        XCTAssertEqual(items2[1].isOn, true)
        XCTAssertEqual(items2[2].isOn, true)
        XCTAssertEqual(items2[3].isOn, true)
        XCTAssertEqual(items2[4].isOn, true)
        XCTAssertEqual(items2[5].isOn, true)
        XCTAssertEqual(items2[6].isOn, true)
        XCTAssertEqual(items2[7].isOn, false)
        XCTAssertEqual(items2[8].isOn, false)
        XCTAssertEqual(items2[9].isOn, false)
    }
}
