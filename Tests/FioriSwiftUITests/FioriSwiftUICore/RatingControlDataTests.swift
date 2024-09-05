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

    func testEditable() throws {
        let ratingConfig = RatingControlConfiguration(rating: .constant(2), ratingControlStyle: .editable, ratingBounds: 0 ... 5, onImage: nil, offImage: nil, halfImage: nil, itemSize: nil, onColor: nil, offColor: nil, interItemSpacing: nil, ratingValueFormat: nil, valueLabelFont: nil, valueLabelColor: nil, showsValueLabel: false, averageRating: nil, averageRatingFormat: "%.1f", reviewCount: nil, reviewCountFormat: nil, reviewCountCeiling: nil, reviewCountCeilingFormat: nil, showsReviewCountLabel: false)
        XCTAssertEqual(ratingConfig.getOnColor().cgColor, Color.preferredColor(.tintColor).cgColor)
        XCTAssertEqual(ratingConfig.getOffColor().cgColor, Color.preferredColor(.tintColor).cgColor)
        XCTAssertEqual(ratingConfig.getScale(), Image.Scale.large)
        XCTAssertEqual(ratingConfig.getItemSize(), CGSize(width: 28, height: 28))
        XCTAssertEqual(ratingConfig.getItemSpacing(), CGFloat(8))
    }

    func testEditableDisabled() throws {
        let ratingConfig = RatingControlConfiguration(rating: .constant(2), ratingControlStyle: .editableDisabled, ratingBounds: 0 ... 5, onImage: nil, offImage: nil, halfImage: nil, itemSize: nil, onColor: nil, offColor: nil, interItemSpacing: nil, ratingValueFormat: nil, valueLabelFont: nil, valueLabelColor: nil, showsValueLabel: false, averageRating: nil, averageRatingFormat: "%.1f", reviewCount: nil, reviewCountFormat: nil, reviewCountCeiling: nil, reviewCountCeilingFormat: nil, showsReviewCountLabel: false)
        XCTAssertEqual(ratingConfig.getOnColor().cgColor, Color.preferredColor(.tintColor).cgColor)
        XCTAssertEqual(ratingConfig.getOffColor().cgColor, Color.preferredColor(.tintColor).cgColor)
        XCTAssertEqual(ratingConfig.getScale(), Image.Scale.large)
        XCTAssertEqual(ratingConfig.getItemSize(), CGSize(width: 28, height: 28))
        XCTAssertEqual(ratingConfig.getItemSpacing(), CGFloat(8))
    }

    func testStandard() throws {
        let ratingConfig = RatingControlConfiguration(rating: .constant(2), ratingControlStyle: .standard, ratingBounds: 0 ... 5, onImage: nil, offImage: nil, halfImage: nil, itemSize: nil, onColor: nil, offColor: nil, interItemSpacing: nil, ratingValueFormat: nil, valueLabelFont: nil, valueLabelColor: nil, showsValueLabel: false, averageRating: nil, averageRatingFormat: "%.1f", reviewCount: nil, reviewCountFormat: nil, reviewCountCeiling: nil, reviewCountCeilingFormat: nil, showsReviewCountLabel: false)
        XCTAssertEqual(ratingConfig.getOnColor().cgColor, Color.preferredColor(.tertiaryLabel).cgColor)
        XCTAssertEqual(ratingConfig.getOffColor().cgColor, Color.preferredColor(.tertiaryLabel).cgColor)
        XCTAssertEqual(ratingConfig.getScale(), Image.Scale.small)
        XCTAssertEqual(ratingConfig.getItemSize(), CGSize(width: 16, height: 16))
        XCTAssertEqual(ratingConfig.getItemSpacing(), CGFloat(6))
    }

    func testAccented() throws {
        let ratingConfig = RatingControlConfiguration(rating: .constant(2), ratingControlStyle: .accented, ratingBounds: 0 ... 5, onImage: nil, offImage: nil, halfImage: nil, itemSize: nil, onColor: nil, offColor: nil, interItemSpacing: nil, ratingValueFormat: nil, valueLabelFont: nil, valueLabelColor: nil, showsValueLabel: false, averageRating: nil, averageRatingFormat: "%.1f", reviewCount: nil, reviewCountFormat: nil, reviewCountCeiling: nil, reviewCountCeilingFormat: nil, showsReviewCountLabel: false)
        XCTAssertEqual(ratingConfig.getOnColor().cgColor, Color.preferredColor(.mango4).cgColor)
        XCTAssertEqual(ratingConfig.getOffColor().cgColor, Color.preferredColor(.mango4).cgColor)
        XCTAssertEqual(ratingConfig.getScale(), Image.Scale.small)
        XCTAssertEqual(ratingConfig.getItemSize(), CGSize(width: 16, height: 16))
        XCTAssertEqual(ratingConfig.getItemSpacing(), CGFloat(6))
    }

    func testRatingItems() throws {
        let ratingConfig = RatingControlConfiguration(rating: .constant(2), ratingControlStyle: .editable, ratingBounds: 0 ... 5, onImage: nil, offImage: nil, halfImage: nil, itemSize: nil, onColor: nil, offColor: nil, interItemSpacing: nil, ratingValueFormat: nil, valueLabelFont: nil, valueLabelColor: nil, showsValueLabel: false, averageRating: nil, averageRatingFormat: "%.1f", reviewCount: nil, reviewCountFormat: nil, reviewCountCeiling: nil, reviewCountCeilingFormat: nil, showsReviewCountLabel: false)
        let items = ratingConfig.ratingItems(2)
        XCTAssertEqual(items.count, 5)
        XCTAssertEqual(items[0].isOn, true)
        XCTAssertEqual(items[1].isOn, true)
        XCTAssertEqual(items[2].isOn, false)
        XCTAssertEqual(items[3].isOn, false)
        XCTAssertEqual(items[4].isOn, false)

        let ratingConfig2 = RatingControlConfiguration(rating: .constant(2), ratingControlStyle: .accented, ratingBounds: -5 ... 5, onImage: nil, offImage: nil, halfImage: nil, itemSize: nil, onColor: nil, offColor: nil, interItemSpacing: nil, ratingValueFormat: nil, valueLabelFont: nil, valueLabelColor: nil, showsValueLabel: false, averageRating: nil, averageRatingFormat: "%.1f", reviewCount: nil, reviewCountFormat: nil, reviewCountCeiling: nil, reviewCountCeilingFormat: nil, showsReviewCountLabel: false)
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

        let ratingConfig3 = RatingControlConfiguration(rating: .constant(2), ratingControlStyle: .standard, ratingBounds: 0 ... 5, onImage: nil, offImage: nil, halfImage: nil, itemSize: nil, onColor: nil, offColor: nil, interItemSpacing: nil, ratingValueFormat: nil, valueLabelFont: nil, valueLabelColor: nil, showsValueLabel: false, averageRating: 3.5, averageRatingFormat: "%.1f", reviewCount: nil, reviewCountFormat: nil, reviewCountCeiling: nil, reviewCountCeilingFormat: nil, showsReviewCountLabel: false)
        let items3 = ratingConfig3.ratingItems(3.5)
        XCTAssertEqual(items3.count, 5)
        XCTAssertEqual(items3[0].isOn, true)
        XCTAssertEqual(items3[1].isOn, true)
        XCTAssertEqual(items3[2].isOn, true)
        XCTAssertEqual(items3[3].isHalf, true)
        XCTAssertEqual(items3[4].isOn, false)
    }
}
