import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct RatingControlBaseStyle: RatingControlStyle {
    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        HStack(spacing: configuration.getItemSpacing()) {
            ForEach(configuration.ratingItems(configuration.rating)) { ratingItem in
                if ratingItem.isOn {
                    configuration.getOnImageView()
                } else {
                    configuration.getOffImageView()
                }
            }
        }
        .onTapGesture { location in
            if configuration.ratingControlStyle == .editable {
                self.setRatingValue(configuration, location: location)
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0.5)
                .onChanged { value in
                    if configuration.ratingControlStyle == .editable {
                        self.setRatingValue(configuration, location: value.location)
                    }
                }
        )
    }

    func setRatingValue(_ configuration: RatingControlConfiguration, location: CGPoint) {
        let newValue = configuration.getRatingValue(location)
        if configuration.rating != newValue {
            configuration.rating = newValue
        }
    }
}

// Default fiori styles
extension RatingControlFioriStyle {
    struct ContentFioriStyle: RatingControlStyle {
        func makeBody(_ configuration: RatingControlConfiguration) -> some View {
            RatingControl(configuration)
            // Add default style for its content
            // .background()
        }
    }
}
