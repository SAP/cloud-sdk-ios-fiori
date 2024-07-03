import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelineMainStackBaseStyle: TimelineMainStackStyle {
    public func makeBody(_ configuration: TimelineMainStackConfiguration) -> some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    configuration.title
                    configuration.subtitle
                }
                Spacer()
                VStack(alignment: .trailing) {
                    configuration.status
                    configuration.substatus
                }
            }
            HStack(alignment: .top) {
                configuration.attribute
                Spacer()
                configuration.subAttribute
            }
            Divider()
                .foregroundColor(Color.preferredColor(.separator).opacity(0.41))
                .frame(height: 0.33)
                .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: -16))
                .offset(y: 16)
        }
    }
}

// Default fiori styles
extension TimelineMainStackFioriStyle {
    struct ContentFioriStyle: TimelineMainStackStyle {
        func makeBody(_ configuration: TimelineMainStackConfiguration) -> some View {
            TimelineMainStack(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let timelineMainStackConfiguration: TimelineMainStackConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        let timelineMainStackConfiguration: TimelineMainStackConfiguration

        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
        }
    }

    struct AttributeFioriStyle: AttributeStyle {
        let timelineMainStackConfiguration: TimelineMainStackConfiguration

        func makeBody(_ configuration: AttributeConfiguration) -> some View {
            Attribute(configuration)
        }
    }

    struct StatusFioriStyle: StatusStyle {
        let timelineMainStackConfiguration: TimelineMainStackConfiguration

        func makeBody(_ configuration: StatusConfiguration) -> some View {
            Status(configuration)
        }
    }

    struct SubstatusFioriStyle: SubstatusStyle {
        let timelineMainStackConfiguration: TimelineMainStackConfiguration

        func makeBody(_ configuration: SubstatusConfiguration) -> some View {
            Substatus(configuration)
        }
    }

    struct SubAttributeFioriStyle: SubAttributeStyle {
        let timelineMainStackConfiguration: TimelineMainStackConfiguration

        func makeBody(_ configuration: SubAttributeConfiguration) -> some View {
            SubAttribute(configuration)
        }
    }
}
