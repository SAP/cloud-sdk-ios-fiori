import Combine
import FioriSwiftUICore
import FioriThemeManager
import Foundation
import SwiftUI

struct AIUserFeedbackExample: View {
    @State var isFeedbackPresented = false
    @State var isFeedbackPushed = false
    @State var isNavigationPresented = false
    @State var isToastPresented = false
    @State var isInspectorPresented = false

    @State var filterFormViewSelectionValue: [Int] = [0]
    @State var valueText: String = ""
    
    // Customize
    let voteStates: [AIUserFeedbackVoteState] = [.notDetermined, .upVote, .downVote]
    var voteState: AIUserFeedbackVoteState = .notDetermined
    @State var voteStateIndex: Int = 0
    
    @State var isBackgroundInteractionEnabled = false
    @State var customizedVoteButton = false
    @State var displayFilterForm = true
    @State var displayKeyValueForm = true
    @State var displayContentError = false
    @State var customizedErrorView = false
    @State var isSubmitResultSuccess = true
    
    var body: some View {
        List {
            Button {
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
            }
            
            Toggle("Is Background Interaction Enabled", isOn: self.$isBackgroundInteractionEnabled)
            Toggle("Customized Vote Button", isOn: self.$customizedVoteButton)
            Toggle("Display Filter Form View", isOn: self.$displayFilterForm)
            Toggle("Display Key Value Form View", isOn: self.$displayKeyValueForm)
            Toggle("Display Content Error", isOn: self.$displayContentError)
            Toggle("Customized Error View", isOn: self.$customizedErrorView)
            Toggle("Mock Submit Result(On: Success, Off: Fail)", isOn: self.$isSubmitResultSuccess)

            Picker("Vote State(Not work for push)", selection: self.$voteStateIndex) {
                ForEach(0 ..< self.voteStates.count, id: \.self) { index in
                    let state = self.voteStates[index]
                    Text(self.valueForVoteState(state: state))
                }
            }
        }
        .toastMessage(isPresented: self.$isToastPresented, title: "Thank you for your feedback", duration: 3)
    }
    
    func valueForVoteState(state: AIUserFeedbackVoteState) -> String {
        var stateString = ""
        switch state {
        case .notDetermined:
            stateString = "Not Determined"
        case .upVote:
            stateString = "Up Vote"
        case .downVote:
            stateString = "Down Vote"
        }
        return stateString
    }
    
    func showFeedback(mode: AIUserFeedbackDisplayMode) -> some View {
        let valueOptions: [AttributedString] = ["Inaccuraies", "Inappropriate Content", "Security Risks", "Slow Response", "Repetitive or Wordy", "Others"]
        let filterFormView = FilterFormView(title: "Select all that apply", isRequired: true, options: valueOptions, errorMessage: displayContentError ? "Missing required field" : nil, isEnabled: true, allowsMultipleSelection: true, allowsEmptySelection: false, value: self.$filterFormViewSelectionValue, buttonSize: .fixed, onValueChange: { value in
            print("FilterFormView value change: \(value)")
        })
        let keyValueFormView = KeyValueFormView(title: "Additional feedback", text: self.$valueText, placeholder: "Write additional comments here", errorMessage: self.displayContentError ? "Missing required field" : nil, minTextEditorHeight: 88, maxTextLength: 200, hintText: AttributedString("Hint Text"), isCharCountEnabled: true, allowsBeyondLimit: false, isRequired: true)
        
        return AIUserFeedback(detailImage: { Image(systemName: "gearshape") },
                              title: { Title(title: "How was your AI experience?") },
                              description: { Text("Please rate your experience to help us improve.") },
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
                              }, onUpVote: {
                                  print("up vote call back")
                              }, onDownVote: {
                                  print("down vote call back")
                              }, onSubmit: { _, _, _, submitResult in
                                  if self.isSubmitResultSuccess {
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                          switch mode {
                                          case .push:
                                              self.isFeedbackPushed.toggle()
                                          case .sheet:
                                              self.isFeedbackPresented.toggle()
                                          case .inspector:
                                              self.isInspectorPresented.toggle()
                                          }
                                          self.isToastPresented.toggle()
                                      }
                                  } else {
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                          submitResult(false)
                                      }
                                  }
                              }, voteState: mode == .push ? .downVote : self.voteStates[self.voteStateIndex])
    }
    
    @ViewBuilder
    var navigationViewContainer: some View {
        NavigationStack {
            HStack {
                Text("How was the response?")
                
                Spacer()
                
                HStack(spacing: 20, content: {
                    Button {} label: {
                        Image(systemName: "hand.thumbsup")
                    }
                    
                    Button {
                        self.isFeedbackPushed.toggle()
                    } label: {
                        Image(systemName: "hand.thumbsdown")
                    }
                })
            }
            .padding(.horizontal, 20)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(String("Push Example"))
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        self.isNavigationPresented.toggle()
                    } label: {
                        Text("Cancel")
                    }
                }
            })
            .navigationDestination(isPresented: self.$isFeedbackPushed) {
                self.showFeedback(mode: .push)
            }
        }
        .ifApply(UIDevice.current.userInterfaceIdiom != .phone, content: { v in
            v.frame(width: 393.0, height: 400.0)
        })
        .presentationDetents([.medium])
    }
    
    var customAction: FioriButton {
        FioriButton { _ in
            print("custom down vote button")
        } label: { _ in
            Image(systemName: "arrow.down")
        }
    }
    
    var customSecondaryAction: FioriButton {
        FioriButton { _ in
            print("custom up vote button")
        } label: { _ in
            Image(systemName: "arrow.up")
        }
    }
    
    @ViewBuilder
    var customErrorView: some View {
        Image(systemName: "wifi.exclamationmark")
            .font(.largeTitle)
    }
}

struct InspectorNavigationStack<Content: View>: View {
    @Binding var isInspectorPresented: Bool
    let inspectorView: () -> Content
    
    var body: some View {
        NavigationStack {
            Button {
                self.isInspectorPresented.toggle()
            } label: {
                Text("Display as inspector")
            }
            .toolbarBackground(.visible, for: .navigationBar)
//                .toolbarBackground(.teal, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(String("Inspector Example"))
        }
        .inspector(isPresented: self.$isInspectorPresented) {
            self.inspectorView()
        }
        .inspectorColumnWidth(375)
    }
}
