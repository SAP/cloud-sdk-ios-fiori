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
    }
}

// Default fiori styles
public struct LinearProgressIndicatorFioriStyle: LinearProgressIndicatorStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
        LinearProgressIndicator(configuration)
    }
}

/// Determinate styles
public struct LinearProgressIndicatorDeterminateStyle: LinearProgressIndicatorStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
        LinearProgressIndicator(configuration)
            .progressViewStyle(CustomLinearProgressViewStyle(color: .preferredColor(.tintColor), type: .determinate))
    }
}

/// Indeterminate styles
public struct LinearProgressIndicatorIndeterminateStyle: LinearProgressIndicatorStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
        ProgressView(value: configuration.indicatorProgress, total: 1.0)
            .progressViewStyle(CustomLinearProgressViewStyle(color: .preferredColor(.tintColor), type: .indeterminate))
            .onAppear {
                let timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
                    configuration.indicatorProgress += 0.01
                    if configuration.indicatorProgress >= 1.0 {
                        configuration.indicatorProgress = 0.0
                    }
                }
                RunLoop.current.add(timer, forMode: .common)
            }
    }
}

/// Error styles
public struct LinearProgressIndicatorErrorStyle: LinearProgressIndicatorStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
        LinearProgressIndicator(configuration)
            .progressViewStyle(CustomLinearProgressViewStyle(color: .preferredColor(.negativeLabel), type: .error))
    }
}

/// Success styles
public struct LinearProgressIndicatorSuccessStyle: LinearProgressIndicatorStyle {
    public func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
        LinearProgressIndicator(configuration)
            .progressViewStyle(CustomLinearProgressViewStyle(color: .preferredColor(.tintColor), type: .success))
    }
}

struct CustomLinearProgressViewStyle: ProgressViewStyle {
    @State var color: Color = .preferredColor(.tintColor)
    @State var height: CGFloat = 4.0
    @State var type: LinearProgressViewType = .determinate
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.label
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(width: geometry.size.width, height: self.height)
                        .opacity(0.85)
                        .foregroundColor(.preferredColor(.separator))
                    Capsule()
                        .frame(width: (self.type == .error || self.type == .success) ? geometry.size.width : (geometry.size.width * CGFloat(configuration.fractionCompleted ?? 0)), height: self.height)
                        .foregroundColor(self.type == .error ? .preferredColor(.negativeLabel) : self.color)
                    
                    Capsule()
                        .frame(width: geometry.size.width * self.getWidth(completed: CGFloat(configuration.fractionCompleted ?? 0), type: self.type), height: self.height)
                        .foregroundColor(.preferredColor(.secondaryBackground))
                        .opacity(self.type == .indeterminate ? 1 : 0)
                    
                    Capsule()
                        .frame(width: geometry.size.width * self.getWidth(completed: CGFloat(configuration.fractionCompleted ?? 0), type: self.type), height: self.height)
                        .opacity(self.type == .indeterminate ? 0.85 : 0)
                        .foregroundColor(.preferredColor(.separator))
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
public extension LinearProgressIndicatorStyle where Self == LinearProgressIndicatorDeterminateStyle {
    static var indeterminate: LinearProgressIndicatorIndeterminateStyle {
        LinearProgressIndicatorIndeterminateStyle()
    }
}

/// Error style of the Linear Progress Indicator.
public extension LinearProgressIndicatorStyle where Self == LinearProgressIndicatorErrorStyle {
    static var error: LinearProgressIndicatorErrorStyle {
        LinearProgressIndicatorErrorStyle()
    }
}

/// Success style of the Linear Progress Indicator.
public extension LinearProgressIndicatorStyle where Self == LinearProgressIndicatorSuccessStyle {
    static var success: LinearProgressIndicatorSuccessStyle {
        LinearProgressIndicatorSuccessStyle()
    }
}
