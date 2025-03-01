import FioriSwiftUICore
import SwiftUI

struct KPISubItemModelImplementation: KPISubItemModel {
    let id: UUID
    let kPISubItemValue: TextOrIcon
    let kPISubItemType: KPISubitemType
    
    init(id: UUID = UUID(), kPISubItemValue: TextOrIcon, kPISubItemType: KPISubitemType) {
        self.id = id
        self.kPISubItemValue = kPISubItemValue
        self.kPISubItemType = kPISubItemType
    }
}

public struct KPIItemExample: View {
    private var item0: [KPISubItemModelImplementation] = [
        KPISubItemModelImplementation(kPISubItemValue: .icon(Image(systemName: "triangleshape.fill")), kPISubItemType: KPISubitemType.icon),
        KPISubItemModelImplementation(kPISubItemValue: .text("123"), kPISubItemType: KPISubitemType.metric),
        KPISubItemModelImplementation(kPISubItemValue: .text("USD"), kPISubItemType: KPISubitemType.unit)
    ]
    private var item1: [KPISubItemModelImplementation] = [
        KPISubItemModelImplementation(kPISubItemValue: .icon(Image(systemName: "triangleshape.fill")), kPISubItemType: KPISubitemType.icon),
        KPISubItemModelImplementation(kPISubItemValue: .icon(Image(systemName: "dollarsign")), kPISubItemType: KPISubitemType.icon),
        KPISubItemModelImplementation(kPISubItemValue: .text("797"), kPISubItemType: KPISubitemType.metric),
        KPISubItemModelImplementation(kPISubItemValue: .text("USD"), kPISubItemType: KPISubitemType.unit)
    ]
    public var body: some View {
        VStack {
            HStack {
                KPIItem(kpiCaption: "abc", items: self.item0, proposedViewSize: .small)
            }
            HStack {
                KPIItem(kpiCaption: "abc", items: self.item0, proposedViewSize: .small)
                    .disabled(true)
            }
            HStack {
                KPIItem(kpiCaption: "looooooooooooooooooooooooooooooooong caption", items: self.item0, proposedViewSize: .medium, alignment: .leading)
                Spacer()
            }
            HStack {
                KPIItem(kpiCaption: "abc", items: self.item0, proposedViewSize: .medium, alignment: .leading)
                    .disabled(true)
                Spacer()
            }
            HStack {
                Spacer()
                KPIItem(kpiCaption: "abc", items: self.item0, proposedViewSize: .large, alignment: .trailing)
            }
            HStack {
                Spacer()
                KPIItem(kpiCaption: "abc", items: self.item0, proposedViewSize: .large, alignment: .trailing)
                    .disabled(true)
            }
            HStack {
                KPIItem(kpiCaption: "leading alignment", items: self.item1, proposedViewSize: .medium, alignment: .leading)
                    .kPISubItemStyle(content: { config in
                        if config.kPISubItemType == KPISubitemType.icon {
                            KPISubItem(config)
                                .foregroundStyle(Color.red)
                        } else if config.kPISubItemType == KPISubitemType.unit {
                            KPISubItem(config)
                                .foregroundStyle(Color.purple)
                        } else {
                            KPISubItem(config)
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
