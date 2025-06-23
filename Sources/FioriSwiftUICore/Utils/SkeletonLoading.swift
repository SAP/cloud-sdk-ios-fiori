import SwiftUI

struct ShimmerViewModifier: ViewModifier {
    @State private var phase: CGFloat = -1
    @State var isTintColor: Bool = false

    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.preferredColor(self.isTintColor ? .tintColor : .separator))
            .redacted(reason: .placeholder)
            .overlay(
                Color.preferredColor(self.isTintColor ? .tintColor : .base2)
                    .blendMode(.plusLighter)
                    .mask(content)
            )
            .overlay(
                self.getLinearGradient(self.isTintColor)
                    .offset(x: self.phase * 200, y: 0)
                    .blendMode(.plusLighter)
                    .mask(content)
            )
            .onAppear {
                self.phase = -1
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                    self.phase = 1
                }
            }
    }
    
    func getLinearGradient(_ isTintColor: Bool) -> LinearGradient {
        if isTintColor {
            return LinearGradient(
                gradient: Gradient(colors: [.preferredColor(.tintColor), .preferredColor(.base2),
                                            .preferredColor(.tintColor)]),
                startPoint: .leading,
                endPoint: .trailing
            )
        } else {
            return LinearGradient(
                gradient: Gradient(colors: [.preferredColor(.base1).opacity(0.6), .preferredColor(.base2), .preferredColor(.base1).opacity(0.6)]),
                startPoint: .leading,
                endPoint: .trailing
            )
        }
    }
}

public extension View {
    func skeletonLoading(isTintColor: Bool = false) -> some View {
        self.modifier(ShimmerViewModifier(isTintColor: isTintColor))
            .id(UUID())
    }
}

public extension View {
    func loadingStyle() -> some View {
        self.foregroundColor(Color.preferredColor(.separator))
            .redacted(reason: .placeholder)
            .skeletonLoading()
    }
}

public struct SkeletonLoadingContainer<Content: View>: View {
    var isLoading: Bool = false
    var isTintColor: Bool = false
    let content: () -> Content

    public var body: some View {
        Group {
            if self.isLoading {
                self.content()
                    .foregroundColor(Color.preferredColor(.separator))
                    .redacted(reason: .placeholder)
                    .skeletonLoading(isTintColor: self.isTintColor)
            } else {
                self.content()
            }
        }
    }
}

struct IsLoadingKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

public extension EnvironmentValues {
    var isLoading: Bool {
        get { self[IsLoadingKey.self] }
        set { self[IsLoadingKey.self] = newValue }
    }
}

struct IsAILoadingKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

public extension EnvironmentValues {
    var isAILoading: Bool {
        get { self[IsAILoadingKey.self] }
        set { self[IsAILoadingKey.self] = newValue }
    }
}
