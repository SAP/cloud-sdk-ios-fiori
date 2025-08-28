// Generated using Sourcery 2.2.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `WhatsNewPageView` is used to inform users of new features during the onboarding process. It takes a collection of up to 10 views which it displays as a sequence of pages. Users can navigate through these pages by swiping horizontally or by tapping one of the navigation buttons in the component. Any type of view can be provided as a page, but we recommend using `WhatsNewPage` or  a `VStack` containing multiple `WhatsNewListItem` views.
/// ## Usage
/// ```swift
/// struct WhatsNewExample: View {
///     @State var presentPageViewExample = false
///
///     var body: some View {
///         Button("Present View") {
///             presentPageViewExample.toggle()
///         }
///         .sheet(isPresented: $presentPageViewExample, content: {
///             WhatsNewPageViewExample()
///         })
///     }
/// }
///
/// struct WhatsNewPageViewExample: View {
///     @Environment(\.dismiss) var dismiss
///     @State var selectedIndex: Int? = 0
///
///     var body: some View {
///         WhatsNewPageView(whatsNewPages: {
///             WhatsNewPage(detailImage: {
///                 FioriIcon.illustrations.tentDot.resizable()
///             }, title: {
///                 Text("Page 1")
///             }, description: {
///                 Text("Description text")
///             }, imageSize: CGSize(width: 80, height: 80))
///             WhatsNewPage(detailImage: FioriIcon.illustrations.successScreenDialog.resizable(), title: "Page 2", description: "Description text", isImageExpanded: true)
///             VStack(alignment: .leading, spacing: 30) {
///                 WhatsNewListItem(detailImage: Image("wheel").resizable(), title: "List item 1", subtitle: "Subtitle text")
///                 WhatsNewListItem(detailImage: Image("ProfilePic").resizable(), title: "List item 2")
///                 WhatsNewListItem(title: "List item 3", subtitle: "Subtitle text")
///             }
///         }, currentIndex: $selectedIndex, didClose: {
///             self.dismiss()
///         }, didFinish: {
///             self.dismiss()
///         })
///     }
/// }
public struct WhatsNewPageView {
    let whatsNewPages: any View
    /// The index of the current page. When the value changes, the component will navigate to the page corresponding to the new value.
    @Binding var currentIndex: Int?
    let didClose: (() -> Void)?
    let didFinish: (() -> Void)?

    @Environment(\.whatsNewPageViewStyle) var style

    var componentIdentifier: String = WhatsNewPageView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@WhatsNewPagesBuilder whatsNewPages: () -> any View,
                currentIndex: Binding<Int?>,
                didClose: (() -> Void)? = nil,
                didFinish: (() -> Void)? = nil,
                componentIdentifier: String? = WhatsNewPageView.identifier)
    {
        self.whatsNewPages = whatsNewPages()
        self._currentIndex = currentIndex
        self.didClose = didClose
        self.didFinish = didFinish
        self.componentIdentifier = componentIdentifier ?? WhatsNewPageView.identifier
    }
}

public extension WhatsNewPageView {
    static let identifier = "fiori_whatsnewpageview_component"
}

public extension WhatsNewPageView {
    init(_ configuration: WhatsNewPageViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: WhatsNewPageViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.whatsNewPages = configuration.whatsNewPages
        self._currentIndex = configuration.$currentIndex
        self.didClose = configuration.didClose
        self.didFinish = configuration.didFinish
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension WhatsNewPageView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, whatsNewPages: .init(self.whatsNewPages), currentIndex: self.$currentIndex, didClose: self.didClose, didFinish: self.didFinish)).typeErased
                .transformEnvironment(\.whatsNewPageViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension WhatsNewPageView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        WhatsNewPageView(.init(componentIdentifier: self.componentIdentifier, whatsNewPages: .init(self.whatsNewPages), currentIndex: self.$currentIndex, didClose: self.didClose, didFinish: self.didFinish))
            .shouldApplyDefaultStyle(false)
            .whatsNewPageViewStyle(WhatsNewPageViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
