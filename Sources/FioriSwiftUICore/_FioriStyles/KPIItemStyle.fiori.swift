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
            self.buildKPIItems(configuration: configuration, isEnabled: self.isEnabled, isPressed: self.isPressed)
            configuration.kpiCaption
        }
        .environment(\.isPressed, self.isPressed)
        .frame(maxWidth: 216, alignment: configuration.alignment)
        .contentShape(.rect)
        .simultaneousGesture(self.createGesture())
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
    
    private func buildKPIItems(configuration: KPIItemConfiguration, isEnabled: Bool, isPressed: Bool) -> some View {
        HStack(alignment: .bottom, spacing: 1) {
            ForEach(configuration.items, id: \.id) { item in
                KPISubItem(kPISubItemValue: item.kPISubItemValue, kPISubItemType: item.kPISubItemType)
                    .alignmentGuide(.bottom) { context in
                        item.kPISubItemType == .icon ? context[.bottom] + 0.3 * context.height : context[.bottom]
                    }
                    .foregroundStyle(self.getForegroundColor(for: self.getConfigState(isEnabled: isEnabled, isPressed: isPressed)))
                    .font(self.getFont(forType: item.kPISubItemType, typeSize: configuration.proposedViewSize))
            }
        }
        .frame(maxWidth: .infinity, alignment: configuration.alignment)
        .lineLimit(1)
    }
    
    private func getFont(forType type: KPISubitemType, typeSize: KPIItemSize) -> Font {
        switch type {
        case .icon:
            switch typeSize {
            case .large:
                return Font.fiori(forTextStyle: .headline)
            case .small:
                return Font.fiori(forTextStyle: .footnote)
            default:
                return Font.fiori(forTextStyle: .footnote)
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
    
    func getConfigState(isEnabled: Bool, isPressed: Bool) -> ControlState {
        isEnabled ? (isPressed ? .highlighted : .normal) : .disabled
    }

    func getForegroundColor(for state: ControlState) -> Color {
        let foregroundColors: [ControlState: Color] = [.disabled: .preferredColor(.primaryLabel),
                                                       .normal: .preferredColor(.tintColor),
                                                       .highlighted: .preferredColor(.tintColorTapState)]
        
        return foregroundColors[state] ?? .preferredColor(.tintColor)
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
            let baseStyle = KPIItemBaseStyle()
            return KpiCaption(configuration)
                .frame(maxWidth: .infinity, alignment: self.kPIItemConfiguration.alignment)
                .lineLimit(2)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundStyle(baseStyle.getForegroundColor(for: baseStyle.getConfigState(isEnabled: self.isEnabled, isPressed: self.isPressed)))
        }
    }
}

/// Different sizes of KPIItem. The default is .small
public enum KPIItemSize {
    /// Smaller size item.
    case small
    /// Medium size item.
    case medium
    /// Larger size item.
    case large
}

/// KPIItem takes 3 types of subitem
public enum KPISubitemType {
    /// the unit information for the metric displayed
    case unit
    /// an icon may be displayed to the left/right of a metric
    case icon
    /// the value which is being displayed
    case metric
}

public protocol KPISubItemModel: Identifiable {
    /// Unique step ID.
    var id: UUID { get }
    var kPISubItemValue: TextOrIcon { get }
    var kPISubItemType: KPISubitemType { get }
}

/// Extension to provide an initializer for `KPIViewSubItem` from a `KPIViewSubItemModel
public extension KPISubItem {
    init(model: any KPISubItemModel) {
        self.init(kPISubItemValue: model.kPISubItemValue, kPISubItemType: model.kPISubItemType)
    }
}
