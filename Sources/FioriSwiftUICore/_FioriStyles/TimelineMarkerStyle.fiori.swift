import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelineMarkerBaseStyle: TimelineMarkerStyle {
    @State var timelineMarkerWidth: CGFloat = 100

    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        ZStack {
            HStack {
                Spacer()
                Rectangle()
                    .foregroundColor(configuration.isPresent ? Color.preferredColor(.blue1) : Color.preferredColor(.secondaryGroupedBackground))
                    .frame(alignment: .trailing)
                    .frame(width: self.timelineMarkerWidth - 92.5)
            }
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .trailing) {
                    HStack {
                        Spacer()
                        configuration.timestamp
                    }
                    HStack {
                        Spacer()
                        configuration.secondaryTimestamp
                    }
                }
                .frame(width: 60)
                .background(configuration.isPresent ? Color.preferredColor(.secondaryGroupedBackground) : Color.clear)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
                .alignmentGuide(.top) { _ in
                    16
                }
                VStack(alignment: .center, spacing: 0) {
                    Rectangle()
                        .frame(width: 2, height: 16)
                        .foregroundColor(configuration.isPast || configuration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.grey3))
                        .opacity(configuration.showUpperVerticalLine ? 1 : 0)
                    if configuration.icon.isEmpty {
                        configuration.timelineNode
                    } else {
                        configuration.icon
                    }
                    Rectangle()
                        .frame(width: 2)
                        .foregroundColor(configuration.isPast || configuration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.grey3))
                        .opacity(configuration.showLowerVerticalLine ? 1 : 0)
                }
                .frame(width: 15)
                .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: 8))
                .alignmentGuide(.top) { _ in
                    16
                }
                VStack(alignment: .leading) {
                    HStack {
                        configuration.title
                        Spacer()
                    }
                    Divider()
                        .foregroundColor(Color.preferredColor(.separator).opacity(0.41))
                        .frame(height: 0.33)
                        .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: -16))
                        .offset(y: 16)
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 16))
                .alignmentGuide(.top) { _ in
                    16
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .overlay {
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: TimelineMarkerWidthKey.self, value: proxy.size.width)
                }
            }
        }
        .onPreferenceChange(TimelineMarkerWidthKey.self) { value in
            DispatchQueue.main.async {
                self.timelineMarkerWidth = value
            }
        }
    }
}

struct TimelineMarkerWidthKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// Default fiori styles
extension TimelineMarkerFioriStyle {
    struct ContentFioriStyle: TimelineMarkerStyle {
        func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
            TimelineMarker(configuration)
                .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
        }
    }

    struct TimestampFioriStyle: TimestampStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration

        func makeBody(_ configuration: TimestampConfiguration) -> some View {
            Timestamp(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundColor(Color.preferredColor(.primaryLabel))
        }
    }

    struct SecondaryTimestampFioriStyle: SecondaryTimestampStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration

        func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
            SecondaryTimestamp(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundColor(Color.preferredColor(.primaryLabel))
        }
    }

    struct TimelineNodeFioriStyle: TimelineNodeStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration

        func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
            TimelineNode(configuration)
                .foregroundColor(self.timelineMarkerConfiguration.isPast || self.timelineMarkerConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.separatorOpaque))
                .font(.system(size: 9, weight: .bold))
        }
    }

    struct IconFioriStyle: IconStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
    
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundColor(self.timelineMarkerConfiguration.isPast || self.timelineMarkerConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.separatorOpaque))
                .font(.system(size: 9, weight: .bold))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(Color.preferredColor(.primaryLabel))
        }
    }
}

// Default nss styles
extension TimelineMarkerNSSStyle {
    struct ContentNSSStyle: TimelineMarkerStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
            TimelineMarker(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TimestampNSSStyle: TimestampStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TimestampConfiguration) -> some View {
            Timestamp(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Timestamp
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct SecondaryTimestampNSSStyle: SecondaryTimestampStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
            SecondaryTimestamp(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for SecondaryTimestamp
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TimelineNodeNSSStyle: TimelineNodeStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
            TimelineNode(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for TimelineNode
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct IconNSSStyle: IconStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Icon
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TitleNSSStyle: TitleStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Title
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}
