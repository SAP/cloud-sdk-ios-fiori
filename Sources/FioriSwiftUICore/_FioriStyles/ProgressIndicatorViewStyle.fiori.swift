import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public enum ProgressViewState {
    /// Progress state processing. Shows spinning circular activity indicator.
    case processing
        
    /// Progress state is loading. Shows the progress gauge with a pause icon.
    case loadingPausable
        
    /// Progress state is loading. Shows the progress gauge with stop icon.
    case loadingStoppable
        
    /// Progress state is paused. Shows the progress gauge with a resume icon.
    case paused
}

// Base Layout style
public struct ProgressIndicatorViewBaseStyle: ProgressIndicatorViewStyle {
    @State var rotationDegrees: Double = -90
    @State var drawProgress: Bool = true
    @State var previousProgress: Double = 0.0
    
    public func makeBody(_ configuration: ProgressIndicatorViewConfiguration) -> some View {
        ZStack {
            Circle()
                .stroke(
                    configuration.progressState == .processing ? Color.clear : Color.preferredColor(.secondaryFill),
                    lineWidth: 2
                )
            Circle()
                .trim(from: 0, to: configuration.progressState == .processing ? 0.9 : self.drawProgress ? self.previousProgress : configuration.indicatorProgress)
                .stroke(
                    Color.preferredColor(.tintColor),
                    style: StrokeStyle(
                        lineWidth: 2
                    )
                )
                .id(configuration.progressState)
                .rotationEffect(.degrees(self.rotationDegrees))
                .onAppear {
                    self.performAnimation(configuration)
                }
                .onChange(of: configuration.indicatorProgress) { [oldValue = configuration.indicatorProgress] _ in
                    self.previousProgress = oldValue
                    self.performAnimation(configuration)
                }
                .onChange(of: configuration.progressState) { [oldValue = configuration.progressState] _ in
                    self.performAnimation(configuration, previousState: oldValue)
                }
            FioriButton(label: { _ in
                self.getIndicatorIcon(configuration)
            })
        }
        .contentShape(Rectangle())
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(self.getAccessibilityLabel(configuration))
    }
    
    func performAnimation(_ configuration: ProgressIndicatorViewConfiguration, previousState: ProgressViewState = .processing) {
        let processingAnimation = Animation.linear(duration: 1.3).repeatForever(autoreverses: false)
        let progressAnimation = Animation.easeInOut(duration: 1.3)
        DispatchQueue.main.async {
            if configuration.progressState == .processing {
                self.rotationDegrees = -90
                withAnimation(processingAnimation) {
                    self.rotationDegrees = 270.0
                }
            } else {
                if configuration.progressState != .paused, previousState != .paused {
                    self.drawProgress = true
                    withAnimation(progressAnimation) {
                        self.drawProgress.toggle()
                    }
                } else {
                    // Don't animate to or from paused state
                    self.drawProgress = false
                }
            }
        }
    }
    
    func getIndicatorIcon(_ configuration: ProgressIndicatorViewConfiguration) -> Image? {
        if configuration.progressState == .loadingPausable {
            return Image(systemName: "pause.fill")
        } else if configuration.progressState == .loadingStoppable {
            return Image(systemName: "stop.fill")
        } else if configuration.progressState == .paused {
            return Image(systemName: "arrow.down")
        }
        return nil
    }
    
    func getAccessibilityLabel(_ configuration: ProgressIndicatorViewConfiguration) -> String {
        let format: String
        switch configuration.progressState {
        case .processing:
            return NSLocalizedString("Processing", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        case .loadingPausable:
            format = NSLocalizedString("In progress with option to pause, %.0f", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        case .loadingStoppable:
            format = NSLocalizedString("In progress with option to stop, %.0f", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        case .paused:
            format = NSLocalizedString("Progress halted, %.0f", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        }
        return "\(String(format: format, Double(configuration.indicatorProgress * 100)))%"
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

        struct IndicatorIconStyle: FioriButtonStyle {
            func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
                configuration.label
                    .foregroundColor(Color.preferredColor(.tintColor))
            }
        }
    }

    struct LinearProgressIndicatorFioriStyle: LinearProgressIndicatorStyle {
        let progressIndicatorViewConfiguration: ProgressIndicatorViewConfiguration

        func makeBody(_ configuration: LinearProgressIndicatorConfiguration) -> some View {
            LinearProgressIndicator(configuration)
        }
    }
}
