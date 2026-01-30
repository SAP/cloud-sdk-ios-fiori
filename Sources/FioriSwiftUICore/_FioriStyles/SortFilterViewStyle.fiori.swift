import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.

 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct SortFilterViewBaseStyle: SortFilterViewStyle {
    @StateObject var context: SortFilterContext = .init()
    @Environment(\.dismiss) var dismiss
    @Environment(\.sortFilterBarItemFrame) var sortFilterBarItemFrame

    public func makeBody(_ configuration: SortFilterViewConfiguration) -> some View {
        // Add default layout here
        CancellableResettableDialogNavigationForm(calculateScrollView: true, title: {
            configuration.title
        }, cancelAction: {
            configuration.cancelAction
                .onSimultaneousTapGesture {
                    self.context.handleCancel?()
                    configuration.onCancel?()
                    self.dismiss()
                }
        }, resetAction: {
            configuration.resetAction
                .onSimultaneousTapGesture {
                    self.context.handleReset?()
                    configuration.onReset?()
                }
                .environment(\.isEnabled, self.context.isResetButtonEnabled)
        }, applyAction: {
            configuration.applyAction
                .onSimultaneousTapGesture {
                    self.context.handleApply?()
                    configuration.onUpdate?()
                    self.dismiss()
                }
        }, components: {
            SortFilterCFGItemContainer(items: configuration.$items, btnFrame: self.sortFilterBarItemFrame)
                .environmentObject(self.context)
        })
        #if os(visionOS)
        .background(Color.clear)
        #endif
    }
}

// Default fiori styles
extension SortFilterViewFioriStyle {
    struct ContentFioriStyle: SortFilterViewStyle {
        func makeBody(_ configuration: SortFilterViewConfiguration) -> some View {
            SortFilterView(configuration)
            // Add default style for its content
            // .background()
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let sortFilterViewConfiguration: SortFilterViewConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
        }
    }

    struct CancelActionFioriStyle: CancelActionStyle {
        let sortFilterViewConfiguration: SortFilterViewConfiguration

        func makeBody(_ configuration: CancelActionConfiguration) -> some View {
            CancelAction(configuration)
                .fioriButtonStyle(FioriNavigationButtonStyle())
        }
    }

    struct ApplyActionFioriStyle: ApplyActionStyle {
        let sortFilterViewConfiguration: SortFilterViewConfiguration
        @Environment(\.isEnabled) private var isEnabled
        @Environment(\.horizontalSizeClass) private var horizontalSizeClass

        func makeBody(_ configuration: ApplyActionConfiguration) -> some View {
            ApplyAction(configuration)
                .fioriButtonStyle(SortFilterApplyButtonStyle(self.isEnabled, self.horizontalSizeClass))
        }
    }

    struct ResetActionFioriStyle: ResetActionStyle {
        let sortFilterViewConfiguration: SortFilterViewConfiguration
        @Environment(\.isEnabled) private var isEnabled

        func makeBody(_ configuration: ResetActionConfiguration) -> some View {
            ResetAction(configuration)
                .fioriButtonStyle(FioriNavigationButtonStyle())
        }
    }
}

struct SortFilterCancelButtonStyle: FioriButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let foregroundColor: Color
          
        #if !os(visionOS)
            foregroundColor = Color.preferredColor(.tintColor)
        #else
            foregroundColor = Color.preferredColor(.primaryLabel)
        #endif
        let config = FioriButtonConfiguration(foregroundColor: foregroundColor,
                                              backgroundColor: .clear,
                                              font: .fiori(forTextStyle: .body, weight: .semibold),
                                              padding: EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
        return configuration.containerView(.unspecified)
            .fioriButtonConfiguration(config)
    }
}

struct SortFilterApplyButtonStyle: FioriButtonStyle {
    let isEnabled: Bool
    let horizontalSizeClass: UserInterfaceSizeClass?
    
    init(_ isEnabled: Bool, _ horizontalSizeClass: UserInterfaceSizeClass? = nil) {
        self.isEnabled = isEnabled
        self.horizontalSizeClass = horizontalSizeClass
    }
    
    func makeBody(configuration: Configuration) -> some View {
        let foregroundColor: Color
        let background: Color
          
        #if !os(visionOS)
            foregroundColor = self.isEnabled ? Color.preferredColor(.base2) : Color.preferredColor(.quaternaryLabel)
            background = self.isEnabled ? Color.preferredColor(.tintColor) : Color.preferredColor(.quaternaryFill)
        #else
            foregroundColor = self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.primaryLabel)
            background = self.isEnabled ? Color.clear : Color.preferredColor(.quaternaryFill)
        #endif
        let config = FioriButtonConfiguration(foregroundColor: foregroundColor,
                                              backgroundColor: background,
                                              font: .fiori(forTextStyle: .body, weight: .semibold),
                                              padding: EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0),
                                              maxWidth: .infinity)
        return configuration.containerView(.unspecified)
            .fioriButtonConfiguration(config)
            .padding([.top], self.horizontalSizeClass == .regular ? 16 : 6)
            .padding(.horizontal, self.horizontalSizeClass == .regular ? 13 : 16)
    }
}

struct SortFilterResetButtonStyle: FioriButtonStyle {
    let isEnabled: Bool
    
    init(_ isEnabled: Bool) {
        self.isEnabled = isEnabled
    }
    
    func makeBody(configuration: Configuration) -> some View {
        let foregroundColor: Color
          
        #if !os(visionOS)
            foregroundColor = self.isEnabled ? Color.preferredColor(.tintColor) : Color.preferredColor(.separator)
        #else
            foregroundColor = self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.primaryLabel)
        #endif
        let config = FioriButtonConfiguration(foregroundColor: foregroundColor,
                                              backgroundColor: .clear,
                                              font: .fiori(forTextStyle: .body, weight: .semibold),
                                              padding: EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
        return configuration.containerView(.unspecified)
            .fioriButtonConfiguration(config)
    }
}
