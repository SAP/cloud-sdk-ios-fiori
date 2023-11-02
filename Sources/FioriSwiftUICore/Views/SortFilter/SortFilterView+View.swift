import SwiftUI

extension Fiori {
    enum SortFilterView {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.body)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(Color.preferredColor(.primaryLabel))
                    .multilineTextAlignment(.center)
            }
        }
        typealias TitleCumulative = EmptyModifier
        typealias Items = EmptyModifier
        typealias ItemsCumulative = EmptyModifier
        typealias CancelAction = EmptyModifier
        typealias CancelActionCumulative = EmptyModifier
        typealias ResetAction = EmptyModifier
        typealias ResetActionCumulative = EmptyModifier
        typealias ApplyAction = EmptyModifier
        typealias ApplyActionCumulative = EmptyModifier

        static let title = Title()
        static let items = Items()
        static let cancelAction = CancelAction()
        static let resetAction = ResetAction()
        static let applyAction = ApplyAction()
        static let titleCumulative = TitleCumulative()
        static let itemsCumulative = ItemsCumulative()
        static let cancelActionCumulative = CancelActionCumulative()
        static let resetActionCumulative = ResetActionCumulative()
        static let applyActionCumulative = ApplyActionCumulative()
    }
}

extension SortFilterView: View {
    public var body: some View {
        CancellableResettableDialogForm {
            title
        } cancelAction: {
            cancelAction
                .simultaneousGesture(
                    TapGesture()
                        .onEnded { _ in
                            context.handleCancel?()
                            dismiss()
                        }
                )
                .buttonStyle(CancelButtonStyle())
        } resetAction: {
            resetAction
                .simultaneousGesture(
                    TapGesture()
                        .onEnded { _ in
                            context.handleReset?()
                        }
                )
                .buttonStyle(ResetButtonStyle())
                .environment(\.isEnabled, context.isResetButtonEnabled)
        } applyAction: {
            applyAction
                .simultaneousGesture(
                    TapGesture()
                        .onEnded { _ in
                            context.handleApply?()
                            _onUpdate?()
                            dismiss()
                        }
                )
                .buttonStyle(ApplyButtonStyle())
                .environment(\.isEnabled, true)
        } components: {
            _items
                .environmentObject(context)
        }
    }
}

/*
 @available(iOS 14.0, macOS 11.0, *)
 struct SortFilterFullCFGLibraryContent: LibraryContentProvider {
     @LibraryContentBuilder
     var views: [LibraryItem] {
         LibraryItem(SortFilterFullCFG(model: LibraryPreviewData.Person.laurelosborn),
                     category: .control)
     }
 }
 */
