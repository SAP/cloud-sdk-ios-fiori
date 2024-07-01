import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct RatingControlBaseStyle: RatingControlStyle {
    public func makeBody(_ configuration: RatingControlConfiguration) -> some View {
        HStack(spacing: configuration.ratingControlConfig.getItemSpacing()) {
            ForEach(configuration.ratingControlConfig.ratingItems(configuration.rating)) { ratingItem in
                if ratingItem.isOn {
                    configuration.ratingControlConfig.getOnImageView()
                } else {
                    configuration.ratingControlConfig.getOffImageView()
                }
//                configuration.ratingControlConfig.getImageView(ratingItem.isOn)
            }
//            ForEach(configuration.ratingControlConfig.ratingImages(configuration.rating)) { ratingImage in
//                ratingImage.image
//                    .font(ratingImage.imageConfig.font)
//                    .fontWeight(ratingImage.imageConfig.weight)
//                    .imageScale(ratingImage.imageConfig.scale)
//                    .foregroundColor(ratingImage.imageConfig.color)
//                    .frame(width: configuration.ratingControlConfig.getItemSize().width, height: configuration.ratingControlConfig.getItemSize().height)
//            }
        }
        .onTapGesture { location in
            if configuration.ratingControlConfig.style == .editable {
                self.setRatingValue(configuration, location: location)
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0.5)
                .onChanged { value in
                    if configuration.ratingControlConfig.style == .editable {
                        self.setRatingValue(configuration, location: value.location)
                    }
                }
        )
    }

    func setRatingValue(_ configuration: RatingControlConfiguration, location: CGPoint) {
        let newValue = configuration.ratingControlConfig.getRatingValue(location)
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
