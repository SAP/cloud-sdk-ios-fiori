import FioriSwiftUICore
import SwiftUI

struct KPIViewSubItemModelImplementation: KPIViewSubItemModel {
    let id: UUID
    let kPIViewSubItemValue: TextOrIcon
    let kPIViewSubItemType: KPISubitemType
    
    init(id: UUID = UUID(), kPIViewSubItemValue: TextOrIcon, kPIViewSubItemType: KPISubitemType) {
        self.id = id
        self.kPIViewSubItemValue = kPIViewSubItemValue
        self.kPIViewSubItemType = kPIViewSubItemType
    }
}

public struct KPIItemExample: View {
    @State private var item0: [KPIViewSubItemModelImplementation] = [
        KPIViewSubItemModelImplementation(kPIViewSubItemValue: .icon(Image(systemName: "triangleshape.fill")), kPIViewSubItemType: KPISubitemType.icon),
        KPIViewSubItemModelImplementation(kPIViewSubItemValue: .text("123"), kPIViewSubItemType: KPISubitemType.metric),
        KPIViewSubItemModelImplementation(kPIViewSubItemValue: .text("USD"), kPIViewSubItemType: KPISubitemType.unit)
    ]
    @State private var item1: [KPIViewSubItemModelImplementation] = [
        KPIViewSubItemModelImplementation(kPIViewSubItemValue: .icon(Image(systemName: "triangleshape.fill")), kPIViewSubItemType: KPISubitemType.icon),
        KPIViewSubItemModelImplementation(kPIViewSubItemValue: .icon(Image(systemName: "dollarsign")), kPIViewSubItemType: KPISubitemType.icon),
        KPIViewSubItemModelImplementation(kPIViewSubItemValue: .text("797"), kPIViewSubItemType: KPISubitemType.metric),
        KPIViewSubItemModelImplementation(kPIViewSubItemValue: .text("USD"), kPIViewSubItemType: KPISubitemType.unit)
    ]
    public var body: some View {
        VStack {
            HStack {
                KPIItem(kpiCaption: "abc", items: .constant(self.item0.map { $0 as any KPIViewSubItemModel }), proposedViewSize: .small)
            }
            HStack {
                KPIItem(kpiCaption: "abc", items: .constant(self.item0.map { $0 as any KPIViewSubItemModel }), proposedViewSize: .small)
                    .disabled(true)
            }
            HStack {
                KPIItem(kpiCaption: "looooooooooooooooooooooooooooooooong caption", items: .constant(self.item0.map { $0 as any KPIViewSubItemModel }), proposedViewSize: .medium, alignment: .leading)
                Spacer()
            }
            HStack {
                KPIItem(kpiCaption: "abc", items: .constant(self.item0.map { $0 as any KPIViewSubItemModel }), proposedViewSize: .medium, alignment: .leading)
                    .disabled(true)
                Spacer()
            }
            HStack {
                Spacer()
                KPIItem(kpiCaption: "abc", items: .constant(self.item0.map { $0 as any KPIViewSubItemModel }), proposedViewSize: .large, alignment: .trailing)
            }
            HStack {
                Spacer()
                KPIItem(kpiCaption: "abc", items: .constant(self.item0.map { $0 as any KPIViewSubItemModel }), proposedViewSize: .large, alignment: .trailing)
                    .disabled(true)
            }
            HStack {
                KPIItem(kpiCaption: "leading alignment", items: .constant(self.item1.map { $0 as any KPIViewSubItemModel }), proposedViewSize: .medium, alignment: .leading)
                    .kPIViewSubItemStyle(content: { config in
                        if config.kPIViewSubItemType == KPISubitemType.icon {
                            KPIViewSubItem(config)
                                .foregroundStyle(Color.red)
                        } else if config.kPIViewSubItemType == KPISubitemType.unit {
                            KPIViewSubItem(config)
                                .foregroundStyle(Color.purple)
                        } else {
                            KPIViewSubItem(config)
                                .foregroundStyle(Color.yellow)
                        }
                    })
                    .kpiCaptionStyle(content: { config in
                        KpiCaption(config)
                            .foregroundStyle(Color.cyan)
                    })
                Spacer()
            }
        }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
    }
}

struct KPIItemExample_Previews: PreviewProvider {
    static var previews: some View {
        KPIItemExample()
    }
}
