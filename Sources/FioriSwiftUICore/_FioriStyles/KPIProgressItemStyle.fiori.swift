import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct KPIProgressItemBaseStyle: KPIProgressItemStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    @State var isPressed: Bool = false
    public func makeBody(_ configuration: KPIProgressItemConfiguration) -> some View {
        VStack(alignment: .center, spacing: 2) {
            ZStack {
                StylableCircularProgressView(configuration: configuration, completedFractionColor: getFractionColor(for: getConfigState(isEnabled: self.isEnabled, isPressed: self.isPressed)))
                if configuration.kPIContent.isEmpty {
                    VStack(alignment: .center, spacing: 2) {
                        StylableKPIView(data: configuration.data, isEnabled: self.isEnabled, isPressed: self.isPressed)
                        configuration.kpiCaption
                    }
                    .scaleEffect(CGSize(width: self.getFrameWidth(configuration: configuration) / 130, height: self.getFrameHeight(configuration: configuration) / 130))
                } else {
                    configuration.kPIContent
                }
            }
            configuration.footnote
        }
        .environment(\.isPressed, self.isPressed)
        .frame(width: self.getFrameWidth(configuration: configuration))
        .contentShape(.rect)
        .gesture(self.createGesture())
    }
    
    private func getFrameWidth(configuration: KPIProgressItemConfiguration) -> CGFloat {
        configuration.chartSize == .large ? 130 : 104
    }
    
    private func getFrameHeight(configuration: KPIProgressItemConfiguration) -> CGFloat {
        configuration.chartSize == .large ? 130 : 104
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

struct IsPressedEnvironmentKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var isPressed: Bool {
        get { self[IsPressedEnvironmentKey.self] }
        set { self[IsPressedEnvironmentKey.self] = newValue }
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

func getFractionColor(for state: ControlState) -> Color {
    let fractionColors: [ControlState: Color] = [.normal: .preferredColor(.tintColor),
                                                 .highlighted: .preferredColor(.tintColorTapState)]
    
    return fractionColors[state] ?? .preferredColor(.tintColor)
}

struct StylableKPIView: View {
    let data: KPIItemData
    let isEnabled: Bool
    let isPressed: Bool
    
    public var body: some View {
        KPIProgressFormatter().create(from: self.data)
            .lineLimit(1)
            .minimumScaleFactor(0.3)
            .truncationMode(.tail)
            .multilineTextAlignment(.center)
            .foregroundStyle(getForegroundColor(for: getConfigState(isEnabled: self.isEnabled, isPressed: self.isPressed)))
    }
}

struct StylableCircularProgressView: View {
    let configuration: KPIProgressItemConfiguration
    let circleColor: Color = .preferredColor(.primaryFill)
    let completedFractionColor: Color

    @State private var drawingStroke = false
    var animation: Animation {
        Animation.linear(duration: 0.5)
    }
    
    public var body: some View {
        ZStack {
            self.configuration.outerCircle
                .foregroundStyle(Color.clear)
                .overlay {
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(self.circleColor)
                }
            self.configuration.innerCircle
                .foregroundStyle(Color.clear)
                .overlay {
                    Circle()
                        .trim(from: 0.0, to: self.drawingStroke ? CGFloat(min(self.configuration.data.fraction(), 1.0)) : 0)
                        .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                        .rotationEffect(Angle(degrees: 270))
                        .foregroundColor(self.completedFractionColor)
                        .onAppear {
                            withAnimation(self.animation) {
                                self.drawingStroke = true
                            }
                        }
                }
        }
    }
}

// Default fiori styles
extension KPIProgressItemFioriStyle {
    struct ContentFioriStyle: KPIProgressItemStyle {
        func makeBody(_ configuration: KPIProgressItemConfiguration) -> some View {
            KPIProgressItem(configuration)
        }
    }

    struct KPIContentFioriStyle: KPIContentStyle {
        let kPIProgressItemConfiguration: KPIProgressItemConfiguration

        func makeBody(_ configuration: KPIContentConfiguration) -> some View {
            KPIContent(configuration)
        }
    }

    struct KpiCaptionFioriStyle: KpiCaptionStyle {
        let kPIProgressItemConfiguration: KPIProgressItemConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool
        @Environment(\.isPressed) var isPressed: Bool

        func makeBody(_ configuration: KpiCaptionConfiguration) -> some View {
            KpiCaption(configuration)
                .foregroundStyle(getForegroundColor(for: getConfigState(isEnabled: self.isEnabled, isPressed: self.isPressed)))
                .font(.subheadline)
                .truncationMode(.tail)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .frame(maxWidth: self.kPIProgressItemConfiguration.chartSize == .large ? 130 : 104)
        }
    }
    
    struct FootnoteFioriStyle: FootnoteStyle {
        let kPIProgressItemConfiguration: KPIProgressItemConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool
        @Environment(\.isPressed) var isPressed: Bool
    
        func makeBody(_ configuration: FootnoteConfiguration) -> some View {
            Footnote(configuration)
                .foregroundStyle(getForegroundColor(for: getConfigState(isEnabled: self.isEnabled, isPressed: self.isPressed)))
                .font(.subheadline)
                .truncationMode(.tail)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(maxWidth: self.kPIProgressItemConfiguration.chartSize == .large ? 130 : 104)
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
        }
    }
    
    struct InnerCircleFioriStyle: InnerCircleStyle {
        let kPIProgressItemConfiguration: KPIProgressItemConfiguration
    
        func makeBody(_ configuration: InnerCircleConfiguration) -> some View {
            InnerCircle(configuration)
        }
    }
    
    struct OuterCircleFioriStyle: OuterCircleStyle {
        let kPIProgressItemConfiguration: KPIProgressItemConfiguration
    
        func makeBody(_ configuration: OuterCircleConfiguration) -> some View {
            OuterCircle(configuration)
        }
    }
}

// Default nss styles
extension KPIProgressItemNSSStyle {
    struct ContentNSSStyle: KPIProgressItemStyle {
        let kPIProgressItemConfiguration: KPIProgressItemConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: KPIProgressItemConfiguration) -> some View {
            KPIProgressItem(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct KPIContentNSSStyle: KPIContentStyle {
        let kPIProgressItemConfiguration: KPIProgressItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: KPIContentConfiguration) -> some View {
            KPIContent(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for KPIContent
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct KpiCaptionNSSStyle: KpiCaptionStyle {
        let kPIProgressItemConfiguration: KPIProgressItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: KpiCaptionConfiguration) -> some View {
            KpiCaption(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for KpiCaption
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct FootnoteNSSStyle: FootnoteStyle {
        let kPIProgressItemConfiguration: KPIProgressItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: FootnoteConfiguration) -> some View {
            Footnote(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Footnote
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct InnerCircleNSSStyle: InnerCircleStyle {
        let kPIProgressItemConfiguration: KPIProgressItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: InnerCircleConfiguration) -> some View {
            InnerCircle(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for InnerCircle
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct OuterCircleNSSStyle: OuterCircleStyle {
        let kPIProgressItemConfiguration: KPIProgressItemConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: OuterCircleConfiguration) -> some View {
            OuterCircle(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for OuterCircle
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}

/// Enum to determine whether to display the large or small progress circle around the KPIContent. Default: `KPIProgressItemSize.large`
public enum KPIProgressItemSize {
    /// Smaller circle. 104px diameter
    case small
    /// Larger circle. 130px diameter
    case large
}
