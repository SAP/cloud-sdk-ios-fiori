import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// MARK: - Fiori Circular ProgressViewStyle

/// A Fiori-styled circular progress view style that renders progress as a circular arc.
///
/// - Parameters:
/// - tintColor: Color of the progress arc. Defaults to .preferredColor(.tintColor).
/// - trackColor: Color of the background track (determinate mode only). Defaults to .preferredColor(.secondaryFill).
/// - lineWidth: Stroke width in points. Defaults to 2.0.
///
/// - SeeAlso: ProgressIndicator, ProgressIndicatorStyle
public struct CircularProgressViewStyle: ProgressViewStyle {
    var tintColor: Color = .preferredColor(.tintColor)
    var trackColor: Color = .preferredColor(.secondaryFill)
    var lineWidth: CGFloat = 2.0
    
    public init(
        tintColor: Color = .preferredColor(.tintColor),
        trackColor: Color = .preferredColor(.secondaryFill),
        lineWidth: CGFloat = 2.0
    ) {
        self.tintColor = tintColor
        self.trackColor = trackColor
        self.lineWidth = lineWidth
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            // Background track (only shown for determinate progress)
            if configuration.fractionCompleted != nil {
                Circle()
                    .stroke(self.trackColor, lineWidth: self.lineWidth)
            }
            
            // Progress arc
            if let fractionCompleted = configuration.fractionCompleted {
                // Determinate progress
                Circle()
                    .trim(from: 0, to: CGFloat(fractionCompleted))
                    .stroke(
                        self.tintColor,
                        style: StrokeStyle(lineWidth: self.lineWidth, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 0.3), value: fractionCompleted)
            } else {
                // Indeterminate progress: rotating arc animation
                IndeterminateProgressArc(tintColor: self.tintColor, lineWidth: self.lineWidth)
            }
        }
    }
}

// Helper view for indeterminate progress animation
private struct IndeterminateProgressArc: View {
    let tintColor: Color
    let lineWidth: CGFloat
    @State private var rotationDegrees: Double = -90
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.9)
            .stroke(
                self.tintColor,
                style: StrokeStyle(lineWidth: self.lineWidth, lineCap: .round)
            )
            .rotationEffect(.degrees(self.rotationDegrees))
            .onAppear {
                self.performAnimation()
            }
    }
    
    private func performAnimation() {
        // Ensure animation starts correctly on main thread (matching original implementation)
        DispatchQueue.main.async {
            self.rotationDegrees = -90
            withAnimation(Animation.linear(duration: 1.3).repeatForever(autoreverses: false)) {
                self.rotationDegrees = 270.0
            }
        }
    }
}

// MARK: - Base Layout style

// Apple Native: Uses ProgressView for determinate and indeterminate progress
public struct ProgressIndicatorBaseStyle: ProgressIndicatorStyle {
    var isProcessing: Bool = false
    
    public init(isProcessing: Bool = false) {
        self.isProcessing = isProcessing
    }
    
    public func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
        Group {
            if self.isProcessing {
                // Indeterminate progress: Use native ProgressView (no parameters)
                ProgressView()
            } else {
                // Determinate progress: Use native ProgressView (with progress value)
                ProgressView(value: configuration.progress, total: 1.0)
            }
        }
    }
}

// Default fiori styles
extension ProgressIndicatorFioriStyle {
    struct ContentFioriStyle: ProgressIndicatorStyle {
        func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
            ProgressIndicator(configuration)
                .fioriButtonStyle(IndicatorIconStyle())
                .frame(width: 26, height: 26)
                .contentShape(.accessibility, .rect.scale(1.6))
        }
    }

    struct IndicatorIconStyle: FioriButtonStyle {
        func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
            configuration.label
                .foregroundColor(Color.preferredColor(.tintColor))
        }
    }

    struct ProgressIndicatorProtocolFioriStyle: ProgressIndicatorProtocolStyle {
        let progressIndicatorConfiguration: ProgressIndicatorConfiguration

        func makeBody(_ configuration: ProgressIndicatorProtocolConfiguration) -> some View {
            ProgressIndicatorProtocol(configuration)
        }
    }
}

// MARK: - Processing style

public struct ProgressIndicatorProcessingStyle: ProgressIndicatorStyle {
    public func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
        ZStack {
            ProgressIndicator(configuration)
                .progressIndicatorStyle(ProgressIndicatorBaseStyle(isProcessing: true))
                .progressViewStyle(CircularProgressViewStyle())
                .contentShape(Rectangle())
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(NSLocalizedString("Processing", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
        }
    }
}

/// Processing style displaying a circular indeterminate indicator
public extension ProgressIndicatorStyle where Self == ProgressIndicatorProcessingStyle {
    static var processing: ProgressIndicatorProcessingStyle {
        ProgressIndicatorProcessingStyle()
    }
}

// MARK: - Pausable style

public struct ProgressIndicatorPausableStyle: ProgressIndicatorStyle {
    @Binding var isPaused: Bool
    public init(isPaused: Binding<Bool>) {
        self._isPaused = isPaused
    }
    
    public func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
        let format = self.isPaused ? NSLocalizedString("Progress halted, %.0f", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "") : NSLocalizedString("In progress with option to pause, %.0f", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        
        return ZStack {
            ProgressIndicator(configuration)
                .progressIndicatorStyle(ProgressIndicatorBaseStyle(isProcessing: false))
                .progressViewStyle(CircularProgressViewStyle())
            FioriButton(label: { _ in
                if self.isPaused {
                    Image(systemName: "arrow.down")
                } else {
                    Image(systemName: "pause.fill")
                }
            })
            .contentShape(Rectangle())
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("\(String(format: format, Double(configuration.progress * 100)))%")
        }
    }
}

// MARK: - Stoppable style

public struct ProgressIndicatorStoppableStyle: ProgressIndicatorStyle {
    public func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
        ZStack {
            ProgressIndicator(configuration)
                .progressIndicatorStyle(ProgressIndicatorBaseStyle(isProcessing: false))
                .progressViewStyle(CircularProgressViewStyle())
            FioriButton(label: { _ in
                Image(systemName: "stop.fill")
            })
            .contentShape(Rectangle())
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("\(String(format: NSLocalizedString("In progress with option to stop, %.0f", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), Double(configuration.progress * 100)))%")
        }
    }
}

/// Loading stoppable style displaying the current progress and a stop icon
public extension ProgressIndicatorStyle where Self == ProgressIndicatorStoppableStyle {
    static var stoppable: ProgressIndicatorStoppableStyle {
        ProgressIndicatorStoppableStyle()
    }
}
