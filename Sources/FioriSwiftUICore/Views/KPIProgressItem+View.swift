import SwiftUI

extension Fiori {
    enum KPIProgressItem {
        struct Kpi: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                    .truncationMode(.tail)
                    .multilineTextAlignment(.center)
            }
        }
        
        struct Subtitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.subheadline)
                    .truncationMode(.tail)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
            }
        }
        
        struct Footnote: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.subheadline)
                    .truncationMode(.tail)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
        }
        
        typealias KpiCumulative = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
        typealias FootnoteCumulative = EmptyModifier
        
        static let kpi = Kpi()
        static let subtitle = Subtitle()
        static let footnote = Footnote()
        static let kpiCumulative = KpiCumulative()
        static let subtitleCumulative = SubtitleCumulative()
        static let footnoteCumulative = FootnoteCumulative()
    }
}

extension KPIProgressItem: View {
    public var body: some View {
        let config = FioriProgressViewStyleConfiguration(kpi: AnyView(kpi),
                                                         subtitle: AnyView(subtitle),
                                                         state: configState(),
                                                         fraction: _fraction ?? 0.0)
        return VStack(alignment: .center, spacing: 12) {
            kpiProgressViewStyle.makeBody(configuration: config)
                .frame(width: 130, height: 130)
            footnote
                .frame(maxWidth: 216)
        }
        .gesture(createGesture())
    }
    
    private func createGesture() -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                isPressed = true
            }
            .onEnded { _ in
                isPressed = false
                action?()
            }
    }
    
    private func configState() -> ControlStateSet {
        isEnabled ? (isPressed ? .highlighted : .normal) : .disabled
    }
}

public extension KPIProgressItem where Kpi == Text,
    Subtitle == _ConditionalContent<Text, EmptyView>,
    Footnote == _ConditionalContent<Text, EmptyView>
{
    /// Returns a KPIProgress item with given configuration.
    /// - Parameters:
    ///   - data: The data of the KPIProgress item.
    ///   - subtitle: The subtitle of the KPIProgress item.
    ///   - action: The action when user interacts with the KPIProgress item.
    init(data: KPIItemData, subtitle: String? = nil, footnote: String? = nil, action: (() -> Void)? = nil) {
        self.init(kpi: {
            KPIProgressFormatter().create(from: data) ?? Text("")
        }, fraction: data.fraction(),
        subtitle: {
            subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
        }, footnote: {
            footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
        })
        self.action = action
    }
}

/// Defines view style APIs for an KPIProgressItem
public protocol KPIProgressViewStyle {
    /// A view that represents the body of a KPI progress item.
    associatedtype Body: View

    /// Creates a view that represents the body of a KPI progress item.
    ///
    /// The system calls this method for each ``KPIProgressItem`` instance in a view
    /// hierarchy where this style is the current tag style.
    ///
    /// - Parameter configuration : The properties of the KPI progress item.
    func makeBody(configuration: Self.Configuration) -> Self.Body

    /// The properties of a progress view style.
    typealias Configuration = FioriProgressViewStyleConfiguration
}

/// The properties of a KPI progress item.
public struct FioriProgressViewStyleConfiguration {
    /// Content view for KPI label
    public var kpi: AnyView
    
    /// Content view for subtitle label
    public var subtitle: AnyView
    
    /// Control state for the component
    public var state: ControlStateSet
    
    /// Completed fraction value
    public var fraction: Double
}

public struct AnyKPIProgressViewStyle: KPIProgressViewStyle {
    let view: (FioriProgressViewStyleConfiguration) -> AnyView
    
    init<S: KPIProgressViewStyle>(_ style: S) {
        self.view = {
            AnyView(style.makeBody(configuration: $0))
        }
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        self.view(configuration)
    }
}

public struct FioriCircularProgressViewStyle: KPIProgressViewStyle {
    /// Background stroke color for the progress circle.
    var circleColor: Color = .preferredColor(.primaryFill)
    
    /// Completed fraction colors for the progress circle with control states.
    var fractionColors: [ControlStateSet: Color] = [.normal: .preferredColor(.tintColor),
                                                    .highlighted: .preferredColor(.tintColorTapState)]

    /// Stroke style of the progress circle.
    var circleStyle = StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round)
    
    /// Line width of the progress circle.
    var lineWidth: CGFloat = 2

    /// Foreground colos for label with control states.
    var foregroundColors: [ControlStateSet: Color] = [.disabled: .preferredColor(.primaryLabel),
                                                      .normal: .preferredColor(.tintColor),
                                                      .highlighted: .preferredColor(.tintColorTapState)]
    
    /// Returns an ``FioriCircularProgressViewStyle`` with given configuration.
    /// - Parameters:
    ///   - circleColor: The background stroke color for the progress circle.
    ///   - fractionColors: The completed fraction colors for the progress circle with control states.
    ///   - circleStyle: Stroke style of the progress circle.
    ///   - lineWidth: The line width of the progress circle.
    ///   - foregroundColors: The foreground colos for label with control states.
    public init(circleColor: Color? = nil, fractionColors: [ControlStateSet: Color]? = nil, circleStyle: StrokeStyle? = nil, lineWidth: CGFloat? = nil, foregroundColors: [ControlStateSet: Color]? = nil) {
        if let cc = circleColor {
            self.circleColor = cc
        }
        
        if let fc = fractionColors {
            self.fractionColors = fc
        }
        
        if let cs = circleStyle {
            self.circleStyle = cs
        }

        if let lw = lineWidth {
            self.lineWidth = lw
        }
        
        if let fcs = foregroundColors {
            self.foregroundColors = fcs
        }
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        ZStack {
            FioriCircularProgressView(fraction: configuration.fraction, circleColor: circleColor, completedFractionColor: getFractionColor(configuration.state), circleStyle: circleStyle, lineWidth: lineWidth)
            VStack(alignment: .center, spacing: 2) {
                configuration.kpi.frame(maxWidth: 108)
                configuration.subtitle.frame(maxWidth: 94)
            }.foregroundColor(getForegroundColor(configuration.state))
        }
    }
    
    private func getForegroundColor(_ state: ControlStateSet) -> Color {
        if let devColor = foregroundColors[state] {
            return devColor
        } else {
            switch state {
            case .normal:
                return .preferredColor(.tintColor)
            case .highlighted:
                return .preferredColor(.tintColorTapState)
            default:
                return .preferredColor(.primaryLabel)
            }
        }
    }
    
    private func getFractionColor(_ state: ControlStateSet) -> Color {
        if let devColor = fractionColors[state] {
            return devColor
        } else {
            switch state {
            case .highlighted:
                return .preferredColor(.tintColorTapState)
            default:
                return .preferredColor(.tintColor)
            }
        }
    }
}

struct FioriCircularProgressView: View {
    var fraction: Double
    
    var circleColor: Color
    
    var completedFractionColor: Color

    var circleStyle: StrokeStyle
    
    var lineWidth: CGFloat
    
    public var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .foregroundColor(circleColor)
            Circle()
                .trim(from: 0.0, to: CGFloat(fraction))
                .stroke(style: circleStyle)
                .rotationEffect(Angle(degrees: 270))
                .foregroundColor(completedFractionColor)
        }
    }
}

struct KPIProgressViewStyleKey: EnvironmentKey {
    public static let defaultValue = AnyKPIProgressViewStyle(FioriCircularProgressViewStyle())
}

public extension EnvironmentValues {
    /// Progress view style.
    var kpiProgressViewStyle: AnyKPIProgressViewStyle {
        get { self[KPIProgressViewStyleKey.self] }
        set { self[KPIProgressViewStyleKey.self] = newValue }
    }
}

public extension View {
    /// Sets the style for the progress view.
    func kpiProgressViewStyle<S>(_ style: S) -> some View where S: KPIProgressViewStyle {
        self.environment(\.kpiProgressViewStyle, AnyKPIProgressViewStyle(style))
    }
}

@available(iOS 14.0, *)
struct KPIProgressItemLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(KPIProgressItem(data: .percent(0.88), subtitle: "Completed"),
                    category: .control)
    }
}
