import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// Base Layout style
public struct ProgressIndicatorBaseStyle: ProgressIndicatorStyle {
    @State var isProcessing: Bool = false
    @State var drawProgress: Bool = false
    @State var previousProgress: Double = 0.0
    @State var rotationDegrees: Double = -90
    public func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
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
                .onProgressChange(configuration, progressIndicatorBaseStyle: self)
        }
    }

    func performAnimation(_ configuration: ProgressIndicatorConfiguration) {
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

extension View {
    nonisolated func onProgressChange(_ configuration: ProgressIndicatorConfiguration, progressIndicatorBaseStyle: ProgressIndicatorBaseStyle) -> some View {
        if #available(iOS 17.0, *) {
            return self.onChange(of: configuration.progress) { oldValue, _ in
                progressIndicatorBaseStyle.previousProgress = oldValue
                progressIndicatorBaseStyle.performAnimation(configuration)
            }
        } else {
            return self.onChange(of: configuration.progress) { [oldValue = configuration.progress] _ in
                progressIndicatorBaseStyle.previousProgress = oldValue
                progressIndicatorBaseStyle.performAnimation(configuration)
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

// Default nss styles
extension ProgressIndicatorNSSStyle {
    struct ContentNSSStyle: ProgressIndicatorStyle {
        let progressIndicatorConfiguration: ProgressIndicatorConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
            ProgressIndicator(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct ProgressIndicatorProtocolNSSStyle: ProgressIndicatorProtocolStyle {
        let progressIndicatorConfiguration: ProgressIndicatorConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: ProgressIndicatorProtocolConfiguration) -> some View {
            ProgressIndicatorProtocol(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for ProgressIndicatorProtocol
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}

/// Processing style
public struct ProgressIndicatorProcessingStyle: ProgressIndicatorStyle {
    public func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
        ZStack {
            ProgressIndicator(configuration)
                .progressIndicatorStyle(ProgressIndicatorBaseStyle(isProcessing: true))
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

/// Loading pausable style displaying the current progress and an icon depending on the paused state
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

/// Loading stoppable style
public struct ProgressIndicatorStoppableStyle: ProgressIndicatorStyle {
    public func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
        ZStack {
            ProgressIndicator(configuration)
                .progressIndicatorStyle(ProgressIndicatorBaseStyle(isProcessing: false))
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
