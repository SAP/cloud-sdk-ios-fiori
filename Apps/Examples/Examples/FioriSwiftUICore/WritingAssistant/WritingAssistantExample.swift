import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct WACustomDestination: View {
    @Binding var helperAction: WAHelperAction
    @State private var customDestinationValue: String = "Custom Destination"
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            ObjectItem {
                Text(self.customDestinationValue)
            } action: {
                Button {
                    self.dismiss()
                    self.helperAction = .update("Updated by custom destination operation")
                } label: {
                    Text("Replace")
                }
            }
        }
        .navigationTitle("Custom Destination")
    }
}

struct WritingAssistantExample: View {
    @State private var text: String = "Improve efficiency and work-life balance"
    @State private var text2: String = "Text Field 2"
    @State var helperAction = WAHelperAction.none
    @State var errorOccurred = false
    
    @ViewBuilder
    var customDestination: some View {
        WACustomDestination(helperAction: self.$helperAction)
            .navigationTitle("Analyze Text")
    }
    
    private func fetchData(for menu: WAMenu, value: String) async -> WAResult {
        if self.errorOccurred {
            try? await Task.sleep(nanoseconds: 1500000000)
            return .failure(WAError(detailImage: FioriIcon.illustrations.simpleConnectionSpot, title: "Error Title", description: "Error Description", action: self.illustratedMessageAction, detailImageSize: .small))
        } else {
            if menu == .analyzeText {
                return .customDestination(self.customDestination)
            } else {
                try? await Task.sleep(nanoseconds: 1500000000)
                return .success("Mock Async Value - \(menu.title)")
            }
        }
    }
    
    private func submitFeedback(state: AIUserFeedbackVoteState, values: [String]) async -> WAFeedbackResult {
        try? await Task.sleep(nanoseconds: 1500000000)
        if self.errorOccurred {
            return .failure(WAError(detailImage: FioriIcon.illustrations.simpleConnectionSpot, title: "Error Title", description: "Error Description", action: self.illustratedMessageAction, detailImageSize: .small))
        } else {
            return .success
        }
    }
    
    var illustratedMessageAction: FioriButton {
        FioriButton { _ in
            self.helperAction = .retry
        } label: { _ in
            Text("Retry")
        }
    }
    
    let feedbackOptions = ["Inaccuracies", "Repetitive or Wordy", "Inappropriate Content", "Security Risks", "Slow Response", "Others"]
    
    var body: some View {
        List {
            Toggle("Show Error", isOn: self.$errorOccurred)
            
            NoteFormView(text: self.$text, placeholder: "NoteFormView", errorMessage: "", hintText: AttributedString("Hint Text"), isCharCountEnabled: true, allowsBeyondLimit: false)
                .foregroundStyle(Color.red)
                .waTextInput(self.$text, menus: WAMenu.availableMenus, menuHandler: { menu, value in
                    await self.fetchData(for: menu, value: value)
                }, feedbackOptions: self.feedbackOptions, feedbackHandler: { state, values in
                    await self.submitFeedback(state: state, values: values)
                })
                .waHelperAction(self.$helperAction)
                .frame(height: 100)
            
            TextInputField(text: self.$text2)
                .foregroundStyle(Color.blue)
                .border(Color.black)
                .waTextInput(self.$text2, menus: WAMenu.availableMenus, menuHandler: { menu, value in
                    await self.fetchData(for: menu, value: value)
                }, feedbackOptions: self.feedbackOptions, feedbackHandler: nil)
                .frame(height: 60)
            Spacer()
        }
        .padding()
    }
}

/// Predefined menus for the writing assistant feature.
extension WAMenu {
    /// Menu to enhance the text.
    static let enhance = WAMenu(title: "Enhance Writing", icon: FioriIcon.actions.writeNew)
    /// Menu to make the text shorter.
    static let makeShorter = WAMenu(title: "Make Shorter", icon: FioriIcon.actions.decreaseLineHeight)
    /// Menu to make the text longer.
    static let makeLonger = WAMenu(title: "Make Longer", icon: FioriIcon.actions.increaseLineHeight)
    /// Menu to make a bullet list.
    static let makeBulletList = WAMenu(title: "Make Bullet List", icon: FioriIcon.actions.bulletText)
    /// Menu to analyze the text.
    static let analyzeText = WAMenu(title: "Analyze Text", icon: FioriIcon.charts.businessObjectsExperience)
    /// Menu to change the tone of the text.
    static let changeTone = WAMenu(title: "Change Tone",
                                   children: tones)
    /// Menu to translate the text.
    static let translate = WAMenu(title: "Translate",
                                  children: languages)
    
    /// Default menus for the writing assistant feature.
    static let availableMenus = [
        [enhance, makeShorter, makeLonger, makeBulletList, analyzeText],
        [changeTone, translate]
    ]
}

extension WAMenu {
    /// Default menus for tones change.
    static let tones = [professional, friendly, excited, casual, confident, thoughtful, funny]
    /// Default menus for languages translation.
    static let languages = [english, german, french, spanish, italian, chinese]
}

extension WAMenu {
    /// Menu for professional tone.
    static let professional = WAMenu(title: "Professional")
    /// Menu for friendly tone.
    static let friendly = WAMenu(title: "Friendly")
    /// Menu for excited tone.
    static let excited = WAMenu(title: "Excited")
    /// Menu for casual tone.
    static let casual = WAMenu(title: "Casual")
    /// Menu for confident tone.
    static let confident = WAMenu(title: "Confident")
    /// Menu for thoughtful tone.
    static let thoughtful = WAMenu(title: "Thoughtful")
    /// Menu for funny tone.
    static let funny = WAMenu(title: "Funny")
}

extension WAMenu {
    /// Menu for English languages translation.
    static let english = WAMenu(title: "English")
    /// Menu for German language translation.
    static let german = WAMenu(title: "German")
    /// Menu for French language translation.
    static let french = WAMenu(title: "French")
    /// Menu for Spanish language translation.
    static let spanish = WAMenu(title: "Spanish")
    /// Menu for Italian language translation.
    static let italian = WAMenu(title: "Italian")
    /// Menu for Chinese language translation.
    static let chinese = WAMenu(title: "Chinese")
}
