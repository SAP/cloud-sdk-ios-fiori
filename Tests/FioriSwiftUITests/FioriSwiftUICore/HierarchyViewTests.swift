@testable import FioriSwiftUICore
import SwiftUI
import XCTest

final class HierarchyViewTests: XCTestCase {
    func testIndicator() throws {
        let indicator = HierarchyIndicator(title: AttributedString("Indiator"), onClick: { "id" })
        
        XCTAssertFalse(indicator.isEmpty)
        XCTAssertNotNil(indicator.title)
        XCTAssertFalse(indicator.title.isEmpty)
        XCTAssertNotNil(indicator.icon)
        XCTAssertTrue(indicator.icon.isEmpty)
        XCTAssertTrue(indicator.isMultiline)
        XCTAssertFalse(indicator.isSelected)
        XCTAssertTrue(indicator.isClickable)
        XCTAssertNotNil(indicator.onClick)
        if let onClick = indicator.onClick {
            XCTAssertEqual(onClick(), "id")
        }
        
        let indicator2 = HierarchyIndicator(title: { Text("Indicator") }, onClick: { "id" })
        
        XCTAssertNotNil(indicator2.title)
        XCTAssertNotNil(indicator2.icon)
        XCTAssertTrue(indicator2.isMultiline)
        XCTAssertFalse(indicator2.isSelected)
        XCTAssertTrue(indicator2.isClickable)
        XCTAssertNotNil(indicator2.onClick)
        if let onClick = indicator2.onClick {
            XCTAssertEqual(onClick(), "id")
        }
        
        let indicator3 = HierarchyIndicator(title: AttributedString("Indiator"), isMultiline: false, isSelected: true, isClickable: false)
        
        XCTAssertNotNil(indicator3.title)
        XCTAssertNotNil(indicator3.icon)
        XCTAssertFalse(indicator3.isMultiline)
        XCTAssertTrue(indicator3.isSelected)
        XCTAssertFalse(indicator3.isClickable)
        let onClick = indicator3.onClick
        XCTAssertNil(onClick)
        
        let indicator4 = HierarchyIndicator(title: { Text("Indicator") }, isMultiline: false, isSelected: true, isClickable: false, componentIdentifier: "custom_id")
        
        XCTAssertNotNil(indicator4.title)
        XCTAssertNotNil(indicator4.icon)
        XCTAssertFalse(indicator4.isMultiline)
        XCTAssertTrue(indicator4.isSelected)
        XCTAssertFalse(indicator4.isClickable)
        XCTAssertEqual(indicator4.componentIdentifier, "custom_id")
        let onClick4 = indicator4.onClick
        XCTAssertNil(onClick4)
        
        let indicator5 = HierarchyIndicator(HierarchyIndicatorConfiguration(
            componentIdentifier: "custom_id_1",
            title: ConfigurationViewWrapper(Text("Indicator")),
            icon: ConfigurationViewWrapper(Image(fioriName: "fiori.flag.2")),
            isMultiline: false,
            isSelected: true,
            isClickable: true,
            onClick: { "id" }
        ))
        XCTAssertNotNil(indicator5.title)
        XCTAssertNotNil(indicator5.icon)
        XCTAssertFalse(indicator5.icon.isEmpty)
        XCTAssertFalse(indicator5.isMultiline)
        XCTAssertTrue(indicator5.isSelected)
        XCTAssertTrue(indicator5.isClickable)
        XCTAssertEqual(indicator5.componentIdentifier, "custom_id_1")
        let onClick5 = indicator5.onClick
        XCTAssertNotNil(onClick5)
        if let onClick = onClick5 {
            XCTAssertEqual(onClick(), "id")
        }
        
        let config = HierarchyIndicatorConfiguration(
            componentIdentifier: "custom_id_1",
            title: ConfigurationViewWrapper(Text("Indicator")),
            icon: ConfigurationViewWrapper(Image(fioriName: "fiori.flag.2")),
            isMultiline: false,
            isSelected: true,
            isClickable: true,
            onClick: { "id" }
        )
        XCTAssertTrue(config.isDirectChild("custom_id_1"))
        let indicator6 = HierarchyIndicator(config, shouldApplyDefaultStyle: true)
        
        XCTAssertNotNil(indicator6.body)
        XCTAssertNotNil(indicator6.title)
        XCTAssertNotNil(indicator6.icon)
        XCTAssertFalse(indicator6.icon.isEmpty)
        XCTAssertFalse(indicator6.isMultiline)
        XCTAssertTrue(indicator6.isSelected)
        XCTAssertTrue(indicator6.isClickable)
        XCTAssertEqual(indicator6.componentIdentifier, "custom_id_1")
        let onClick6 = indicator6.onClick
        XCTAssertNotNil(onClick6)
        if let onClick = onClick6 {
            XCTAssertEqual(onClick(), "id")
        }
        
        let indicator7 = HierarchyIndicator(config, shouldApplyDefaultStyle: false)
        XCTAssertNotNil(indicator7.body)
        
        let styleComponent = HierarchyIndicator(config)
            .hierarchyIndicatorStyle(AnyHierarchyIndicatorStyle { theConfig in
                HierarchyIndicator(theConfig)
            })
        
        XCTAssertNotNil(styleComponent)
        
        let style = AnyHierarchyIndicatorStyle { config in
            HierarchyIndicator(config)
        }
        
        XCTAssertNotNil(style.makeBody(config))
        
        let style2 = HierarchyIndicatorFioriStyle()
        XCTAssertNotNil(style2.makeBody(config))
        
        let style3 = HierarchyIndicatorBaseStyle()
        XCTAssertNotNil(style3.makeBody(config))
        
        let style4 = ResolvedHierarchyIndicatorStyle(style: HierarchyIndicatorFioriStyle.ContentFioriStyle(), configuration: config)
        XCTAssertNotNil(style4.body)
        
        let titleStyle = HierarchyIndicatorFioriStyle.TitleFioriStyle(hierarchyIndicatorConfiguration: config)
        XCTAssertNotNil(titleStyle.makeBody(TitleConfiguration(title: ConfigurationViewWrapper(Text("test")))))
        
        let titleStyle1 = HierarchyIndicatorTitleStyle(style: AnyTitleStyle { configuration in
            configuration.title
        })
        XCTAssertNotNil(titleStyle1.makeBody(config))
        
        let iconStyle = HierarchyIndicatorFioriStyle.IconFioriStyle(hierarchyIndicatorConfiguration: config)
        XCTAssertNotNil(iconStyle.makeBody(IconConfiguration(icon: ConfigurationViewWrapper(Text("test")))))
        
        let iconStyl1 = HierarchyIndicatorIconStyle(style: AnyIconStyle { configuration in
            configuration.icon
        })
        XCTAssertNotNil(iconStyl1.makeBody(config))
    }
    
    func testHeader() throws {
        let header = HierarchyViewHeader(title: "Header")
        
        XCTAssertFalse(header.isEmpty)
        XCTAssertNotNil(header.title)
        XCTAssertNotNil(header.leadingAccessory)
        XCTAssertNotNil(header.trailingAccessory)
        
        let header1 = HierarchyViewHeader(
            title: { Text("Header") },
            leadingAccessory: { Image(fioriName: "fiori.flag.2") },
            trailingAccessory: { Image(fioriName: "fiori.flag.2") },
            componentIdentifier: "custom_id_1"
        )
        XCTAssertNotNil(header1.title)
        XCTAssertNotNil(header1.leadingAccessory)
        XCTAssertNotNil(header1.trailingAccessory)
        XCTAssertEqual(header1.componentIdentifier, "custom_id_1")
        
        let header1_1 = HierarchyViewHeader(
            title: { Text("Header") }
        )
        XCTAssertNotNil(header1_1.title)
        XCTAssertNotNil(header1_1.leadingAccessory)
        XCTAssertTrue(header1_1.leadingAccessory.isEmpty)
        XCTAssertNotNil(header1_1.trailingAccessory)
        XCTAssertTrue(header1_1.trailingAccessory.isEmpty)
        XCTAssertEqual(header1_1.componentIdentifier, HierarchyViewHeader.identifier)
        
        let config1 = HierarchyViewHeaderConfiguration(title: ConfigurationViewWrapper(Text("Heaader")), leadingAccessory: ConfigurationViewWrapper(Image(fioriName: "fiori.flag.2")), trailingAccessory: ConfigurationViewWrapper(Image(fioriName: "fiori.flag.2")))
        XCTAssertTrue(config1.isDirectChild(HierarchyViewHeader.identifier))
        
        let header2 = HierarchyViewHeader(config1)
        XCTAssertNotNil(header2.title)
        XCTAssertNotNil(header2.leadingAccessory)
        XCTAssertNotNil(header2.trailingAccessory)
        
        let header3 = HierarchyViewHeader(config1, shouldApplyDefaultStyle: true)
        XCTAssertNotNil(header3.body)
        XCTAssertNotNil(header3.title)
        XCTAssertNotNil(header3.leadingAccessory)
        XCTAssertNotNil(header3.trailingAccessory)
        
        let header4 = HierarchyViewHeader(config1, shouldApplyDefaultStyle: false)
        XCTAssertNotNil(header4.body)
        
        let styleComponent = HierarchyViewHeader(config1)
            .hierarchyViewHeaderStyle(AnyHierarchyViewHeaderStyle { theConfig in
                HierarchyViewHeader(theConfig)
            })
        
        XCTAssertNotNil(styleComponent)
        
        let style = AnyHierarchyViewHeaderStyle { config in
            HierarchyViewHeader(config)
        }
        
        XCTAssertNotNil(style.makeBody(config1))
        
        let style2 = HierarchyViewHeaderFioriStyle()
        XCTAssertNotNil(style2.makeBody(config1))
        
        let style3 = HierarchyViewHeaderBaseStyle()
        XCTAssertNotNil(style3.makeBody(config1))
        
        let style4 = ResolvedHierarchyViewHeaderStyle(style: HierarchyViewHeaderFioriStyle.ContentFioriStyle(), configuration: config1)
        XCTAssertNotNil(style4.body)
        
        let titleStyle = HierarchyViewHeaderFioriStyle.TitleFioriStyle(hierarchyViewHeaderConfiguration: config1)
        XCTAssertNotNil(titleStyle.makeBody(TitleConfiguration(title: ConfigurationViewWrapper(Text("test")))))
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
        XCTAssertFalse(itemView2.isEmpty)
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
        XCTAssertNotNil(itemView2.hierarchyIndicator)
        
        let itemView2_1 = HierarchyItemView(
            title: { Text("itemView2") }
        )
        XCTAssertNotNil(itemView2_1.title)
        XCTAssertNotNil(itemView2_1.subtitle)
        XCTAssertNotNil(itemView2_1.footnote)
        XCTAssertTrue(itemView2_1.subtitle.isEmpty)
        XCTAssertTrue(itemView2_1.footnote.isEmpty)
        XCTAssertEqual(itemView2_1.accessoryType, AccessoryType.none)
        XCTAssertNotNil(itemView2_1.status)
        XCTAssertTrue(itemView2_1.status.isEmpty)
        XCTAssertNotNil(itemView2_1.detailImage)
        XCTAssertTrue(itemView2_1.detailImage.isEmpty)
        XCTAssertNotNil(itemView2_1.icons)
        XCTAssertTrue(itemView2_1.icons.isEmpty)
        XCTAssertNotNil(itemView2_1.hierarchyIndicator)
        XCTAssertTrue(itemView2_1.hierarchyIndicator.isEmpty)
        
        let config = HierarchyItemViewConfiguration(
            title: ConfigurationViewWrapper(Text("itemView2")),
            subtitle: ConfigurationViewWrapper(Text("subtitle")),
            footnote: ConfigurationViewWrapper(Text("subtitle")),
            icons: ConfigurationViewWrapper(Text("subtitle")),
            detailImage: ConfigurationViewWrapper(Image(fioriName: "fiori.flag.2")),
            status: ConfigurationViewWrapper(Image(fioriName: "fiori.flag.2")),
            accessoryType: .detail,
            hierarchyIndicator: ConfigurationViewWrapper(HierarchyIndicator(title: AttributedString("id")))
        )
        XCTAssertTrue(config.isDirectChild(HierarchyItemView.identifier))
        
        let itemView3 = HierarchyItemView(config)
        XCTAssertNotNil(itemView3.title)
        XCTAssertNotNil(itemView3.subtitle)
        XCTAssertNotNil(itemView3.footnote)
        XCTAssertFalse(itemView3.subtitle.isEmpty)
        XCTAssertFalse(itemView3.footnote.isEmpty)
        XCTAssertEqual(itemView3.accessoryType, AccessoryType.detail)
        XCTAssertNotNil(itemView3.status)
        XCTAssertFalse(itemView3.status.isEmpty)
        XCTAssertNotNil(itemView3.detailImage)
        XCTAssertFalse(itemView3.detailImage.isEmpty)
        XCTAssertNotNil(itemView3.icons)
        XCTAssertFalse(itemView3.icons.isEmpty)
        XCTAssertNotNil(itemView3.hierarchyIndicator)
        
        let itemView4 = HierarchyItemView(config, shouldApplyDefaultStyle: true)
        XCTAssertNotNil(itemView4.body)
        
        let itemView5 = HierarchyItemView(config, shouldApplyDefaultStyle: false)
        XCTAssertNotNil(itemView5.body)
        
        let styleComponent = HierarchyItemView(config)
            .hierarchyItemViewStyle(AnyHierarchyItemViewStyle { theConfig in
                HierarchyItemView(theConfig)
            })
        
        XCTAssertNotNil(styleComponent)
        
        let style = AnyHierarchyItemViewStyle { config in
            HierarchyItemView(config)
        }
        
        XCTAssertNotNil(style.makeBody(config))
        
        let style2 = HierarchyItemViewFioriStyle()
        XCTAssertNotNil(style2.makeBody(config))
        
        let style3 = HierarchyItemViewBaseStyle()
        XCTAssertNotNil(style3.makeBody(config))
        
        let style4 = ResolvedHierarchyItemViewStyle(style: HierarchyItemViewFioriStyle.ContentFioriStyle(), configuration: config)
        XCTAssertNotNil(style4.body)
        
        let titleStyle = HierarchyItemViewFioriStyle.TitleFioriStyle(hierarchyItemViewConfiguration: config)
        XCTAssertNotNil(titleStyle.makeBody(TitleConfiguration(title: ConfigurationViewWrapper(Text("test")))))
        
        let subtitleStyle = HierarchyItemViewFioriStyle.SubtitleFioriStyle(hierarchyItemViewConfiguration: config)
        XCTAssertNotNil(subtitleStyle.makeBody(SubtitleConfiguration(subtitle: ConfigurationViewWrapper(Text("test")))))
        
        let footnoteStyle = HierarchyItemViewFioriStyle.FootnoteFioriStyle(hierarchyItemViewConfiguration: config)
        XCTAssertNotNil(footnoteStyle.makeBody(FootnoteConfiguration(footnote: ConfigurationViewWrapper(Text("test")))))
        
        let iconsStyle = HierarchyItemViewFioriStyle.IconsFioriStyle(hierarchyItemViewConfiguration: config)
        XCTAssertNotNil(iconsStyle.makeBody(IconsConfiguration(icons: ConfigurationViewWrapper(Text("test")))))
        
        let detailsStyle = HierarchyItemViewFioriStyle.DetailImageFioriStyle(hierarchyItemViewConfiguration: config)
        XCTAssertNotNil(detailsStyle.makeBody(DetailImageConfiguration(detailImage: ConfigurationViewWrapper(Text("test")))))
        
        let accessoryStyle = HierarchyItemViewFioriStyle.AccessoryViewFioriStyle(hierarchyItemViewConfiguration: config)
        XCTAssertNotNil(accessoryStyle.makeBody(AccessoryViewConfiguration(accessoryType: AccessoryType.detail)))
        
        let statusStyle = HierarchyItemViewFioriStyle.StatusFioriStyle(hierarchyItemViewConfiguration: config)
        XCTAssertNotNil(statusStyle.makeBody(StatusConfiguration(status: ConfigurationViewWrapper(Text("test")))))
        
        let singleLineConfig = HierarchyItemViewConfiguration(
            title: ConfigurationViewWrapper(Text("itemView2")),
            subtitle: ConfigurationViewWrapper(EmptyView()),
            footnote: ConfigurationViewWrapper(EmptyView()),
            icons: ConfigurationViewWrapper(Text("subtitle")),
            detailImage: ConfigurationViewWrapper(Image(fioriName: "fiori.flag.2")),
            status: ConfigurationViewWrapper(Image(fioriName: "fiori.flag.2")),
            accessoryType: .detail,
            hierarchyIndicator: ConfigurationViewWrapper(HierarchyIndicator(title: AttributedString("id")))
        )
        let view = HierarchyItemView(singleLineConfig)
        XCTAssertNotNil(view.body)
    }
    
    func testHierarcyView() throws {
        let dataSource = HierarchySimpleDataSource()
        let view1 = HierarchyView(
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
    
        XCTAssertNotNil(view1.body)
        XCTAssertNotNil(view1.header)
        XCTAssertNotNil(view1.hierarchyItem)
        XCTAssertNil(view1.activeChildItem)
        XCTAssertNil(view1.selectedItems)
        
        let configuration = HierarchyViewConfiguration(
            dataSource: dataSource,
            header: ConfigurationViewWrapper(HierarchyViewHeader(title: AttributedString("Header"))),
            hierarchyItem: { id in
                HierarchyItemView(title: AttributedString(id))
            },
            activeChildItem: Binding<String?>(get: { nil }, set: { _ in }),
            selectedItems: Binding<[String]?>(get: { nil }, set: { _ in })
        )
        XCTAssertTrue(configuration.isDirectChild(HierarchyView.identifier))
        
        let view2 = HierarchyView(configuration)
        
        XCTAssertNotNil(view2.header)
        XCTAssertNotNil(view2.hierarchyItem)
        XCTAssertNil(view2.activeChildItem)
        XCTAssertNil(view2.selectedItems)
        
        let view3 = HierarchyView(configuration, shouldApplyDefaultStyle: true)
        XCTAssertNotNil(view3.body)
        
        let view4 = HierarchyView(configuration, shouldApplyDefaultStyle: false)
        XCTAssertNotNil(view4.body)
        
        let view5 = HierarchyView(configuration)
            .hierarchyViewStyle(AnyHierarchyViewStyle { viewConfig in
                HierarchyView(viewConfig)
            })
        
        XCTAssertNotNil(view5)
        
        let style = AnyHierarchyViewStyle { config in
            HierarchyView(config)
        }
        
        XCTAssertNotNil(style.makeBody(configuration))
        
        let style2 = HierarchyViewFioriStyle()
        XCTAssertNotNil(style2.makeBody(configuration))
        
        let style3 = ResolvedHierarchyViewStyle(style: HierarchyViewFioriStyle.ContentFioriStyle(), configuration: configuration)
        XCTAssertNotNil(style3.body)
    }
    
    func testDataType() throws {
        let dataSource = HierarchySimpleDataSource()
        let configuration = HierarchyViewConfiguration(
            dataSource: dataSource,
            header: ConfigurationViewWrapper(EmptyView()),
            hierarchyItem: { id in
                HierarchyItemView(title: AttributedString(id))
            },
            activeChildItem: Binding<String?>(get: { nil }, set: { _ in }),
            selectedItems: Binding<[String]?>(get: { ["200"] }, set: { _ in })
        )
        let view = HierarchyView(configuration, dataSource: dataSource)
        XCTAssertNotNil(view.body)
        
        let modelObject = HierarchyViewModelObject()
        modelObject.dataSource = dataSource
        XCTAssertNil(modelObject.currentID)
        modelObject.setCurrentID(dataSource.rootID())
        XCTAssertEqual(modelObject.currentID, "100")
        
        let leading = LeadingAccessory(LeadingAccessoryConfiguration(leadingAccessory: ConfigurationViewWrapper(EmptyView())), modelObject: modelObject, isRTL: false)
        XCTAssertNotNil(leading.body)
        
        let trailing = TrailingAccessory(TrailingAccessoryConfiguration(trailingAccessory: ConfigurationViewWrapper(EmptyView())), modelObject: modelObject, isRTL: false)
        XCTAssertNotNil(trailing.body)
        
        let children = configuration.numberOfChildren(dataSource, parentID: dataSource.rootID())
        XCTAssertEqual(children, 3)
        
        let childId = configuration.childItemID(dataSource, idForChildItemAt: 0, parentID: dataSource.rootID())
        XCTAssertEqual(childId, "200")
        
        var isSelected = configuration.isSelected("200")
        XCTAssertTrue(isSelected)
        
        isSelected = configuration.isSelected("100")
        XCTAssertFalse(isSelected)
        
        modelObject.goChild()
        XCTAssertEqual(modelObject.currentID, "100")
        XCTAssertNil(modelObject.childID)
        XCTAssertNil(modelObject.parentID)
        
        modelObject.setCurrentID("201")
        modelObject.goChild()
        XCTAssertEqual(modelObject.currentID, "201")
        XCTAssertNil(modelObject.childID)
        XCTAssertEqual(modelObject.parentID, "101")
        
        modelObject.setCurrentID("301")
        modelObject.goParent()
        XCTAssertEqual(modelObject.currentID, "201")
        XCTAssertEqual(modelObject.childID, "301")
        XCTAssertEqual(modelObject.parentID, "101")
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
            return String(intValue + 100 + index)
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
