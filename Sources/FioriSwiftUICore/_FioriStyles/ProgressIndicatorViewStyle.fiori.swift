import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// Base Layout style
public struct ProgressIndicatorViewBaseStyle: ProgressIndicatorViewStyle {
    @State var isProcessing: Bool = false
    @State var previousProgress: Double = 0.0
    @State var rotationDegrees: Double = -90
    @State var drawProgress: Bool = false

    public func makeBody(_ configuration: ProgressIndicatorViewConfiguration) -> some View {
        ZStack {
            Circle()
                .stroke(
                    self.isProcessing ? Color.clear : Color.preferredColor(.secondaryFill),
                    lineWidth: 2
                )
            Circle()
                .trim(from: 0, to: self.isProcessing ? 0.9 : self.drawProgress ? self.previousProgress : configuration.progress)
                .stroke(
                    Color.preferredColor(.tintColor),
                    style: StrokeStyle(
                        lineWidth: 2
                    )
                )
                .rotationEffect(.degrees(self.rotationDegrees))
                .onAppear {
                    self.performAnimation(configuration)
                }
                .onChange(of: configuration.progress) { [oldValue = configuration.progress] _ in
                    self.previousProgress = oldValue
                    self.performAnimation(configuration)
                }
        }
    }
    
    func performAnimation(_ configuration: ProgressIndicatorViewConfiguration) {
        DispatchQueue.main.async {
            if self.isProcessing {
                self.rotationDegrees = -90
                withAnimation(Animation.linear(duration: 1.3).repeatForever(autoreverses: false)) {
                    self.rotationDegrees = 270.0
                }
            } else {
                self.drawProgress = true
                withAnimation(Animation.easeInOut(duration: 1.3)) {
                    self.drawProgress.toggle()
                }
            }
        }
    }
}

// Default fiori styles
extension ProgressIndicatorViewFioriStyle {
    struct ContentFioriStyle: ProgressIndicatorViewStyle {
        func makeBody(_ configuration: ProgressIndicatorViewConfiguration) -> some View {
            ProgressIndicatorView(configuration)
                .fioriButtonStyle(IndicatorIconStyle())
                .frame(width: 26, height: 26)
        }
    }

    struct IndicatorIconStyle: FioriButtonStyle {
        func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
            configuration.label
                .foregroundColor(Color.preferredColor(.tintColor))
        }
    }
    
    struct ProgressIndicatorProtocolFioriStyle: ProgressIndicatorProtocolStyle {
        let progressIndicatorViewConfiguration: ProgressIndicatorViewConfiguration
    
        func makeBody(_ configuration: ProgressIndicatorProtocolConfiguration) -> some View {
            ProgressIndicatorProtocol(configuration)
        }
    }
}

public struct ProgressIndicatorViewProcessingStyle: ProgressIndicatorViewStyle {
    public func makeBody(_ configuration: ProgressIndicatorViewConfiguration) -> some View {
        ZStack {
            ProgressIndicatorView(configuration)
                .progressIndicatorViewStyle(ProgressIndicatorViewBaseStyle(isProcessing: true))
                .contentShape(Rectangle())
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(NSLocalizedString("Processing", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""))
        }
    }
}

public extension ProgressIndicatorViewStyle where Self == ProgressIndicatorViewProcessingStyle {
    static var processing: ProgressIndicatorViewProcessingStyle {
        ProgressIndicatorViewProcessingStyle()
    }
}

public struct ProgressIndicatorViewPausableStyle: ProgressIndicatorViewStyle {
    @Binding var isPaused: Bool
    public init(isPaused: Binding<Bool>) {
        self._isPaused = isPaused
    }
    
    public func makeBody(_ configuration: ProgressIndicatorViewConfiguration) -> some View {
        let format = self.isPaused ? NSLocalizedString("Progress halted, %.0f", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "") : NSLocalizedString("In progress with option to pause, %.0f", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        
        return ZStack {
            ProgressIndicatorView(configuration)
                .progressIndicatorViewStyle(ProgressIndicatorViewBaseStyle(isProcessing: false))
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

public struct ProgressIndicatorViewStoppableStyle: ProgressIndicatorViewStyle {
    public func makeBody(_ configuration: ProgressIndicatorViewConfiguration) -> some View {
        ZStack {
            ProgressIndicatorView(configuration)
                .progressIndicatorViewStyle(ProgressIndicatorViewBaseStyle(isProcessing: false))
            FioriButton(label: { _ in
                Image(systemName: "stop.fill")
            })
            .contentShape(Rectangle())
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("\(String(format: NSLocalizedString("In progress with option to stop, %.0f", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), Double(configuration.progress * 100)))%")
        }
    }
}

public extension ProgressIndicatorViewStyle where Self == ProgressIndicatorViewStoppableStyle {
    static var stoppable: ProgressIndicatorViewStoppableStyle {
        ProgressIndicatorViewStoppableStyle()
    }
}
