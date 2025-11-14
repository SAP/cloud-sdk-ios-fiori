import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct WritingAssistantFormBaseStyle: WritingAssistantFormStyle {
    public func makeBody(_ configuration: WritingAssistantFormConfiguration) -> some View {
        NavigationStack {
            InternalWAForm(configuration: configuration,
                           menus: configuration.menus,
                           isTopLevel: true,
                           navigationBarTitleString: "Writing Assistant")
        }
    }
}

// Default fiori styles
extension WritingAssistantFormFioriStyle {
    struct ContentFioriStyle: WritingAssistantFormStyle {
        func makeBody(_ configuration: WritingAssistantFormConfiguration) -> some View {
            WritingAssistantForm(configuration)
        }
    }
    
    struct CancelActionFioriStyle: CancelActionStyle {
        let writingAssistantFormConfiguration: WritingAssistantFormConfiguration
        
        func makeBody(_ configuration: CancelActionConfiguration) -> some View {
            CancelAction(configuration)
                .fioriButtonStyle(FioriNavigationButtonStyle())
        }
    }
    
    struct DoneActionFioriStyle: DoneActionStyle {
        let writingAssistantFormConfiguration: WritingAssistantFormConfiguration
        
        func makeBody(_ configuration: DoneActionConfiguration) -> some View {
            DoneAction(configuration)
                .fioriButtonStyle(FioriNavigationButtonStyle())
        }
    }
    
    struct CloseActionFioriStyle: CloseActionStyle {
        let writingAssistantFormConfiguration: WritingAssistantFormConfiguration
        
        func makeBody(_ configuration: CloseActionConfiguration) -> some View {
            CloseAction(configuration)
                .fioriButtonStyle(AIWACloseButtonStyle())
        }
    }
    
    struct BackActionFioriStyle: BackActionStyle {
        let writingAssistantFormConfiguration: WritingAssistantFormConfiguration
        
        func makeBody(_ configuration: BackActionConfiguration) -> some View {
            BackAction(configuration)
        }
    }
    
    struct UndoActionFioriStyle: UndoActionStyle {
        let writingAssistantFormConfiguration: WritingAssistantFormConfiguration
        
        func makeBody(_ configuration: UndoActionConfiguration) -> some View {
            UndoAction(configuration)
                .fioriButtonStyle(AIWAActionButtonStyle())
                .accessibilityLabel(NSLocalizedString("Undo change", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Undo change"))
                .accessibilityAddTraits(.isButton)
        }
    }
    
    struct RedoActionFioriStyle: RedoActionStyle {
        let writingAssistantFormConfiguration: WritingAssistantFormConfiguration
        
        func makeBody(_ configuration: RedoActionConfiguration) -> some View {
            RedoAction(configuration)
                .fioriButtonStyle(AIWAActionButtonStyle())
                .accessibilityLabel(NSLocalizedString("Rodo change", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Redo change"))
                .accessibilityAddTraits(.isButton)
        }
    }
    
    struct UpVoteActionFioriStyle: UpVoteActionStyle {
        @EnvironmentObject var context: WritingAssistantContext
        let writingAssistantFormConfiguration: WritingAssistantFormConfiguration
        
        func makeBody(_ configuration: UpVoteActionConfiguration) -> some View {
            UpVoteAction(configuration)
                .upVoteActionStyle(UpVoteButtonSelectedStyle(isSelected: self.context.feedbackUpvoted))
                .fioriButtonStyle(AIVoteActionButtonStyle())
                .accessibilityLabel(NSLocalizedString("Positive feedback", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Positive feedback"))
                .accessibilityAddTraits(.isButton)
        }
    }
    
    struct DownVoteActionFioriStyle: DownVoteActionStyle {
        @EnvironmentObject var context: WritingAssistantContext
        let writingAssistantFormConfiguration: WritingAssistantFormConfiguration
        
        func makeBody(_ configuration: DownVoteActionConfiguration) -> some View {
            DownVoteAction(configuration)
                .downVoteActionStyle(DownVoteButtonSelectedStyle(isSelected: self.context.feedbackDownvoted))
                .fioriButtonStyle(AIVoteActionButtonStyle())
                .accessibilityLabel(NSLocalizedString("Negative feedback", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Negative feedback"))
                .accessibilityAddTraits(.isButton)
        }
    }
    
    struct FootnoteFioriStyle: FootnoteStyle {
        let writingAssistantFormConfiguration: WritingAssistantFormConfiguration
        
        func makeBody(_ configuration: FootnoteConfiguration) -> some View {
            if configuration.footnote.isEmpty {
                Footnote(footnote: "How was this response?")
            } else {
                Footnote(configuration)
            }
        }
    }
}

struct AIWACloseButtonStyle: FioriButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.state == .highlighted || configuration.state == .selected
        let isDisabled = configuration.state == .disabled
        return configuration.label
            .font(.system(size: 8, weight: .bold))
            .foregroundColor(.preferredColor(isPressed || isDisabled ? .quaternaryLabel : .primaryLabel))
            .padding(8)
            .background {
                Circle().fill(Color.preferredColor(.tertiaryFill))
            }
    }
}

struct AIWAActionButtonStyle: FioriButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.state == .highlighted || configuration.state == .selected
        let isDisabled = configuration.state == .disabled
        return configuration.label
            .frame(maxWidth: .infinity, maxHeight: 38)
            .font(Font.fiori(forTextStyle: .body, weight: .semibold))
            .foregroundColor(.preferredColor(isPressed || isDisabled ? .quaternaryLabel : .secondaryLabel))
            .background {
                Color.preferredColor(isPressed || isDisabled ? .quaternaryFill : .tertiaryFill)
                    .clipShape(.rect(cornerRadius: 8))
            }
    }
}

struct AIVoteActionButtonStyle: FioriButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.state == .highlighted || configuration.state == .selected
        let isDisabled = configuration.state == .disabled
        return configuration.label
            .frame(width: 38, height: 38)
            .font(Font.fiori(forTextStyle: .body))
            .foregroundColor(.preferredColor(isPressed ? .tintColorTapState : isDisabled ? .quaternaryLabel : .tintColor))
    }
}
