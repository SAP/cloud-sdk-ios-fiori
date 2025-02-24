import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct KPIItemBaseStyle: KPIItemStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    @State private var isPressed: Bool = false
    public func makeBody(_ configuration: KPIItemConfiguration) -> some View {
        // Add default layout here
        VStack(spacing: 1) {
            buildKPIItems(configuration: configuration, isEnabled: self.isEnabled, isPressed: self.isPressed)
            configuration.kpiCaption
        }
        .environment(\.isPressed, self.isPressed)
        .frame(maxWidth: 216, alignment: configuration.alignment)
        .contentShape(.rect)
        .gesture(self.createGesture())
    }
    
    private func createGesture() -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                self.isPressed = true
            }
            .onEnded { _ in
                self.isPressed = false
            }
    }
}

struct buildKPIItems: View {
    let configuration: KPIItemConfiguration
    let isEnabled: Bool
    let isPressed: Bool
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 1) {
            ForEach(self.configuration.items, id: \.id) { item in
                KPIViewSubItem(kPIViewSubItemValue: item.kPIViewSubItemValue, kPIViewSubItemType: item.kPIViewSubItemType)
                    .alignmentGuide(.bottom) { context in
                        item.kPIViewSubItemType == .icon ? context[.bottom] + 0.3 * context.height : context[.bottom]
                    }
                    .foregroundStyle(getForegroundColor(for: getConfigState(isEnabled: self.isEnabled, isPressed: self.isPressed)))
                    .font(getFont(forType: item.kPIViewSubItemType, typeSize: self.configuration.proposedViewSize))
            }
        }
        .frame(maxWidth: .infinity, alignment: self.configuration.alignment)
        .lineLimit(1)
    }
}

func getFont(forType type: KPISubitemType, typeSize: KPIItemSize) -> Font {
    switch type {
    case .icon:
        switch typeSize {
        case .large:
            return Font.fiori(fixedSize: 18)
        case .small:
            return Font.fiori(fixedSize: 13.5)
        default:
            return Font.fiori(fixedSize: 13.5)
        }
    case .unit:
        switch typeSize {
        case .large:
            return Font.fiori(forTextStyle: .title1, weight: .bold)
        case .small:
            return Font.fiori(forTextStyle: .title3, weight: .bold)
        default:
            return Font.fiori(forTextStyle: .title3, weight: .bold)
        }
    default:
        switch typeSize {
        case .large:
            return Font.fiori(forTextStyle: .largeTitle, weight: .bold)
        case .small:
            return Font.fiori(forTextStyle: .title2, weight: .bold)
        default:
            return Font.fiori(forTextStyle: .title1, weight: .bold)
        }
    }
}

// Default fiori styles
extension KPIItemFioriStyle {
    struct ContentFioriStyle: KPIItemStyle {
        func makeBody(_ configuration: KPIItemConfiguration) -> some View {
            KPIItem(configuration)
        }
    }

    struct KpiCaptionFioriStyle: KpiCaptionStyle {
        let kPIItemConfiguration: KPIItemConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool
        @Environment(\.isPressed) var isPressed: Bool

        func makeBody(_ configuration: KpiCaptionConfiguration) -> some View {
            KpiCaption(configuration)
                .frame(maxWidth: .infinity, alignment: self.kPIItemConfiguration.alignment)
                .lineLimit(2)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundStyle(getForegroundColor(for: getConfigState(isEnabled: self.isEnabled, isPressed: self.isPressed)))
        }
    }
}
