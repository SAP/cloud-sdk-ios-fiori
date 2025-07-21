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
            ToolbarItem(placement: .topBarLeading) {
                self.topLeadingButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                self.topTrailingButton()
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
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .alert("Discard all changes?", isPresented: self.$context.showCancelAlert, actions: {
            Button(role: .cancel) {
                self.context.showCancelAlert = false
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
        } else {
            NavigationLink {
                InternalWAForm(configuration: self.configuration, menus: [item.children], isTopLevel: false, navigationBarTitleString: item.title)
            } label: {
                Text(item.title)
                    .foregroundStyle(Color.preferredColor(self.isEnabled ? .primaryLabel : .quaternaryLabel))
                    .font(Font.fiori(forTextStyle: .body))
            }
        }
    }
    
    @ViewBuilder func sectionHeader() -> some View {
        HStack(spacing: 8) {
            self.configuration.undoAction
                .onSimultaneousTapGesture {
                    self.context.revertToPreviousValue()
                }
                .disabled(!self.context.revertIsEnabled)
            
            self.configuration.redoAction
                .onSimultaneousTapGesture {
                    self.context.forwardToNextValue()
                }
                .disabled(!self.context.forwardIsEnabled)
        }
    }
    
    @ViewBuilder func sectionFooter() -> some View {
        if self.context.feedbackHandler != nil {
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
