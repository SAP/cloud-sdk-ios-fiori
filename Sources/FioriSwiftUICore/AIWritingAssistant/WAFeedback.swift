import SwiftUI

struct WAFeedback: View {
    @State var feedbackSelection: [Int] = []
    @EnvironmentObject var context: WritingAssistantContext
    @Environment(\.dismiss) private var dismiss
    @State var showError = false
    
    var options: [AttributedString] {
        self.context.feedbackOptions.map { AttributedString($0) }
    }

    var body: some View {
        AIUserFeedback(detailImage: { Image(systemName: "gearshape") },
                       title: { Title(title: "What didn’t you like about this version?") },
                       description: { Text("Please rate your experience to help us improve.") },
                       navigationTitle: "Feedback",
                       filterFormView: self.filterFormView,
                       keyValueFormView: nil,
                       displayMode: .push,
                       isBackgroundInteractionEnabled: true,
                       errorView: { WAErrorIllustratedMessage() },
                       onSubmit: { state, feedbacks, _, _ in
                           self.context.startFeedbackTask(voteState: state, options: feedbacks)
                       }, voteState: .downVote)
            .environment(\.isSubmitRequestFailed, self.$showError)
            .onChange(of: self.context.showErrorInFeedbackView) {
                self.showError = self.context.showErrorInFeedbackView
            }
            .onChange(of: self.context.feedbackDownvoted) {
                if self.context.feedbackDownvoted {
                    self.dismiss()
                }
            }
    }
    
    var filterFormView: FilterFormView {
        FilterFormView(title: "", isRequired: true, options: self.options, errorMessage: nil, isEnabled: true, allowsMultipleSelection: true, allowsEmptySelection: false, value: self.$feedbackSelection, buttonSize: .fixed, onValueChange: nil)
    }
}

struct WAErrorIllustratedMessage: View {
    @EnvironmentObject private var context: WritingAssistantContext
    var body: some View {
        if let error = self.context.errorModel.error {
            IllustratedMessage(detailImage: error.detailImage?.resizable(),
                               title: error.title,
                               description: error.description,
                               action: error.action,
                               secondaryAction: error.secondaryAction,
                               detailImageSize: error.detailImageSize,
                               isActionVerticallyAligned: error.isActionVerticallyAligned ?? false,
                               contentAlignment: error.contentAlignment ?? .leading)
        } else {
            EmptyView()
        }
    }
}
