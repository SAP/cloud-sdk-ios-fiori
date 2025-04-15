import FioriSwiftUICore
import Foundation
import SwiftUI

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

struct KPIHeaderExample: View {
    var data: [KPIHeaderItemModel] = [
        KPIItem(kpiCaption: "small", items: [KPISubItemModelImpl(kPISubItemValue: .text("123"), kPISubItemType: .metric)], proposedViewSize: .small, alignment: .center),
        KPIProgressItem(kpiCaption: "Downloading", data: .constant(KPIItemData.percent(0.65))),
        KPIItem(kpiCaption: "Big caption and very very very very very very long text", items: [KPISubItemModelImpl(kPISubItemValue: .text("321"), kPISubItemType: .metric)], proposedViewSize: .large, alignment: .center),
        KPIProgressItem(kpiCaption: "Completed", data: .constant(KPIItemData.percent(1.0)), chartSize: .small)
    ]
    
    var customViewData: [KPIHeaderItemModel] = [
        TestView(width: 120),
        TestView(width: 200),
        TestView(width: 400),
        TestView(width: 200)
    ]

    var body: some View {
        ScrollView {
            VStack {
                KPIHeader(items: self.data, isItemOrderForced: false)
                
                Text("BannerMessage is displayed")
                KPIHeader(items: self.data, bannerMessage: BannerMessage(icon: {
                    Image(systemName: "info.circle")
                }, title: {
                    Text("This is a banner message")
                }), isItemOrderForced: true)

                Text("Init with custom views")
                KPIHeader(items: self.customViewData)
                Spacer()
            }
        }
    }
}

private struct TestView: View {
    var width: CGFloat
    var body: some View {
        ZStack {
            Color.random
            Text(String(format: "width: %.1f", self.width))
        }
        .frame(width: self.width)
    }
}

extension TestView: KPIHeaderItemModel {}
