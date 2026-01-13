import FioriThemeManager
import Foundation
import SwiftUI

enum LinearProgressViewType {
    case determinate
    case indeterminate
    case success
    case error
}

// Base Layout style
public struct LinearProgressIndicatorBaseStyle: LinearProgressIndicatorStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
        ProgressView(value: configuration.indicatorProgress, total: 1.0)
            .accessibilityLabel(Text("Processing"))
            .accessibilityValue(Text("\(Int((configuration.indicatorProgress * 100.0).rounded()))%"))
//            .accessibilityElement(children: .ignore)
    }
}

// Default fiori style
public struct LinearProgressIndicatorFioriStyle: LinearProgressIndicatorStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
        LinearProgressIndicator(configuration)
    }
}

/// Determinate style
public struct LinearProgressIndicatorDeterminateStyle: LinearProgressIndicatorStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
        LinearProgressIndicator(configuration)
            .progressViewStyle(CustomLinearProgressViewStyle(color: .preferredColor(.tintColor), type: .determinate))
            .accessibilityValue(Text("\(Int((configuration.indicatorProgress * 100.0).rounded()))%"))
//            .accessibilityElement(children: .ignore)
    }
}

/// Indeterminate style
public struct LinearProgressIndicatorIndeterminateStyle: LinearProgressIndicatorStyle {
    @State var progress = 0.0
    public func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
        ProgressView()
            .progressViewStyle(CustomLinearProgressViewStyle(color: .preferredColor(.tintColor), type: .indeterminate))
    }
}

/// Error style
public struct LinearProgressIndicatorErrorStyle: LinearProgressIndicatorStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
        LinearProgressIndicator(configuration)
            .progressViewStyle(CustomLinearProgressViewStyle(color: .preferredColor(.negativeLabel), type: .error))
            .accessibilityValue(Text("\(Int((configuration.indicatorProgress * 100.0).rounded()))%"))
    }
}

/// Success style
public struct LinearProgressIndicatorSuccessStyle: LinearProgressIndicatorStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
        LinearProgressIndicator(configuration)
            .progressViewStyle(CustomLinearProgressViewStyle(color: .preferredColor(.tintColor), type: .success))
            .accessibilityValue(Text("\(Int((configuration.indicatorProgress * 100.0).rounded()))%"))
    }
}

struct CustomLinearProgressViewStyle: ProgressViewStyle {
    @State var color: Color = .preferredColor(.tintColor)
    @ScaledMetric(relativeTo: .body) var height: CGFloat = 4.0
    @State var type: LinearProgressViewType = .determinate
    @State var phase: CGFloat = 0.0
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(width: geometry.size.width, height: self.height)
                        .opacity(0.85)
                        .foregroundColor(.preferredColor(.separator))
                    if self.type == .indeterminate {
                        let movingWidth = geometry.size.width * 0.25
                        Capsule()
                            .frame(width: movingWidth, height: self.height)
                            .foregroundColor(self.color)
                            .opacity(0.85)
                            .offset(x: (geometry.size.width - movingWidth) * self.phase)
                    } else {
                        Capsule()
                            .frame(width: (self.type == .error || self.type == .success) ? geometry.size.width : (geometry.size.width * CGFloat(configuration.fractionCompleted ?? 0)), height: self.height)
                            .foregroundColor(self.type == .error ? .preferredColor(.negativeLabel) : self.color)
                    }
                }
            }
            .onAppear {
                self.phase = -0.26
                withAnimation(.linear(duration: 1.4).repeatForever(autoreverses: true)) {
                    self.phase = 1.26
                }
            }
        }
        .frame(height: self.height)
    }
    
    func getWidth(completed: Double, type: LinearProgressViewType) -> Double {
        if type == .error || type == .success {
            return 0
        }
        if completed >= 0.5 {
            return completed - 0.5
        } else {
            return 0
        }
    }
}

/// Determinate style of the Linear Progress Indicator.
public extension LinearProgressIndicatorStyle where Self == LinearProgressIndicatorDeterminateStyle {
    static var determinate: LinearProgressIndicatorDeterminateStyle {
        LinearProgressIndicatorDeterminateStyle()
    }
}

/// Indeterminate style of the Linear Progress Indicator.
public extension LinearProgressIndicatorStyle where Self == LinearProgressIndicatorIndeterminateStyle {
    /// Indeterminate style of the Linear Progress Indicator.
    static var indeterminate: LinearProgressIndicatorIndeterminateStyle {
        LinearProgressIndicatorIndeterminateStyle()
    }
}

/// Error style of the Linear Progress Indicator.
public extension LinearProgressIndicatorStyle where Self == LinearProgressIndicatorErrorStyle {
    /// Error style of the Linear Progress Indicator.
    static var error: LinearProgressIndicatorErrorStyle {
        LinearProgressIndicatorErrorStyle()
    }
}

/// Success style of the Linear Progress Indicator.
public extension LinearProgressIndicatorStyle where Self == LinearProgressIndicatorSuccessStyle {
    /// Success style of the Linear Progress Indicator.
    static var success: LinearProgressIndicatorSuccessStyle {
        LinearProgressIndicatorSuccessStyle()
    }
}
