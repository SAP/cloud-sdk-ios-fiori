import SwiftUI

struct ShimmerViewModifier: ViewModifier {
    @State private var phase: CGFloat = -1
    @State var isTintColor: Bool = false

    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.preferredColor(self.isTintColor ? .tintColor : .separator))
            .redacted(reason: .placeholder)
            .overlay(
                GeometryReader { geometry in
                    let width = geometry.size.width
                    ZStack {
                        Color.preferredColor(self.isTintColor ? .tintColor : .base2)
                            .blendMode(.plusLighter)
                            .mask(content)
                        self.getLinearGradient(self.isTintColor)
                            .offset(x: self.phase * width, y: 0)
                            .blendMode(.plusLighter)
                            .mask(content)
                    }
                }
                .allowsHitTesting(false)
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
                gradient: Gradient(colors: [.preferredColor(.base1).opacity(0.2), .preferredColor(.base1).opacity(0.7), .preferredColor(.base1).opacity(0.9), .preferredColor(.base1).opacity(0.7), .preferredColor(.base1).opacity(0.2)]),
                startPoint: .leading,
                endPoint: .trailing
            )
        }
    }
}

struct SkeletonImageModifier: ViewModifier {
    let isLoading: Bool
    let skeletonImage: Image
    let frame: CGSize?

    func body(content: Content) -> some View {
        Group {
            if self.isLoading {
                if let frame {
                    self.skeletonImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(Color.preferredColor(.separator))
                        .skeletonLoading()
                        .frame(width: frame.width, height: frame.height)
                } else {
                    self.skeletonImage
                        .foregroundColor(Color.preferredColor(.separator))
                        .skeletonLoading()
                }
            } else {
                if let frame {
                    content.frame(width: frame.width, height: frame.height)
                } else {
                    content
                }
            }
        }
    }
}

/// A view modifier that applies a shimmer effect to the view, indicating a loading state.
public extension View {
    /// Applies a shimmer loading effect to the view.
    /// - Parameters:
    /// - `isTintColor`: A Boolean value indicating whether to use the tint color for the shimmer effect. Defaults to `false`.
    func skeletonLoading(isTintColor: Bool = false) -> some View {
        self.modifier(ShimmerViewModifier(isTintColor: isTintColor))
    }
}

/// A view modifier that applies a shimmer effect to the view, indicating a loading state.
public extension View {
    /// Applies a shimmer loading effect to the view.
    func loadingStyle() -> some View {
        self.foregroundColor(Color.preferredColor(.separator))
            .redacted(reason: .placeholder)
            .skeletonLoading()
    }
}

/// A view modifier that applies a skeleton loading style to an image when `isLoading` is true.
public extension View {
    /// Applies a skeleton loading style to an image.
    /// - Parameters:
    /// - `isLoading`: A Boolean value indicating whether the image is in a loading state.
    /// - `skeletonImage`: The image to display when loading. It is optional and defaults to a system photo icon.
    /// - `frame`: An optional size for the image frame. If not provided, the image will use its intrinsic size.
    func imageSkeletonLoading(
        isLoading: Bool,
        skeletonImage: Image = Image(systemName: "photo"),
        frame: CGSize? = nil
    ) -> some View {
        self.modifier(SkeletonImageModifier(isLoading: isLoading, skeletonImage: skeletonImage, frame: frame))
    }
}

/// A container view that applies a skeleton loading style to its content when `isLoading` is true.
/// It can also apply a tint color to the skeleton effect if ///
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

/// A custom environment key to manage loading state across views.
public extension EnvironmentValues {
    /// A Boolean value indicating whether content is currently loading. It can be used to show the shimmer effect.
    var isLoading: Bool {
        get { self[IsLoadingKey.self] }
        set { self[IsLoadingKey.self] = newValue }
    }
}

struct IsAILoadingKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

/// A custom environment key to manage AI loading state across views.
public extension EnvironmentValues {
    /// A Boolean value indicating whether AI content is currently loading. It can be used to show the tint color for shimmer effect.
    var isAILoading: Bool {
        get { self[IsAILoadingKey.self] }
        set { self[IsAILoadingKey.self] = newValue }
    }
}
