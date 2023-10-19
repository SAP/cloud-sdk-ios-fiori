import SwiftUI

extension Fiori {
    enum SortFilterFullCFG {
        typealias Items = EmptyModifier
        typealias ItemsCumulative = EmptyModifier
        typealias CancelAction = EmptyModifier
        typealias CancelActionCumulative = EmptyModifier
        typealias ResetAction = EmptyModifier
        typealias ResetActionCumulative = EmptyModifier
        typealias ApplyAction = EmptyModifier
        typealias ApplyActionCumulative = EmptyModifier

        static let items = Items()
        static let cancelAction = CancelAction()
        static let resetAction = ResetAction()
        static let applyAction = ApplyAction()
        static let itemsCumulative = ItemsCumulative()
        static let cancelActionCumulative = CancelActionCumulative()
        static let resetActionCumulative = ResetActionCumulative()
        static let applyActionCumulative = ApplyActionCumulative()
    }
}

extension SortFilterFullCFG: View {
    public var body: some View {
        CancellableResettableDialogForm {
            Text("Sort & Filter")
        } cancelAction: {
            cancelAction
                .simultaneousGesture(
                    TapGesture()
                        .onEnded { _ in
                            print("...Cancel...")
                            context.handleCancel?()
                            context.isApplyButtonEnabled = false
                            context.isResetButtonEnabled = false
                            dismiss()
                        }
                )
        } resetAction: {
            resetAction
                .simultaneousGesture(
                    TapGesture()
                        .onEnded { _ in
                            print("...Reset...")
                            context.handleReset?()
                            context.isApplyButtonEnabled = false
                            context.isResetButtonEnabled = false
                            dismiss()
                        }
                )

        } applyAction: {
            applyAction
                .simultaneousGesture(
                    TapGesture()
                        .onEnded { _ in
                            print("...Apply...")
                            context.handleApply?()
                            context.isApplyButtonEnabled = false
                            context.isResetButtonEnabled = false
                            _onUpdate?()
                            dismiss()
                        }
                )

                .buttonStyle(ApplyButtonStyle())
        } components: {
            _items
                .environmentObject(context)
//                .onModelUpdateAppCallback(_onUpdate!)
//                .cancelActionView(cancelAction)
//                .resetActionView(resetAction)
//                .applyActionView(applyAction)
        }
    }
}

/*
 // FIXME: - Implement SortFilterFullCFG specific LibraryContentProvider

 @available(iOS 14.0, macOS 11.0, *)
 struct SortFilterFullCFGLibraryContent: LibraryContentProvider {
     @LibraryContentBuilder
     var views: [LibraryItem] {
         LibraryItem(SortFilterFullCFG(model: LibraryPreviewData.Person.laurelosborn),
                     category: .control)
     }
 }
 */
