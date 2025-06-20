import SwiftUI

struct WAFeedback: View {
    @State var feedbackSelection: [Int] = []
    @EnvironmentObject var context: WritingAssistantContext
    @Environment(\.dismiss) private var dismiss
    
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
                       onSubmit: { state, feedbacks, _, submitStateUpdate in
                           Task {
                               let submitSuccess = await context.feedbackHandler(state, feedbacks)
                               if submitSuccess {
                                   self.dismiss()
                               } else {
                                   submitStateUpdate(.failed)
                               }
                           }
                       }, voteState: .downVote)
    }
    
    var filterFormView: FilterFormView {
        FilterFormView(title: "", isRequired: true, options: self.options, errorMessage: nil, isEnabled: true, allowsMultipleSelection: true, allowsEmptySelection: false, value: self.$feedbackSelection, buttonSize: .fixed, onValueChange: nil)
    }
}
