import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.

 1. Uncomment the following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

public enum DisplayState: Equatable {
    /// Checkout state is processing.
    case inProgress
    /// Checkout state is completed.
    case completed
    /// Checkout state is failed.
    case failed
}

// Base Layout style
public struct CheckoutIndicatorBaseStyle: CheckoutIndicatorStyle {
    @State var rotationDegrees: Double = -90
    @State var symbolRevealAmount: Double = 0
    @State var color = Color.preferredColor(.tintColor)
    
    @ViewBuilder
    public func makeBody(_ configuration: CheckoutIndicatorConfiguration) -> some View {
        GeometryReader { reader in
            ZStack {
                Circle()
                    .trim(from: 0, to: configuration.displayState == .inProgress ? 0.9 : 1)
                    .stroke(
                        self.color,
                        style: StrokeStyle(
                            lineWidth: 2
                        )
                    )
                    .id(configuration.displayState)
                    .rotationEffect(.degrees(self.rotationDegrees))
                    .onAppear {
                        DispatchQueue.main.async {
                            self.performAnimation(state: configuration.displayState)
                        }
                    }
                    .setOnChange(of: configuration.displayState, action1: { newValue in
                        self.performAnimation(state: newValue)
                    }) { _, newValue in
                        self.performAnimation(state: newValue)
                    }
                if configuration.displayState != .inProgress {
                    (configuration.displayState == .completed
                        ? self.drawCheckmark(size: reader.size, lineWidth: 3)
                        : self.drawExclamationPoint(size: reader.size, lineWidth: 3))
                        .trim(from: 0, to: self.symbolRevealAmount)
                        .stroke(
                            self.color,
                            style: StrokeStyle(
                                lineWidth: 3
                            )
                        )
                }
            }
        }
    }
    
    func performAnimation(state: DisplayState) {
        let inProgressAnimation = Animation.linear(duration: 1.3).repeatForever(autoreverses: false)
        switch state {
        case .inProgress:
            self.rotationDegrees = -90
            withAnimation(Animation.linear(duration: 0.3)) {
                self.color = Color.preferredColor(.tintColor)
            }
            withAnimation(inProgressAnimation) {
                self.rotationDegrees = 270
            }
        case .completed:
            self.symbolRevealAmount = 0
            withAnimation(Animation.linear(duration: 0.3)) {
                self.color = Color.preferredColor(.tintColor)
                self.symbolRevealAmount = 1
            }
        case .failed:
            self.symbolRevealAmount = 0
            withAnimation(Animation.linear(duration: 0.3)) {
                self.color = Color.preferredColor(.negativeLabel)
                self.symbolRevealAmount = 1
            }
        }
    }
    
    func drawCheckmark(size: CGSize, lineWidth: CGFloat) -> Path {
        var path = Path()
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let checkmarkSize = min(size.width, size.height) / 2
        let first = CGPoint(x: center.x - (0.5 * checkmarkSize), y: center.y + (0.023 * checkmarkSize))
        let second = CGPoint(x: center.x - (0.19 * checkmarkSize), y: center.y + (0.37 * checkmarkSize))
        let third = CGPoint(x: center.x + (0.5 * checkmarkSize), y: center.y - (0.345 * checkmarkSize))
        
        path.move(to: first)
        path.addLine(to: second)
        path.addLine(to: third)
        
        return path
    }

    func drawExclamationPoint(size: CGSize, lineWidth: CGFloat) -> Path {
        var path = Path()
        
        // Calculate the dot center and vertical line coordinates
        let centerX = size.width / 2
        let centerY = size.height * 0.73
        let topY = size.height * 0.2
        let bottomY = size.height * 0.65
        
        path.addArc(center: CGPoint(x: centerX, y: centerY),
                    radius: lineWidth / 2,
                    startAngle: Angle(radians: 0),
                    endAngle: Angle(radians: CGFloat(2.0 * Double.pi)),
                    clockwise: true)
        
        path.move(to: CGPoint(x: centerX, y: topY + (lineWidth / 2)))
        path.addLine(to: CGPoint(x: centerX, y: bottomY))
        
        return path
    }
}

// Default fiori styles
public struct CheckoutIndicatorFioriStyle: CheckoutIndicatorStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CheckoutIndicatorConfiguration) -> some View {
        CheckoutIndicator(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

// Default nss styles
public struct CheckoutIndicatorNSSStyle: CheckoutIndicatorStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: CheckoutIndicatorConfiguration) -> some View {
        CheckoutIndicator(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.checkoutIndicatorIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}
