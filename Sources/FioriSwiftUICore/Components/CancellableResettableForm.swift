import Foundation
import SwiftUI

struct CancellableResettableDialogNavigationForm<Title: View, CancelAction: View, ResetAction: View, ApplyAction: View, Components: View>: View {
    let title: Title
    
    let components: Components
    
    var cancelAction: CancelAction
    var resetAction: ResetAction
    var applyAction: ApplyAction
    let calculateScrollView: Bool
    @State private var sheetContentHeight: CGFloat = 0
    @State private var hasInitialMeasurement: Bool = false
    @State private var bottomHeight: CGFloat = 0
    @State private var navigationBarHeight: CGFloat = {
        if LiquidGlassHelper.usesLiquidGlassUI {
            return UIDevice.current.userInterfaceIdiom != .phone ? 67 : 74
        } else {
            return UIDevice.current.userInterfaceIdiom != .phone ? 50.0 : 56.0
        }
    }()

    @State private var scrollViewHeight: CGFloat? = nil
    @State private var subScrollViewHeight: CGFloat = 0
    @State var horizontalSizeClass: UserInterfaceSizeClass = UIDevice.current.userInterfaceIdiom != .phone ? .regular : .compact
    
    @State private var presentingViewHeight: CGFloat = 0

    #if !os(visionOS)
        private let popoverIdealWidth = 393.0
    #else
        private let popoverIdealWidth = 480.0
    #endif
    
    public init(calculateScrollView: Bool = false,
                dynamicDetentHeight: Binding<CGFloat> = .constant(0),
                @ViewBuilder title: () -> Title,
                @ViewBuilder cancelAction: () -> CancelAction,
                @ViewBuilder resetAction: () -> ResetAction,
                @ViewBuilder applyAction: () -> ApplyAction,
                @ViewBuilder components: () -> Components)
    {
        self.calculateScrollView = calculateScrollView
        self.title = title()
        self.cancelAction = cancelAction()
        self.resetAction = resetAction()
        self.applyAction = applyAction()
        self.components = components()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.preferredColor(.secondaryGroupedBackground)
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    self.components
                        .environment(\.sortFilterContentHeight, self.$subScrollViewHeight)
                    #if !os(visionOS)
                        .listRowBackground(Color.preferredColor(.secondaryGroupedBackground))
                    #else
                        .listRowBackground(Color.clear)
                    #endif
                        .ifApply(self.calculateScrollView) {
                            if #available(iOS 18, *) {
                                return $0.onScrollGeometryChange(for: [Double].self) { geo in
                                    [geo.contentSize.height,
                                     geo.contentInsets.top]
                                } action: { _, newValue in
                                    self.scrollViewHeight = max(newValue.reduce(0, +), 88)
                                }
                                .typeErased
                            } else {
                                return $0.modifier(FioriIntrospectModifier<UIScrollView> { scrollView in
                                    DispatchQueue.main.async {
                                        withAnimation {
                                            self.scrollViewHeight = max(scrollView.contentSize.height + scrollView.adjustedContentInset.top, 88)
                                        }
                                    }
                                }).typeErased
                            }
                        }
                        .ifApply(!self.calculateScrollView) {
                            if #available(iOS 18, *) {
                                return $0.onGeometryChange(for: CGFloat.self) { proxy in
                                    proxy.size.height
                                } action: { oldHeight, newHeight in
                                    if !self.hasInitialMeasurement {
                                        // On iOS 26, the first layout pass may report an inflated height
                                        // that includes the navigation bar safe area inset. The second pass
                                        // corrects to the true content height. We always take the smaller
                                        // stable value when height shrinks after the first measurement.
                                        if oldHeight == 0 || newHeight <= oldHeight {
                                            self.sheetContentHeight = newHeight
                                            self.hasInitialMeasurement = true
                                        }
                                    } else {
                                        // After initial measurement, accept all updates directly
                                        // (e.g., DatePicker growing taller when switching to a 6-week month)
                                        self.sheetContentHeight = newHeight
                                    }
                                }.typeErased
                            } else {
                                return $0.background {
                                    GeometryReader { proxy in
                                        Color.clear
                                            .task {
                                                self.sheetContentHeight = proxy.size.height
                                            }
                                    }
                                }.typeErased
                            }
                        }
                    VStack(spacing: 0) {
                        self.applyAction
                            .accessibilityIdentifier("Apply")
                        Spacer().frame(height: self.horizontalSizeClass == .regular ? 16 : 6)
                    }
                    .background {
                        GeometryReader { proxy in
                            Color.clear
                                .task {
                                    self.bottomHeight = proxy.size.height
                                }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    self.title
                }
                ToolbarItem(placement: .topBarLeading) {
                    self.cancelAction
                        .fixedSize()
                        .accessibilityIdentifier("Cancel")
                }.hideSharedBackground()
                ToolbarItem(placement: .topBarTrailing) {
                    self.resetAction
                        .fixedSize()
                        .accessibilityIdentifier("Reset")
                }.hideSharedBackground()
            }
        }
        .frame(idealWidth: self.popoverIdealWidth, idealHeight: self.hasIdealHeight ? self.idealHeight() : nil)
        .presentationDetents(self.presentationDetent())
        #if !os(visionOS)
            .listRowBackground(Color.preferredColor(.secondaryGroupedBackground))
        #else
            .listRowBackground(Color.clear)
        #endif
            .background(
                PresentingViewHeightReader { height in
                    self.presentingViewHeight = height
                }
            )
            .background(WindowTraitReader { sizeClass in
                self.horizontalSizeClass = sizeClass
            })
    }
    
    func presentationDetent() -> Set<PresentationDetent> {
        if self.calculateScrollView, let scrollViewHeight {
            if self.subScrollViewHeight > 0 {
                return [.height(self.subScrollViewHeight), .large]
            } else {
                let halfScreenHeight = self.presentingViewHeight / 2
                if #available(iOS 26.0, *) {
                    return [.height(scrollViewHeight + self.bottomHeight), .medium, .large]
                } else if scrollViewHeight + self.bottomHeight > halfScreenHeight {
                    return [.medium, .fraction(0.999)]
                } else {
                    return [.height(scrollViewHeight + self.bottomHeight), .fraction(0.999)]
                }
            }
        } else {
            return [.height(self.sheetContentHeight + self.bottomHeight + self.navigationBarHeight)]
        }
    }

    func idealHeight() -> CGFloat {
        if self.calculateScrollView, let scrollViewHeight {
            if self.subScrollViewHeight > 0 {
                return self.subScrollViewHeight
            } else {
                return scrollViewHeight + self.bottomHeight
            }
        } else {
            return self.sheetContentHeight + self.bottomHeight + self.navigationBarHeight
        }
    }

    /// Whether the ideal height has been measured and is ready to use.
    /// On iPad, applying an idealHeight of ~navigationBarHeight before content
    /// is measured causes the popover to clip its content.
    var hasIdealHeight: Bool {
        if self.calculateScrollView {
            return self.scrollViewHeight != nil
        } else {
            return self.sheetContentHeight > 0
        }
    }

    var bottomPadding: CGFloat {
        if self.horizontalSizeClass == .regular {
            return 26
        } else {
            return 0
        }
    }
}

struct ApplyButtonStyle: PrimitiveButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    func makeBody(configuration: Configuration) -> some View {
        if self.isEnabled {
            configuration.label
                .frame(maxWidth: .infinity)
                .padding([.top, .bottom], 8)
                .font(.fiori(forTextStyle: .body, weight: .semibold))
            #if !os(visionOS)
                .foregroundStyle(Color.preferredColor(.base2))
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.preferredColor(.tintColor)))
            #else
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.clear))
            #endif
            
                .onTapGesture {
                    configuration.trigger()
                }
                .padding([.top], self.horizontalSizeClass == .regular ? 16 : 6)
                .padding(.horizontal, self.horizontalSizeClass == .regular ? 13 : 16)
        } else {
            configuration.label
                .frame(maxWidth: .infinity)
                .padding([.top, .bottom], 8)
                .font(.fiori(forTextStyle: .body, weight: .semibold))
            #if !os(visionOS)
                .foregroundStyle(Color.preferredColor(.quaternaryLabel))
            #else
                .foregroundStyle(Color.preferredColor(.primaryLabel))
            #endif
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.preferredColor(.quaternaryFill)))
                .padding([.top], self.horizontalSizeClass == .regular ? 16 : 6)
                .padding(.horizontal, self.horizontalSizeClass == .regular ? 13 : 16)
        }
    }
}

struct CancelButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.fiori(forTextStyle: .body, weight: .semibold))
        #if !os(visionOS)
            .foregroundStyle(Color.preferredColor(.tintColor))
        #else
            .foregroundStyle(Color.preferredColor(.primaryLabel))
        #endif
            .onTapGesture {
                configuration.trigger()
            }
            .contentShape(.accessibility, .capsule.scale(1.2))
    }
}

struct ResetButtonStyle: PrimitiveButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        if self.isEnabled {
            configuration.label
                .font(.fiori(forTextStyle: .body, weight: .semibold))
            #if !os(visionOS)
                .foregroundStyle(Color.preferredColor(.tintColor))
            #else
                .foregroundStyle(Color.preferredColor(.primaryLabel))
            #endif
                .onTapGesture {
                    configuration.trigger()
                }
                .contentShape(.accessibility, .capsule.scale(1.2))
        } else {
            configuration.label
                .font(.fiori(forTextStyle: .body, weight: .semibold))
            #if !os(visionOS)
                .foregroundStyle(Color.preferredColor(.separator))
            #else
                .foregroundStyle(Color.preferredColor(.primaryLabel))
            #endif
                .contentShape(.accessibility, .capsule.scale(1.2))
        }
    }
}

// Custom UIViewControllerRepresentable to get the presenting view controller's view height
private struct PresentingViewHeightReader: UIViewControllerRepresentable {
    let onHeightChange: (CGFloat) -> Void
    
    func makeUIViewController(context: Context) -> HeightReaderViewController {
        HeightReaderViewController(onHeightChange: self.onHeightChange)
    }
    
    func updateUIViewController(_ uiViewController: HeightReaderViewController, context: Context) {}
    
    final class HeightReaderViewController: UIViewController {
        let onHeightChange: (CGFloat) -> Void
        
        init(onHeightChange: @escaping (CGFloat) -> Void) {
            self.onHeightChange = onHeightChange
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) { nil }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            self.updatePresentingViewHeight()
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            self.updatePresentingViewHeight()
        }
        
        private func updatePresentingViewHeight() {
            // Try to get the presenting view controller's view height
            if let presentingVC = self.presentingViewController {
                let height = presentingVC.view.bounds.height
                self.onHeightChange(height)
            } else if let window = self.view.window {
                // Fallback to window height if no presenting VC
                let height = window.bounds.height
                self.onHeightChange(height)
            }
        }
    }
}

// This is used to get window traits, cause horizontal size class is always compact in popover.
private struct WindowTraitReader: UIViewControllerRepresentable {
    let onChange: (UserInterfaceSizeClass) -> Void
    func makeUIViewController(context: Context) -> WindowViewController { WindowViewController(onChange: self.onChange) }
    func updateUIViewController(_ uiViewController: WindowViewController, context: Context) {}
    
    final class WindowViewController: UIViewController {
        let onChange: (UserInterfaceSizeClass) -> Void
        init(onChange: @escaping (UserInterfaceSizeClass) -> Void) {
            self.onChange = onChange
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) { nil }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.registerTraitObservers()
        }
        
        private func registerTraitObservers() {
            self.registerForTraitChanges([UITraitHorizontalSizeClass.self, UITraitVerticalSizeClass.self]) { (self: Self, _: UITraitCollection) in
                let sizeClass = self.view.window?.windowScene?.traitCollection.horizontalSizeClass
                self.onChange(self.horizontalSizeClass(sizeClass))
            }
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            let sizeClass = view.window?.windowScene?.traitCollection.horizontalSizeClass
            self.onChange(self.horizontalSizeClass(sizeClass))
        }
        
        func horizontalSizeClass(_ sizeClass: UIUserInterfaceSizeClass?) -> UserInterfaceSizeClass {
            switch sizeClass {
            case .regular:
                return .regular
            default:
                return .compact
            }
        }
    }
}

extension ToolbarContent {
    func hideSharedBackground(_ visibility: Visibility = .hidden) -> some ToolbarContent {
        if #available(iOS 26.0, macOS 26.0, *) {
            #if !os(visionOS)
                return self.sharedBackgroundVisibility(visibility)
            #else
                return self
            #endif
        } else {
            return self
        }
    }
}
