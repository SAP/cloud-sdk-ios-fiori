import Combine
import FioriSwiftUICore
import FioriThemeManager
import Foundation
import SwiftUI

/*
 *  COMPONENT STRUCTURE ANNOTATION
 *
 *  Visual/structural map (look at the interface):
 *
 *  +-------------------------------------------------------------------+
 *  | AIUserFeedback (container)                                        |
 *  |                                                                   |
 *  |  navigationTitle: AttributedString?                               |
 *  |                                                                   |
 *  |  illustrated message (header)                                     |
 *  |    - Title  (Title wrapper)                                       |
 *  |    - Description (Description wrapper)                            |
 *  |    - (customizable via illustratedMessageTitle/Description        |
 *  |       style modifiers)                                            |
 *  |                                                                   |
 *  |  Vote area (actions)                                              |
 *  |    - action() -> Action?           // custom primary action       |
 *  |    - secondaryAction() -> SecondaryAction?                        |
 *  |    - Default behavior when nil: component provides vote           |
 *  |      up/down UI and helpers                                       |
 *  |    - Environment helpers available inside action views:           |
 *  |        \.aiUserFeedbackPerformUpVote                              |
 *  |        \.aiUserFeedbackPerformDownVote                            |
 *  |        \.aiUserFeedbackPerformSubmit                              |
 *  |                                                                   |
 *  |  filterFormView: FilterFormView?                                  |
 *  |    - options: [AttributedString]                                  |
 *  |    - value: Binding<[Int]>  (selected indexes)                    |
 *  |                                                                   |
 *  |  keyValueFormView: KeyValueFormView?                              |
 *  |    - text: Binding<String>                                        |
 *  |    - placeholder, errorMessage, char count, etc.                  |
 *  |                                                                   |
 *  |  Submit button                                                    |
 *  |    - submitButtonState: Binding<AIUserFeedbackSubmitButtonState>  |
 *  |    - onSubmit(...) callback (report success via submitResult)     |
 *  |                                                                   |
 *  +-------------------------------------------------------------------+
 *
 */

struct AIUserFeedbackExample: View {
    @State var isFeedbackPresented = false
    @State var isFeedbackPushed = false
    @State var isNavigationPresented = false
    @State var isToastPresented = false
    @State var isInspectorPresented = false
    @State var disableMultipleVote = false

    @State var filterFormViewSelectionValue: [Int] = [0]
    @State var valueText: String = ""
    @State var submitButtonState: AIUserFeedbackSubmitButtonState = .normal
    
    // Customize
    let voteStates: [AIUserFeedbackVoteState] = [.notDetermined, .upVote, .downVote]
    @State var voteState: AIUserFeedbackVoteState = .notDetermined
    @State var voteStateIndex: Int = 0
    
    @State var filterOptionLineLimit: Int? = 1
    
    @State var isBackgroundInteractionEnabled = false
    @State var customizedVoteButton = false
    @State var displayFilterForm = true
    @State var displayKeyValueForm = true
    @State var displayContentError = false
    @State var customizedErrorView = false
    @State var isSubmitResultSuccess = true
    @State var customizedFeedbackTitles = false
    
    var body: some View {
        List {
            Button {
                self.voteState = .notDetermined
                self.isFeedbackPresented.toggle()
            } label: {
                Text("Present AI User Feedback")
            }
            .popover(isPresented: self.$isFeedbackPresented) {
                self.showFeedback(mode: .sheet)
            }
            
            Button {
                self.isNavigationPresented.toggle()
            } label: {
                Text("Push From Writing Assistant")
            }
            .popover(isPresented: self.$isNavigationPresented) {
                self.navigationViewContainer
            }
            
            NavigationLink("Inspector") {
                InspectorNavigationStack(isInspectorPresented: self.$isInspectorPresented) {
                    self.showFeedback(mode: .inspector)
                }
                .onAppear {
                    self.voteState = .notDetermined
                }
            }
            
            NavigationLink("Inline AIUserFeedback") {
                List {
                    self.showFeedback(mode: .inline)
                        .onAppear {
                            self.voteState = .notDetermined
                        }
                }
                .toastMessage(isPresented: self.$isToastPresented, title: "Thank you for your feedback", duration: 3)
                .navigationTitle("Inline AIUserFeedback")
            }
            
            Toggle("Is Background Interaction Enabled", isOn: self.$isBackgroundInteractionEnabled)
            Toggle("Customized Vote Button", isOn: self.$customizedVoteButton)
            Toggle("Display Filter Form View", isOn: self.$displayFilterForm)
            Toggle("Display Key Value Form View", isOn: self.$displayKeyValueForm)
            Toggle("Display Content Error", isOn: self.$displayContentError)
            Toggle("Customized Error View", isOn: self.$customizedErrorView)
            Toggle("Mock Submit Result(On: Success, Off: Fail)", isOn: self.$isSubmitResultSuccess)
            Toggle("Disable Multiple Vote", isOn: self.$disableMultipleVote)
            Toggle("Custom feedback title", isOn: self.$customizedFeedbackTitles)

            Picker("Vote State(Not work for push)", selection: self.$voteStateIndex) {
                ForEach(0 ..< self.voteStates.count, id: \.self) { index in
                    let state = self.voteStates[index]
                    Text(self.valueForVoteState(state: state))
                }
            }
            .onChange(of: self.voteStateIndex) {
                self.voteState = self.voteStates[self.voteStateIndex]
            }

            Picker(selection: self.$filterOptionLineLimit, label: Text("Feedback option Line Limit")) {
                Text("Not Set").tag(Int?.some(0))
                Text("No Limit").tag(Int?.none)
                Text("1").tag(Int?.some(1))
                Text("2").tag(Int?.some(2))
                Text("3").tag(Int?.some(3))
                Text("4").tag(Int?.some(4))
            }
        }
        .disableMultipleVoteForAIUserFeedback(self.disableMultipleVote)
        .toastMessage(isPresented: self.$isToastPresented, title: "Thank you for your feedback", duration: 3)
    }
    
    func valueForVoteState(state: AIUserFeedbackVoteState) -> String {
        switch state {
        case .notDetermined: return "Not Determined"
        case .upVote: return "Up Vote"
        case .downVote: return "Down Vote"
        }
    }
    
    func showFeedback(mode: AIUserFeedbackDisplayMode) -> some View {
        let valueOptions: [AttributedString] = ["Inaccuraies", "Inappropriate Content", "Security Risks", "Slow Response", "Repetitive or Wordy", "Others"]
        var filterFormView = FilterFormView(title: "Select all that apply", isRequired: true, options: valueOptions, errorMessage: displayContentError && self.filterFormViewSelectionValue.isEmpty ? "Missing required field" : nil, isEnabled: true, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$filterFormViewSelectionValue, buttonSize: .fixed, numberOfLines: self.filterOptionLineLimit, onValueChange: { value in
            print("FilterFormView value change: \(value)")
        })
        if self.filterOptionLineLimit == 0 {
            filterFormView = FilterFormView(title: "Select all that apply", isRequired: true, options: valueOptions, errorMessage: self.displayContentError && self.filterFormViewSelectionValue.isEmpty ? "Missing required field" : nil, isEnabled: true, allowsMultipleSelection: true, allowsEmptySelection: true, value: self.$filterFormViewSelectionValue, buttonSize: .fixed, onValueChange: { value in
                print("FilterFormView value change: \(value)")
            })
            print("Skip setting numberOfLines, it will use the default value.")
        }
        let keyValueFormView = KeyValueFormView(title: "Additional feedback", text: self.$valueText, placeholder: "Write additional comments here", errorMessage: self.displayContentError && self.valueText.isEmpty ? "Missing required field" : nil, minTextEditorHeight: 88, maxTextLength: 200, hintText: AttributedString("Hint Text"), isCharCountEnabled: true, allowsBeyondLimit: false, isRequired: true)
		
        func shouldDisableSubmit() -> Bool {
            let formsMissing = (self.displayFilterForm && self.filterFormViewSelectionValue.isEmpty) || (self.displayKeyValueForm && self.valueText.isEmpty)
            return formsMissing || self.voteState == .notDetermined
        }
        
        return AIUserFeedback(detailImage: { Image(systemName: "gearshape") },
                              title: { Title(title: mode == .inline ? "How was your AI experience? (Inline Mode)" : "How was your AI experience?") },
                              description: { Text("Please rate your experience to help us improve.") },
                              // Build the action views inline and return a view (or nil) so `nil` can be passed to trigger default logic.
                              action: { self.customizedVoteButton ? self.customAction : nil },
                              secondaryAction: { self.customizedVoteButton ? self.customSecondaryAction : nil },
                              navigationTitle: "Feedback",
                              filterFormView: self.displayFilterForm ? filterFormView : nil,
                              keyValueFormView: self.displayKeyValueForm ? keyValueFormView : nil,
                              displayMode: mode,
                              isBackgroundInteractionEnabled: self.isBackgroundInteractionEnabled,
                              errorView: { self.customizedErrorView ? self.customErrorView : nil },
                              onCancel: {
                                  if mode == .inspector {
                                      self.isInspectorPresented.toggle()
                                  }
                                  self.submitButtonState = .normal
                              }, onUpVote: {
                                  print("up vote call back")
                              }, onDownVote: {
                                  print("down vote call back")
                              }, onSubmit: { _, _, _, submitResult in
                                  self.submitButtonState = .inProgress
                                  if self.isSubmitResultSuccess {
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                          submitResult(true)
                                          self.submitButtonState = .normal
                                          switch mode {
                                          case .push:
                                              self.isFeedbackPushed = false
                                          case .sheet:
                                              self.isFeedbackPresented = false
                                          case .inspector:
                                              self.isInspectorPresented = false
                                          case .inline:
                                              break
                                          }
                                          self.isToastPresented.toggle()
                                      }
                                  } else {
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                          self.submitButtonState = .normal
                                          submitResult(false)
                                      }
                                  }
                              }, voteState: self.$voteState,
                              submitButtonState: self.$submitButtonState)
            .illustratedMessageTitleStyle {
                if self.customizedFeedbackTitles {
                    Text("This is a customized illustrated message title")
                } else {
                    $0.title
                }
            }
            .illustratedMessageDescriptionStyle {
                if self.customizedFeedbackTitles {
                    Text("This is a customized illustrated message description")
                } else {
                    $0.description
                }
            }
            .filterFormViewTitleStyle {
                if self.customizedFeedbackTitles {
                    Text("This is a customized filter form view title")
                } else {
                    $0.title
                }
            }
            .keyValueFormViewTitleStyle {
                if self.customizedFeedbackTitles {
                    Text("This is a customized key value form view title")
                } else {
                    $0.title
                }
            }
            // lifecycle updates to submitButtonState
            .onAppear {
                self.submitButtonState = shouldDisableSubmit() ? .disabled : .normal
            }
            .onChange(of: self.filterFormViewSelectionValue) {
                self.submitButtonState = shouldDisableSubmit() ? .disabled : .normal
            }
            .onChange(of: self.valueText) {
                self.submitButtonState = shouldDisableSubmit() ? .disabled : .normal
            }
            .onChange(of: self.voteState) {
                self.submitButtonState = shouldDisableSubmit() ? .disabled : .normal
            }
    }
    
    @ViewBuilder
    var navigationViewContainer: some View {
        NavigationStack {
            HStack {
                Text("How was the response?")
                
                Spacer()
                
                HStack(spacing: 20, content: {
                    Button {} label: {
                        FioriIcon.actions.thumbUp
                    }
                    
                    Button {
                        self.voteState = .downVote
                        self.isFeedbackPushed.toggle()
                    } label: {
                        FioriIcon.actions.thumbDown
                    }
                })
            }
            .padding(.horizontal, 20)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        self.isNavigationPresented.toggle()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Push Example")
                        .foregroundColor(Color.preferredColor(.primaryLabel))
                        .font(Font.fiori(forTextStyle: .subheadline, weight: .black))
                }
            }
            .navigationDestination(isPresented: self.$isFeedbackPushed) {
                self.showFeedback(mode: .push)
            }
        }
        .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
            v.frame(width: 393.0, height: 400.0)
        })
        .presentationDetents([.medium])
    }
    
    // Provide FioriButton instances as computed properties so the action closures can return them (or nil) and thus trigger default logic when nil is returned.
    var customAction: some View {
        DownVoteActionView(voteState: self.$voteState)
    }
    
    var customSecondaryAction: some View {
        UpVoteActionView(voteState: self.$voteState)
    }
    
    @ViewBuilder
    var customErrorView: some View {
        Image(systemName: "wifi.exclamationmark")
            .font(.largeTitle)
    }
}

// Custom action view that reads helper closures from its own environment.
// AIUserFeedback injects these helpers into the action view's environment,
// allowing the view to read them directly.
//
// Usage choice:
// - Implement your own custom tap behavior (e.g., toggle voteState manually)
// - Or call the injected helper (performDownVote) to trigger the component's default behavior
// The choice is up to the user of this view.
private struct DownVoteActionView: View {
    @Binding var voteState: AIUserFeedbackVoteState
    @Environment(\.aiUserFeedbackPerformDownVote) private var performDownVote

    var body: some View {
        FioriButton { _ in
            // Option 1: Implement your own custom tap behavior
            // Toggle down vote state manually
            if self.voteState == .downVote {
                self.voteState = .notDetermined
            } else {
                self.voteState = .downVote
            }
            
            // Option 2: Call the injected helper to trigger default behavior
            // Uncomment the line below to use the component's built-in logic
            // performDownVote?()
        } label: { _ in
            self.voteState == .downVote ? FioriIcon.actions.sysCancel2 : FioriIcon.actions.sysCancel
        }
        .id(self.voteState)
    }
}

// Small action views that read the helper closures from their own environment (this is why AIUserFeedback injects helpers into the action view's environment — the view reads it directly).
private struct UpVoteActionView: View {
    @Binding var voteState: AIUserFeedbackVoteState
    @Environment(\.aiUserFeedbackPerformUpVote) private var performUpVote
    @Environment(\.aiUserFeedbackPerformSubmit) private var performSubmit

    var body: some View {
        FioriButton { _ in
            // Option 1: Implement your own custom tap behavior
            // Toggle up vote state manually
            if self.voteState == .upVote {
                self.voteState = .notDetermined
            } else {
                self.voteState = .upVote
            }

            // Option 2: Call the injected helper to trigger default behavior
            // Uncomment the lines below to use the component's built-in logic
            // performUpVote?()
            // performSubmit?()
        } label: { _ in
            self.voteState == .upVote ? FioriIcon.actions.sysEnterFill : FioriIcon.actions.sysEnter
        }
        .id(self.voteState)
    }
}

struct InspectorNavigationStack<Content: View>: View {
    @Binding var isInspectorPresented: Bool
    let inspectorView: () -> Content
    
    var body: some View {
        #if os(iOS) || os(macOS)
            self.navigationStack
                .inspector(isPresented: self.$isInspectorPresented) {
                    self.inspectorView()
                }
                .inspectorColumnWidth(375)
        #else
            self.navigationStack
        #endif
    }
    
    var navigationStack: some View {
        NavigationStack {
            Button {
                self.isInspectorPresented.toggle()
            } label: {
                Text("Display as inspector")
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(String("Inspector Example"))
        }
    }
}
