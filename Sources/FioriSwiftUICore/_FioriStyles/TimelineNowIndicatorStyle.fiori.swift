import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelineNowIndicatorBaseStyle: TimelineNowIndicatorStyle {
    public func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
        HStack(alignment: .center, spacing: 0) {
            configuration.nowIndicatorNode
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.preferredColor(.tintColor))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

// Default fiori styles
extension TimelineNowIndicatorFioriStyle {
    struct ContentFioriStyle: TimelineNowIndicatorStyle {
        func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
            TimelineNowIndicator(configuration)
                .padding(EdgeInsets(top: 0, leading: 90, bottom: 0, trailing: 0))
        }
    }

    struct NowIndicatorNodeFioriStyle: NowIndicatorNodeStyle {
        let timelineNowIndicatorConfiguration: TimelineNowIndicatorConfiguration

        func makeBody(_ configuration: NowIndicatorNodeConfiguration) -> some View {
            NowIndicatorNode(configuration)
                .font(.system(size: 5))
                .foregroundColor(.preferredColor(.tintColor))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

// Default nss styles
extension TimelineNowIndicatorNSSStyle {
    struct ContentNSSStyle: TimelineNowIndicatorStyle {
        let timelineNowIndicatorConfiguration: TimelineNowIndicatorConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
            TimelineNowIndicator(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct NowIndicatorNodeNSSStyle: NowIndicatorNodeStyle {
        let timelineNowIndicatorConfiguration: TimelineNowIndicatorConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: NowIndicatorNodeConfiguration) -> some View {
            NowIndicatorNode(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for NowIndicatorNode
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}
