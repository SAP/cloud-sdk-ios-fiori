import FioriThemeManager
import SwiftUI

extension Fiori {
    enum KPIItem {
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
        if let buttonAction = action {
            Button(action: buttonAction) {
                VStack(alignment: .center, spacing: 2) {
                    kpi
                    subtitle
                }
                .frame(maxWidth: 216)
            }.buttonStyle(ButtonContainerStyle())
        } else {
            VStack(alignment: .center, spacing: 2) {
                kpi
                subtitle
            }
            .frame(maxWidth: 216)
        }
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

public extension KPIItem where Kpi == Text, Subtitle == EmptyView {
    /// Returns a KPI item with given configuration.
    /// - Parameters:
    ///   - data: The data of the KPI item.
    ///   - action: The action when user interacts with the KPI item.
    init(data: KPIItemData, action: (() -> Void)? = nil) {
        self.init(kpi: {
            KPIFormatter().create(from: data) ?? Text("")
        }, subtitle: {
            EmptyView()
        })
        self.action = action
    }
    
    init(_ data: KPIItemData?) {
        self.init(data: data ?? KPIItemData.components([]), action: nil)
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
            if self.isEnabled {
                return self.configuration.label
                    .foregroundColor(self.configuration.isPressed ? .preferredColor(.tintColorTapState) : .preferredColor(.tintColor))
            } else {
                return self.configuration.label
                    .foregroundColor(.preferredColor(.primaryLabel))
            }
        }
    }
}
