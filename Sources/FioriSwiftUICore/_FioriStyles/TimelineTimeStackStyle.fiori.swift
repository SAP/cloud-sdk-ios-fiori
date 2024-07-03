import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelineTimeStackBaseStyle: TimelineTimeStackStyle {
    public func makeBody(_ configuration: TimelineTimeStackConfiguration) -> some View {
        VStack(alignment: .trailing) {
            HStack {
                Spacer()
                configuration.timestampLabel
            }
            if !configuration.secondaryTimestampLabel.isEmpty || !configuration.secondaryTimestampImage.isEmpty {
                HStack {
                    Spacer()
                    if !configuration.secondaryTimestampLabel.isEmpty {
                        configuration.secondaryTimestampLabel
                    } else {
                        configuration.secondaryTimestampImage
                    }
                }
            }
        }
    }
}

// Default fiori styles
extension TimelineTimeStackFioriStyle {
    struct ContentFioriStyle: TimelineTimeStackStyle {
        func makeBody(_ configuration: TimelineTimeStackConfiguration) -> some View {
            TimelineTimeStack(configuration)
        }
    }

    struct TimestampLabelFioriStyle: TimestampLabelStyle {
        let timelineTimeStackConfiguration: TimelineTimeStackConfiguration

        func makeBody(_ configuration: TimestampLabelConfiguration) -> some View {
            TimestampLabel(configuration)
        }
    }

    struct SecondaryTimestampLabelFioriStyle: SecondaryTimestampLabelStyle {
        let timelineTimeStackConfiguration: TimelineTimeStackConfiguration

        func makeBody(_ configuration: SecondaryTimestampLabelConfiguration) -> some View {
            SecondaryTimestampLabel(configuration)
        }
    }

    struct SecondaryTimestampImageFioriStyle: SecondaryTimestampImageStyle {
        let timelineTimeStackConfiguration: TimelineTimeStackConfiguration

        func makeBody(_ configuration: SecondaryTimestampImageConfiguration) -> some View {
            SecondaryTimestampImage(configuration)
        }
    }
}
