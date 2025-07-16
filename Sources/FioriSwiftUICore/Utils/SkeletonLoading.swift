import SwiftUI

/**
 # Skeleton Loading API

 Skeleton loading utilities for SwiftUI views, providing shimmer and placeholder effects to indicate loading states.

 ## ShimmerViewModifier

 A `ViewModifier` that applies a shimmer animation and placeholder effect to any SwiftUI view.

 **Parameters:**
 - `isTintColor`: `Bool` — Use tint color for shimmer effect. Default: `false`.

 ## SkeletonImageModifier

 A `ViewModifier` that applies a skeleton loading style to an image when loading.

 **Parameters:**
 - `isLoading`: `Bool` — Whether the image is loading.
 - `skeletonImage`: `Image` — Image to display as skeleton. Default: system photo icon.
 - `frame`: `CGSize?` — Optional frame for the image.

 ## View Extensions

 ### skeletonLoading(isTintColor:)

 Applies a shimmer loading effect to the view.

 ```swift
 func skeletonLoading(isTintColor: Bool = false) -> some View
 ```

 ### imageSkeletonLoading(isLoading:skeletonImage:frame:)

 Applies a skeleton loading style to an image when `isLoading` is true.

 ```swift
 func imageSkeletonLoading(
     isLoading: Bool,
     skeletonImage: Image = Image(systemName: "photo"),
     frame: CGSize? = nil
 ) -> some View
 ```

 ## SkeletonLoadingContainer

 A container view that applies a skeleton loading style to its content when environment key `isLoading` is true.

 ```swift
 public struct SkeletonLoadingContainer<Content: View>: View
 ```

 **Parameters:**
 - `content`: Closure returning the content view.

 ## Environment Keys

 ### isLoading

 A custom environment value indicating whether content is currently loading.

 ```swift
 .environment(\.isLoading, true)
 ```

 ### isAILoading

 A custom environment value indicating whether AI content is currently loading (for tint shimmer).

 ```swift
 .environment(\.isAILoading, true)
 ```

 ## Examples

 ### Basic Skeleton Loading on Text

 ```swift

 Text("Loading...").loadingStyle()
 ```

 ### Skeleton Loading on Image

 ```swift
 Image(systemName: "person.crop.circle")
     .imageSkeletonLoading(isLoading: true, frame: CGSize(width: 60, height: 60))
 ```

 ### Using SkeletonLoadingContainer

 ```swift
 SkeletonLoadingContainer {
     VStack {
         Text("Title")
         Text("Subtitle")
     }
 }
 .environment(\.isLoading, isLoading)
 ```

 ### Using Environment Keys

 ```swift
 struct ContentView: View {
     @State var isLoading
     var body: some View {
         Text(isLoading ? "Loading..." : "Loaded")
            .skeletonLoading(isLoading: isLoading)
     }
 }
 ```
 */
                        
struct ShimmerViewModifier: ViewModifier {
    @State private var phase: CGFloat = -1
    @Environment(\.isLoading) var isLoading
    @Environment(\.isAILoading) var isTintColor

    var redactedForegroundColor: Color? {
        if self.isLoading {
            return Color.preferredColor(self.isTintColor ? .tintColor : .separator)
        } else {
            return nil
        }
    }
    
    @ViewBuilder func redactedOverlay(content: Content) -> some View {
        if self.isLoading {
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
                        .animation(self.isLoading
                            ? Animation.linear(duration: 2).repeatForever(autoreverses: false)
                            : .default, value: self.phase)
                }
            }
            .allowsHitTesting(false)
        } else {
            EmptyView()
        }
    }

    func body(content: Content) -> some View {
        content
            .foregroundColor(self.redactedForegroundColor)
            .redacted(reason: self.isLoading ? .placeholder : [])
            .overlay(
                self.redactedOverlay(content: content)
            )
            .onChange(of: self.isLoading) {
                if self.isLoading {
                    self.startShimmer()
                } else {
                    self.stopShimmer()
                }
            }
            .onAppear {
                if self.isLoading {
                    self.startShimmer()
                } else {
                    self.stopShimmer()
                }
            }
            .allowsHitTesting(self.isLoading ? false : true)
    }
    
    private func startShimmer() {
        self.phase = 1
    }
    
    private func stopShimmer() {
        self.phase = -1
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
    /// - `isLoading`: A Boolean value indicating whether the view is in a loading state. Defaults to `true`.
    /// - `isTintColor`: A Boolean value indicating whether to use the tint color for the shimmer effect. Defaults to `false`.
    func skeletonLoading(isLoading: Bool = true, isTintColor: Bool = false) -> some View {
        self.modifier(ShimmerViewModifier())
            .environment(\.isLoading, isLoading)
            .environment(\.isAILoading, isTintColor)
    }
    
    internal func containerSkeletonLoading() -> some View {
        self.modifier(ShimmerViewModifier())
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
    let content: () -> Content
    @Environment(\.isLoading) var isLoading
    @Environment(\.isAILoading) var isAILoading
    
    public var body: some View {
        self.content()
            .foregroundColor(self.isLoading ? Color.preferredColor(.separator) : nil)
            .redacted(reason: self.isLoading ? .placeholder : [])
            .skeletonLoading(isLoading: self.isLoading, isTintColor: self.isAILoading)
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
