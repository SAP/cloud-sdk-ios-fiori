import SwiftUI

struct Kpi: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .truncationMode(.tail)
            .multilineTextAlignment(.center)
    }
}

struct Subtitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(2)
            .font(.subheadline)
            .truncationMode(.tail)
            .multilineTextAlignment(.center)
    }
}

extension Fiori {
    enum KPIItem {
        typealias KpiCumulative = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier

        static let kpi = Kpi()
        static let subtitle = Subtitle()
        static let kpiCumulative = KpiCumulative()
        static let subtitleCumulative = SubtitleCumulative()
    }
}

extension KPIItem: View {
    public var body: some View {
        Button(action: action ?? {}) {
            VStack(alignment: .center, spacing: 2) {
                kpi
                subtitle
            }
            .frame(maxWidth: 216)
        }.buttonStyle(ButtonContainerStyle())
    }
}

public extension KPIItem where Kpi == Text, Subtitle == Text {
    /// Returns a KPI item with given configuration.
    /// - Parameters:
    ///   - data: The data of the KPI item.
    ///   - subtitle: The subtitle of the KPI item.
    ///   - action: The action when user interacts with the KPI item.
    init(data: KPIItemData, subtitle: String, action: (() -> Void)? = nil) {
        self.init(kpi: {
            KPIFormatter().create(from: data) ?? Text("")
        }, subtitle: {
            Text(subtitle)
        })
        self.action = action
    }
}

struct ButtonContainerStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        TappableStyleView(configuration: configuration)
    }
}

private extension ButtonContainerStyle {
    struct TappableStyleView: View {
        @Environment(\.isEnabled) var isEnabled
        let configuration: ButtonContainerStyle.Configuration
        var body: some View {
            if isEnabled {
                return configuration.label
                    .foregroundColor(configuration.isPressed ? .preferredColor(.tintColorTapState) : .preferredColor(.tintColor))
            } else {
                return configuration.label
                    .foregroundColor(.preferredColor(.primaryLabel))
            }
        }
    }
}
