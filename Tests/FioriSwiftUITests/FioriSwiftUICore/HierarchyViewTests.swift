@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class HierarchyViewTests: XCTestCase {
    func testIndicator() throws {
        let indicator = HierarchyIndicator(title: AttributedString("Indiator"), onClick: { "id" })
        
        XCTAssertNotNil(indicator.title)
        XCTAssertNotNil(indicator.icon)
        XCTAssertTrue(indicator.isMultiline)
        XCTAssertFalse(indicator.isSelected)
        XCTAssertTrue(indicator.isClickable)
        XCTAssertNotNil(indicator.onClick)
        if let onClick = indicator.onClick {
            XCTAssertEqual(onClick(), "id")
        }
        
        let indicator2 = HierarchyIndicator(title: AttributedString("Indiator"), isMultiline: false, isSelected: true, isClickable: false)
        
        XCTAssertNotNil(indicator2.title)
        XCTAssertNotNil(indicator2.icon)
        XCTAssertFalse(indicator2.isMultiline)
        XCTAssertTrue(indicator2.isSelected)
        XCTAssertFalse(indicator2.isClickable)
        let onClick = indicator2.onClick
        XCTAssertNil(onClick)
    }
    
    func testHeader() throws {
        let header = HierarchyViewHeader(title: "Header")
        
        XCTAssertNotNil(header.title)
        XCTAssertNotNil(header.leadingAccessory)
        XCTAssertNotNil(header.trailingAccessory)
    }
    
    func testItemView() throws {
        let itemView = HierarchyItemView(title: "itemView")
        XCTAssertNotNil(itemView.title)
        XCTAssertNotNil(itemView.subtitle)
        XCTAssertNotNil(itemView.footnote)
        XCTAssertTrue(itemView.subtitle.isEmpty)
        XCTAssertTrue(itemView.footnote.isEmpty)
        XCTAssertEqual(itemView.accessoryType, AccessoryType.none)
        XCTAssertNotNil(itemView.status)
        XCTAssertTrue(itemView.status.isEmpty)
        XCTAssertNotNil(itemView.detailImage)
        XCTAssertTrue(itemView.detailImage.isEmpty)
        XCTAssertNotNil(itemView.icons)
        XCTAssertTrue(itemView.icons.isEmpty)
        XCTAssertNotNil(itemView.hierarchyIndicator)
        XCTAssertTrue(itemView.hierarchyIndicator.isEmpty)

        let itemView2 = HierarchyItemView(
            title: { Text("itemView2") },
            subtitle: { Text("subtitle") },
            footnote: { Text("footnote") },
            icons: {
                Text("123")
                Image(fioriName: "fiori.flag.2")
            },
            detailImage: { Image(fioriName: "fiori.flag.2") },
            status: { Image(fioriName: "fiori.flag.2") },
            accessoryType: AccessoryType.disclosure,
            hierarchyIndicator: {
                HierarchyIndicator(title: AttributedString("id"))
            }
        )
        XCTAssertNotNil(itemView2.title)
        XCTAssertNotNil(itemView2.subtitle)
        XCTAssertNotNil(itemView2.footnote)
        XCTAssertFalse(itemView2.subtitle.isEmpty)
        XCTAssertFalse(itemView2.footnote.isEmpty)
        XCTAssertEqual(itemView2.accessoryType, AccessoryType.disclosure)
        XCTAssertNotNil(itemView2.status)
        XCTAssertFalse(itemView2.status.isEmpty)
        XCTAssertNotNil(itemView2.detailImage)
        XCTAssertFalse(itemView2.detailImage.isEmpty)
        XCTAssertNotNil(itemView2.icons)
        XCTAssertFalse(itemView2.icons.isEmpty)
        XCTAssertNotNil(itemView.hierarchyIndicator)
    }
    
    func testHierarcyView() throws {
        let dataSource = HierarchySimpleDataSource()
        let view = HierarchyView(
            dataSource: dataSource,
            hierarchyItem: { id in
                HierarchyItemView(
                    title: AttributedString(dataSource.itemTitle(for: id) ?? ""),
                    hierarchyIndicator: {
                        HierarchyIndicator(title: AttributedString(dataSource.itemTitle(for: id) ?? ""))
                    }
                )
            },
            activeChildItem: Binding<String?>(get: { nil }, set: { _ in
                
            }),
            selectedItems: Binding<[String]?>(get: {
                nil
            }, set: { _ in
                
            })
        )
        
        XCTAssertNotNil(view.header)
        XCTAssertNotNil(view.hierarchyItem)
        XCTAssertNil(view.activeChildItem)
        XCTAssertNil(view.selectedItems)
    }
}

struct HierarchySimpleDataSource: HierarchyViewDataSource {
    func rootID() -> String {
        "100"
    }
    
    func numberOfChildren(for id: String) -> Int {
        3
    }
    
    func childID(idForChildItemAt index: Int, with parentID: String) -> String {
        if let intValue = Int(parentID) {
            return String(intValue + index)
        } else {
            return ""
        }
    }
    
    func parentID(for id: String) -> String? {
        if let intValue = Int(id), intValue > 100 {
            return String(intValue - 100)
        } else {
            return nil
        }
    }

    func itemTitle(for id: String) -> String? {
        id
    }
}
