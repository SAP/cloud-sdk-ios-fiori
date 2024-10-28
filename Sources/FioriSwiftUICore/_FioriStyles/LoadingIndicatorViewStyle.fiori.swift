import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct LoadingIndicatorViewBaseStyle: LoadingIndicatorViewStyle {
    @Environment(\.indicatorPosition) var position
    @Environment(\.indicatorTint) var tint
    @Environment(\.indicatorScaleEffect) var scaleEffect
    private var timerTool = TimerTask()

    public func makeBody(_ configuration: LoadingIndicatorViewConfiguration) -> some View {
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

    private func makeBodyForProgressView() -> some View {
        ProgressView()
            .tint(self.tint)
            .scaleEffect(self.scaleEffect)
    }

    private func layoutBody(_ configuration: LoadingIndicatorViewConfiguration) -> some View {
        switch self.position {
        case .leading:
            return AnyView(HStack(spacing: 8) {
                self.makeBodyForProgressView()
                configuration.title
            })
        case .trailing:
            return AnyView(HStack(spacing: 8) {
                configuration.title
                self.makeBodyForProgressView()
            })
        case .bottom:
            return AnyView(VStack(spacing: 8) {
                configuration.title
                self.makeBodyForProgressView()
            })
        case .top:
            return AnyView(VStack(spacing: 8) {
                self.makeBodyForProgressView()
                configuration.title
            })
        }
    }
}

// Default fiori styles
extension LoadingIndicatorViewFioriStyle {
    struct ContentFioriStyle: LoadingIndicatorViewStyle {
        func makeBody(_ configuration: LoadingIndicatorViewConfiguration) -> some View {
            LoadingIndicatorView(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let loadingIndicatorViewConfiguration: LoadingIndicatorViewConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .headline))
        }
    }
}

struct IndicatorPositionKey: EnvironmentKey {
    public static let defaultValue: LoadingIndicatorView.Layout = .top
}

struct IndicatorScaleEffectKey: EnvironmentKey {
    public static let defaultValue: CGFloat = 1
}

struct IndicatorTintKey: EnvironmentKey {
    public static let defaultValue: Color = .preferredColor(.quaternaryLabel)
}

public extension EnvironmentValues {
    /// Title position of loading indicator. Default value is `top`.
    var indicatorPosition: LoadingIndicatorView.Layout {
        get { self[IndicatorPositionKey.self] }
        set { self[IndicatorPositionKey.self] = newValue }
    }

    /// The scale effect of the loading indicator. Default value is `1`.
    var indicatorScaleEffect: CGFloat {
        get { self[IndicatorScaleEffectKey.self] }
        set { self[IndicatorScaleEffectKey.self] = newValue }
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
    func indicatorPosition(_ position: LoadingIndicatorView.Layout) -> some View {
        self.environment(\.indicatorPosition, position)
    }

    /// Sets the scale effect of the loading indicator.
    /// - Parameter scaleEffect: A CGFloat value representing the scale effect for the loading indicator.
    /// - Returns: A view that has the indicator scale effect applied.
    func indicatorScaleEffect(_ scaleEffect: CGFloat) -> some View {
        self.environment(\.indicatorScaleEffect, scaleEffect)
    }

    /// Sets the tint color of the loading indicator.
    /// - Parameter tint: The desired color for the loading indicator.
    /// - Returns: A view that has the indicator tint color applied.
    func indicatorTint(_ tint: Color) -> some View {
        self.environment(\.indicatorTint, tint)
    }
}

/// :nodoc:
public extension LoadingIndicatorView {
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
