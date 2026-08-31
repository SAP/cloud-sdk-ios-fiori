import SwiftUI

/// A skeleton placeholder for a single `KPIHeader` item, shown while the header is loading.
///
/// KPIHeader items cannot be skeletonized by the generic `SkeletonLoadingContainer` alone:
/// - `KPIProgressItem` renders its value as a single `Text` built from differently-sized runs
///   (e.g. "65" + "%"), which `.redacted(.placeholder)` splits into multiple overlapping blocks
///   once the surrounding `scaleEffect` is applied.
/// - A custom view can contain opaque `Color`/`Shape` fills that `.redacted` cannot turn into a
///   placeholder, so the shimmer masks against the real (e.g. random) colors.
///
/// Instead of relying on `.redacted`, this view draws regular placeholder shapes filled with the
/// `.separator` color (the same base color the generic skeleton uses) and applies the shared
/// `.skeletonLoading()` shimmer on top. This keeps the shimmer identical to every other skeleton in
/// the app while giving each element its own, non-overlapping placeholder.
struct KPIHeaderItemSkeleton: View {
    /// The item model. `KPIItem` / `KPIProgressItem` get a structure-matching placeholder; any other
    /// value (including `nil`, used by the builder-based path where the concrete type is unknown)
    /// falls back to a single rounded placeholder sized to `measuredSize`.
    let model: (any KPIHeaderItemModel)?
    /// The measured size of the real item, used to size the fallback placeholder so the layout does
    /// not jump when loading completes.
    var measuredSize: CGSize?

    @Environment(\.isAILoading) private var isAILoading: Bool

    // Match the generic skeleton exactly: `.separator` normally, `.tintColor` for AI (tint) loading
    // — the same colors `ShimmerViewModifier.redactedForegroundColor` / `SkeletonLoadingContainer`
    // use.
    private var placeholderColor: Color {
        Color.preferredColor(self.isAILoading ? .tintColor : .separator).opacity(0.3)
    }

    var body: some View {
        self.placeholder
            .skeletonLoading(isLoading: true, isTintColor: self.isAILoading)
    }

    @ViewBuilder
    private var placeholder: some View {
        if let progress = model as? KPIProgressItem {
            self.progressPlaceholder(chartSize: progress.chartSize)
        } else if self.model is KPIItem {
            self.kpiItemPlaceholder
        } else {
            self.fallbackPlaceholder
        }
    }

    // MARK: - KPIProgressItem

    @ViewBuilder
    private func progressPlaceholder(chartSize: KPIProgressItemSize) -> some View {
        let diameter: CGFloat = chartSize == .large ? 130 : 104
        // The real item is measured (measuredSize) and drives the container height. Size the whole
        // placeholder to that measured size so the ring and footnote are never clipped. The ring
        // takes most of the height; a footnote block sits just below it.
        let totalHeight = self.measuredSize?.height ?? diameter
        let ringSize = min(diameter, max(0, totalHeight - 14))
        VStack(spacing: 2) {
            ZStack {
                // The gray progress ring.
                Circle()
                    .stroke(self.placeholderColor, lineWidth: 2)
                    .frame(width: ringSize, height: ringSize)
                VStack(spacing: 2) {
                    // A single block replacing the value/percent text (no split, no overlap).
                    RoundedRectangle(cornerRadius: 4)
                        .fill(self.placeholderColor)
                        .frame(width: ringSize * 0.42, height: ringSize * 0.22)
                    // Caption placeholder (inside the ring, like the real layout).
                    RoundedRectangle(cornerRadius: 3)
                        .fill(self.placeholderColor)
                        .frame(width: ringSize * 0.5, height: ringSize * 0.1)
                }
            }
            // Footnote placeholder (below the ring), matching the real layout.
            RoundedRectangle(cornerRadius: 3)
                .fill(self.placeholderColor)
                .frame(width: ringSize * 0.7, height: 10)
        }
        .frame(width: self.measuredSize?.width ?? diameter, height: totalHeight)
    }

    // MARK: - KPIItem

    private var kpiItemPlaceholder: some View {
        VStack(spacing: 4) {
            // Metric placeholder.
            RoundedRectangle(cornerRadius: 4)
                .fill(self.placeholderColor)
                .frame(width: 96, height: 30)
            // Caption placeholder.
            RoundedRectangle(cornerRadius: 3)
                .fill(self.placeholderColor)
                .frame(width: 72, height: 14)
        }
        .frame(maxWidth: 216)
    }

    // MARK: - Custom view / fallback

    private var fallbackPlaceholder: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(self.placeholderColor)
            .frame(width: self.measuredSize?.width ?? 104,
                   height: self.measuredSize?.height ?? 104)
    }
}
