@testable import FioriSwiftUICore
import FioriThemeManager
import SwiftUI
import XCTest

struct KPISubItemModelImpl: KPISubItemModel {
    let id: UUID
    let kPISubItemValue: TextOrIcon
    let kPISubItemType: KPISubitemType

    init(id: UUID = UUID(), kPISubItemValue: TextOrIcon, kPISubItemType: KPISubitemType) {
        self.id = id
        self.kPISubItemValue = kPISubItemValue
        self.kPISubItemType = kPISubItemType
    }
}

final class KPIHeaderTests: XCTestCase {
    var data: [KPIHeaderItemModel] = [
        KPIItem(kpiCaption: "small", items: [KPISubItemModelImpl(kPISubItemValue: .text("123"), kPISubItemType: .metric)], proposedViewSize: .small, alignment: .center),
        KPIProgressItem(kpiCaption: "Downloading", data: .constant(KPIItemData.percent(0.65))),
        KPIItem(kpiCaption: "Big caption and long text", items: [KPISubItemModelImpl(kPISubItemValue: .text("321"), kPISubItemType: .metric)], proposedViewSize: .large, alignment: .center),
        KPIProgressItem(kpiCaption: "Completed", data: .constant(KPIItemData.percent(1.0)), chartSize: .small)
    ]
    
    func testReArrangeItemsCount() throws {
        let testView = KPIContainerStack(data)
        XCTAssertLessThanOrEqual(testView.reArrangeItems(isItemOrderForced: false).count, 4)
    }
}
