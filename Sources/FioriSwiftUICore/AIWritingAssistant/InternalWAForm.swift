import Combine
import FioriThemeManager
import SwiftUI

struct WritingToolSection: Hashable, Identifiable {
    let id = UUID()
    let menus: [WAMenu]
}

struct InternalWAForm: View {
    @EnvironmentObject var context: WritingAssistantContext
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.dismiss) private var dismiss
    @Environment(\.waHelperAction) private var waHelperAction
    @Environment(\.hideFeedbackFooterInWritingAssistant) private var hideFeedbackFooterInWritingAssistant
    
    @AccessibilityFocusState private var focusOnTitle: Bool
    var configuration: WritingAssistantFormConfiguration
    let menus: [[WAMenu]]
    let isTopLevel: Bool
    let navigationBarTitleString: String
    
    var body: some View {
        Group {
            ZStack {
                WAErrorIllustratedMessage()
                    .opacity(self.context.isErrorHappenedInMenuView ? 1 : 0)
                self.listContent
                    .opacity(self.context.isErrorHappenedInMenuView ? 0 : 1)
            }
        }
        .toolbar {
            if #available(iOS 26.0, *) {
                ToolbarItem(placement: .topBarLeading) {
                    self.topLeadingButton()
                        .fixedSize()
                }
                #if !os(visionOS)
                .sharedBackgroundVisibility(.hidden)
                #endif
                ToolbarItem(placement: .topBarTrailing) {
                    self.topTrailingButton()
                        .fixedSize()
                }
                #if !os(visionOS)
                .sharedBackgroundVisibility(.hidden)
                #endif
            } else {
                ToolbarItem(placement: .topBarLeading) {
                    self.topLeadingButton()
                        .fixedSize()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    self.topTrailingButton()
                        .fixedSize()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbarBackground(Color.preferredColor(.header), for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(self.navigationBarTitleString)
                        .foregroundColor(Color.preferredColor(self.isEnabled ? .primaryLabel : .quaternaryLabel))
                        .font(Font.fiori(forTextStyle: .subheadline, weight: .black))
                    if self.context.rewriteTextSet.count > 1 {
                        self.versionView()
                    }
                }
                .accessibilityFocused(self.$focusOnTitle)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.focusOnTitle = true
                if UIAccessibility.isVoiceOverRunning {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        UIAccessibility.post(notification: .announcement, argument: NSLocalizedString("AI Writing Assistant panel opened. Use provided prompts to refine your text content.", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "AI Writing Assistant panel opened. Use provided prompts to refine your text content."))
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .alert("Discard all changes?", isPresented: self.$context.showCancelAlert, actions: {
            Button(role: .cancel) {
                self.context.showCancelAlert = false
                self.context.updateInWAFlow(true)
            } label: {
                Text("Keep Working")
                    .font(.fiori(forTextStyle: .caption1))
            }
            
            Button(role: .destructive) {
                self.context.showCancelAlert = false
                self.context.cancelAction()
                self.context.isPresented = false
            } label: {
                Text("Discard")
            }
        }, message: {
            Text("Do you want to undo the edits made by the Writing Assistant and revert the text to its original state?")
        })
    }
    
    @ViewBuilder var listContent: some View {
        let sections = self.menus.map { WritingToolSection(menus: $0) }
        List(selection: self.$context.selection) {
            ForEach(sections) { section in
                Section {
                    ForEach(section.menus) { menu in
                        self.row(menu)
                            .listRowBackground(
                                menu == self.context.lastSelection ? .preferredColor(.secondaryFill) : Color.preferredColor(.secondaryGroupedBackground)
                            )
                    }
                } header: {
                    if self.context.rewriteTextSet.count > 1, section.id == sections.first?.id {
                        self.sectionHeader()
                            .textCase(nil)
                            .frame(height: 60)
                            .listRowInsets(EdgeInsets())
                    }
                } footer: {
                    if section.id == sections.last?.id, self.isTopLevel {
                        self.sectionFooter()
                    }
                }
            }
        }
        .contentMargins(.top, 10)
        .listSectionSpacing(10)
        .onAppear {
            self.context.customDestination = nil
            self.waHelperAction.wrappedValue = .none
        }
        .navigationDestination(item: self.$context.customDestination) { customDestination in
            customDestination.destination.typeErased
        }
    }
    
    @ViewBuilder func topLeadingButton() -> some View {
        if self.context.rewriteTextSet.count > 1, self.isTopLevel {
            self.configuration.cancelAction
                .onSimultaneousTapGesture {
                    self.context.showCancelAlert = true
                }
        } else {
            if self.isTopLevel || self.context.errorModel.error != nil {
                EmptyView()
            } else {
                self.configuration.backAction
                    .onSimultaneousTapGesture {
                        self.dismiss()
                    }
            }
        }
    }
    
    @ViewBuilder func topTrailingButton() -> some View {
        if self.context.rewriteTextSet.count > 1 {
            self.configuration.doneAction
                .onSimultaneousTapGesture {
                    self.saveWA()
                }
        } else {
            self.configuration.closeAction
                .onSimultaneousTapGesture {
                    self.cancelWA()
                }
        }
    }
    
    func saveWA() {
        self.context.aiWritingDone()
        self.context.isPresented = false
    }
    
    func cancelWA() {
        self.context.cancelAction()
        self.context.isPresented = false
    }
    
    @ViewBuilder func row(_ item: WAMenu) -> some View {
        if item.children.isEmpty {
            HStack {
                Text(item.title)
                Spacer()
                item.icon
            }
            .foregroundStyle(Color.preferredColor(self.isEnabled ? .primaryLabel : .quaternaryLabel))
            .font(Font.fiori(forTextStyle: .body))
            .tag(item)
            .accessibilityElement(children: .combine)
            .accessibilityHint(NSLocalizedString("Double tap to activate", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Double tap to activate"))
            .accessibilityAddTraits(.isButton)
        } else {
            NavigationLink {
                InternalWAForm(configuration: self.configuration, menus: [item.children], isTopLevel: false, navigationBarTitleString: item.title)
            } label: {
                Text(item.title)
                    .foregroundStyle(Color.preferredColor(self.isEnabled ? .primaryLabel : .quaternaryLabel))
                    .font(Font.fiori(forTextStyle: .body))
                    .accessibilityHint("\(String(format: NSLocalizedString("Open to see %@ options", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), item.title))")
                    .accessibilityAddTraits(.isButton)
            }
        }
    }
    
    @ViewBuilder func sectionHeader() -> some View {
        HStack(spacing: 8) {
            self.configuration.undoAction
                .onSimultaneousTapGesture {
                    self.context.revertToPreviousValue()
                    if UIAccessibility.isVoiceOverRunning {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            let formatString = "Undo to Version %d of %d".localizedFioriString()
                            let versionString = String(format: formatString, self.context.indexOfCurrentValue + 1, self.context.rewriteTextSet.count)

                            UIAccessibility.post(notification: .announcement, argument: versionString)
                        }
                    }
                }
                .disabled(!self.context.revertIsEnabled)
            
            self.configuration.redoAction
                .onSimultaneousTapGesture {
                    self.context.forwardToNextValue()
                    if UIAccessibility.isVoiceOverRunning {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            let formatString = "Redo to Version %d of %d".localizedFioriString()
                            let versionString = String(format: formatString, self.context.indexOfCurrentValue + 1, self.context.rewriteTextSet.count)

                            UIAccessibility.post(notification: .announcement, argument: versionString)
                        }
                    }
                }
                .disabled(!self.context.forwardIsEnabled)
        }
    }
    
    @ViewBuilder func sectionFooter() -> some View {
        if !self.hideFeedbackFooterInWritingAssistant {
            HStack {
                self.configuration.footnote
                Spacer()
                self.configuration.upVoteAction
                    .onSimultaneousTapGesture {
                        if !self.context.feedbackUpvoted {
                            self.context.startFeedbackTask(voteState: .upVote, options: [])
                        }
                    }
                self.configuration.downVoteAction
                    .onSimultaneousTapGesture {
                        if !self.context.feedbackDownvoted {
                            self.context.customDestination = CustomDestination(destination: WAFeedback())
                        }
                    }
            }
        }
    }
    
    @ViewBuilder func versionView() -> some View {
        let versionString = String(format: "Version %d/%d".localizedFioriString(), self.context.indexOfCurrentValue + 1, self.context.rewriteTextSet.count)
        Text("\(versionString)")
            .foregroundColor(Color.preferredColor(self.isEnabled ? .tertiaryLabel : .quaternaryLabel))
            .font(.fiori(forTextStyle: .caption1))
    }
}

struct HideFeedbackFooterInWritingAssistantKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

extension EnvironmentValues {
    var hideFeedbackFooterInWritingAssistant: Bool {
        get { self[HideFeedbackFooterInWritingAssistantKey.self] }
        set { self[HideFeedbackFooterInWritingAssistantKey.self] = newValue }
    }
}

public extension View {
    /// Hide feedback section footer for writing assistant.
    /// - Parameter hide: A boolean value to indicate if hide/show the feedback footer.
    /// - Returns: A new view with hidden or shown feedback footer for writing assistant.
    func hideFeedbackFooterInWritingAssistant(_ hide: Bool = true) -> some View {
        self.environment(\.hideFeedbackFooterInWritingAssistant, hide)
    }
}
