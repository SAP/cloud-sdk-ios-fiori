import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct LoadingIndicatorBaseStyle: LoadingIndicatorStyle {
    @Environment(\.indicatorPosition) var position
    @Environment(\.indicatorTint) var tint
    @Environment(\.indicatorControlSize) var controlSize
    @State private var isAnimating = false
    private var timerTool = TimerTask()

    public func makeBody(_ configuration: LoadingIndicatorConfiguration) -> some View {
        Group {
            if configuration.isPresented {
                self.layoutBody(configuration)
                    .transition(.scale)
                    .animation(.easeInOut, value: configuration.isPresented)
                    .onAppear {
                        if configuration.duration > 0 {
                            self.timerTool.start(interval: configuration.duration) {
                                withAnimation(.easeInOut) {
                                    configuration.isPresented = false
                                }
                            }
                        }
                    }
            }
        }
    }

    private func makeBodyForProgressView(_ configuration: LoadingIndicatorConfiguration) -> some View {
        configuration.progress
            .tint(self.tint)
            .controlSize(self.controlSize)
    }
    
    private func makeBodyForAIProgressView(_ configuration: LoadingIndicatorConfiguration) -> some View {
        Image(fioriName: "fiori.ai")
            .resizable()
            .scaledToFill()
            .scaleEffect(self.isAnimating ? 1.2 : 1.0)
            .opacity(self.isAnimating ? 0.8 : 1.0)
            .foregroundColor(self.tint)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    self.isAnimating.toggle()
                }
            }
            .frame(width: self.sizeForControl(self.controlSize), height: self.sizeForControl(self.controlSize))
    }
    
    private func sizeForControl(_ controlSize: ControlSize) -> CGFloat {
        switch controlSize {
        case .mini:
            return 12
        case .small:
            return 16
        case .regular:
            return 20
        case .large:
            return 30
        case .extraLarge:
            return 40
        @unknown default:
            return 20
        }
    }

    private func layoutBody(_ configuration: LoadingIndicatorConfiguration) -> some View {
        switch self.position {
        case .leading:
            return AnyView(HStack(spacing: 8) {
                if configuration.isAIEnabled {
                    self.makeBodyForAIProgressView(configuration)
                } else {
                    self.makeBodyForProgressView(configuration)
                }
                configuration.title
            })
        case .trailing:
            return AnyView(HStack(spacing: 8) {
                configuration.title
                if configuration.isAIEnabled {
                    self.makeBodyForAIProgressView(configuration)
                } else {
                    self.makeBodyForProgressView(configuration)
                }
            })
        case .bottom:
            return AnyView(VStack(spacing: 8) {
                configuration.title
                if configuration.isAIEnabled {
                    self.makeBodyForAIProgressView(configuration)
                } else {
                    self.makeBodyForProgressView(configuration)
                }
            })
        case .top:
            return AnyView(VStack(spacing: 8) {
                if configuration.isAIEnabled {
                    self.makeBodyForAIProgressView(configuration)
                } else {
                    self.makeBodyForProgressView(configuration)
                }
                configuration.title
            })
        }
    }
}

// Default fiori styles
extension LoadingIndicatorFioriStyle {
    struct ContentFioriStyle: LoadingIndicatorStyle {
        func makeBody(_ configuration: LoadingIndicatorConfiguration) -> some View {
            LoadingIndicator(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let loadingIndicatorConfiguration: LoadingIndicatorConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .headline))
        }
    }
    
    struct ProgressFioriStyle: ProgressStyle {
        let loadingIndicatorConfiguration: LoadingIndicatorConfiguration
    
        func makeBody(_ configuration: ProgressConfiguration) -> some View {
            Progress(configuration)
        }
    }
}

struct IndicatorPositionKey: EnvironmentKey {
    public static let defaultValue: LoadingIndicator.Layout = .top
}

struct IndicatorControlSizeKey: EnvironmentKey {
    public static let defaultValue: ControlSize = .regular
}

struct IndicatorTintKey: EnvironmentKey {
    public static let defaultValue: Color = .preferredColor(.quaternaryLabel)
}

public extension EnvironmentValues {
    /// Title position of loading indicator. Default value is `top`.
    var indicatorPosition: LoadingIndicator.Layout {
        get { self[IndicatorPositionKey.self] }
        set { self[IndicatorPositionKey.self] = newValue }
    }

    /// The control size of the loading indicator. Default value is `.regular`.
    var indicatorControlSize: ControlSize {
        get { self[IndicatorControlSizeKey.self] }
        set { self[IndicatorControlSizeKey.self] = newValue }
    }

    /// The tint color of loading indicator. Default value is `.quaternaryLabel`.
    var indicatorTint: Color {
        get { self[IndicatorTintKey.self] }
        set { self[IndicatorTintKey.self] = newValue }
    }
}

public extension View {
    /// Sets the position of the loading indicator.
    /// - Parameter position: The desired layout position for the loading indicator.
    /// - Returns: A view that has the indicator position applied.
    func indicatorPosition(_ position: LoadingIndicator.Layout) -> some View {
        self.environment(\.indicatorPosition, position)
    }

    /// Sets the size for the loading indicator.
    /// - Parameter controlSize: One of the control sizes specified in the ControlSize enumeration.
    /// - Returns: A view that has the indicator scale effect applied.
    func indicatorControlSize(_ controlSize: ControlSize) -> some View {
        self.environment(\.indicatorControlSize, controlSize)
    }

    /// Sets the tint color of the loading indicator.
    /// - Parameter tint: The desired color for the loading indicator.
    /// - Returns: A view that has the indicator tint color applied.
    func indicatorTint(_ tint: Color) -> some View {
        self.environment(\.indicatorTint, tint)
    }
}

/// :nodoc:
public extension LoadingIndicator {
    /// Position of the loading indicator
    enum Layout {
        /// Leading position of the loading indicator
        case leading
        /// Trailing position of the loading indicator
        case trailing
        /// Top position of the loading indicator
        case top
        /// Bottom position of the loading indicator
        case bottom
    }
}
