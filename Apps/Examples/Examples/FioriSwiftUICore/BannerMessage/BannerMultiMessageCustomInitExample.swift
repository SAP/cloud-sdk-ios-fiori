//
//  BannerMultiMessageExample.swift
//  Examples
//
//  Created by Zhang, Hengyi (external - Project) on 2024/8/27.
//  Copyright © 2024 SAP. All rights reserved.
//
import FioriSwiftUICore
import FioriThemeManager
import RegexBuilder
import SwiftUI

struct BannerMultiMessageCustomInitExample: View {
    @State private var showingMessageDetail: Bool = false
    @State private var pushContentDown: Bool = true
    private var withLink: Bool = false
    private var withAttachedAction: Bool = false
    private var withLongText: Bool = false
    private var alignmentRawValue = 1
    private var turnOnSectionHeader = true
    
    @State var showsErrorMessage = true
    @State var showsCharCount = true
    @State var allowsBeyondLimit = true
    @State var hidesReadonlyHint = true
    @State var showsAction = true
    
    @State var showAINotice: Bool = false
    @State var showAINoticeOnBanner: Bool = false
    @State var showBottomSheet: Bool = false
    @State var isOptionPresented: Bool = false
    @State var messageType: BannerMultiMessageType = .negative
    
    @State private var firstName: String = "Com"
    @State private var middleName: String = ""
    @State private var lastName: String = ""
    @State private var preferredName: String = ""
    @State private var partnerNamePrefix: String = ""
    @State private var gender: String = "Female"
    @State private var emailAddress: String = "Com"
    @State private var maritalStatus: String = "Married"
    @State private var maritalStatusSince: String = "Dec 1, 2005"
    @State private var nativePreferredLanguage: String = "English"
    
    // the below ids used to scroll to related items
    private var firstNameId = UUID()
    private var middleNameId = UUID()
    private var lastNameId = UUID()
    private var preferredNameId = UUID()
    private var partnerNamePrefixId = UUID()
    private var genderId = UUID()
    private var emailAddressId = UUID()
    private var maritalStatusId = UUID()
    private var maritalStatusSinceId = UUID()
    private var nativePreferredLanguageId = UUID()
    private var aiNoticeId = UUID()
    
    @State private var firstNameErrorMessage = AttributedString()
    @State private var lastNameErrorMessage = AttributedString()
    @State private var emailAddressErrorMessage = AttributedString()
    
    var customizeNoticeMsg: AttributedString {
        var msgText = AttributedString("Customized AI Notice. ")
        msgText.font = .footnote.italic()
        msgText.foregroundColor = .purple
        return msgText
    }

    var customizeNoticeActionLabel: AttributedString {
        var msgText = AttributedString(" View Details ")
        msgText.font = .footnote.bold()
        msgText.foregroundColor = .purple
        return msgText
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            List {
                Section {
                    if self.showAINotice, self.showAINoticeOnBanner {
                        BannerMessage(icon: {
                            Image(fioriName: "fiori.ai")
                        }, title: {
                            self.noticeTitleView
                        }, bannerTapAction: {
                            self.toggleShowSheet()
                        }, messageType: self.showAINotice ? .aiNotice : .negative)
                            .topDividerStyle { c in
                                c.topDivider.background(.purple)
                            }
                            .iconStyle { c in
                                c.icon.foregroundStyle(.purple)
                            }
                            .titleStyle { c in
                                c.title.foregroundStyle(.purple)
                            }
                            .closeActionStyle { c in
                                c.closeAction.foregroundStyle(.purple)
                            }
                            .padding(.horizontal, -16)
                    }
                }
                .listRowSeparator(.hidden)
                Section {
                    HStack {
                        Spacer()
                        Text("Check Result")
                        Spacer()
                    }
                    .popover(isPresented: self.$showingMessageDetail) {
                        BannerMultiMessageSheet(title: {
                            Text("CustomMessagesCount")
                        }, closeAction: {
                            FioriButton(isSelectionPersistent: false, action: { _ in
                                self.showingMessageDetail = false
                            }, image: { _ in
                                FioriIcon.tables.circleTaskFill
                            })
                            .fioriButtonStyle(FioriTertiaryButtonStyle(colorStyle: .normal))
                        }, dismissAction: {
                            self.showingMessageDetail = false
                        }, removeAction: { category, _ in
                            self.removeCategory(category: category)
                        }, turnOnSectionHeader: self.turnOnSectionHeader, messageItemView: { id in
                            if let (message, category) = getItemData(with: id) {
                                BannerMessage(icon: {
                                    (message.icon ?? EmptyView()).typeErased
                                }, title: {
                                    Text(self.attributedMessageTitle(title: message.title, typeDesc: message.typeDesc))
                                }, closeAction: {
                                    FioriButton { state in
                                        if state == .normal {
                                            self.removeItem(category: category, at: message.id)
                                        }
                                    } label: { _ in
                                        Image(fioriName: "fiori.decline")
                                    }
                                }, topDivider: {
                                    EmptyView()
                                }, bannerTapAction: {
                                    self.showingMessageDetail = false
                                    proxy.scrollTo(id)
                                }, alignment: .leading, hideSeparator: true, messageType: message.messageType)
                                    .ifApply(true, content: { v in
                                        v.iconStyle { c in
                                            c.icon.foregroundStyle(Color.yellow)
                                        }
                                        .titleStyle { c in
                                            c.title.foregroundStyle(Color.red)
                                        }
                                    })
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        Button(role: .destructive) {
                                            self.removeItem(category: category, at: message.id)
                                        } label: {
                                            Image(fioriName: "fiori.delete")
                                        }
                                    }
                            } else {
                                EmptyView()
                            }
                        }, bannerMultiMessages: self.$bannerMultiMessages)
                            .presentationDetents([.medium, .large])
                    }
                }
                .listRowSeparator(.hidden)
                .environment(\.defaultMinListRowHeight, 0)
                .environment(\.defaultMinListHeaderHeight, 0)
                
                Section {
                    Rectangle().fill(Color.preferredColor(.primaryGroupedBackground))
                        .frame(height: 15)
                        .listRowInsets(EdgeInsets())
                    
                    KeyValueItem {
                        Text("Effective Date")
                    } value: {
                        Text("\(self.currentDateStr)")
                    }
                    
                    Rectangle().fill(Color.preferredColor(.primaryGroupedBackground))
                        .frame(height: 15)
                        .listRowInsets(EdgeInsets())
                }
                .listRowSeparator(.hidden)
                .environment(\.defaultMinListRowHeight, 0)
                .environment(\.defaultMinListHeaderHeight, 0)
                
                Section {
                    TextFieldFormView(title: "First Name", text: self.$firstName, placeholder: "Placeholder", errorMessage: self.firstNameErrorMessage, maxTextLength: 20, hintText: nil, isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: true, actionIcon: nil, action: nil)
                        .id(self.firstNameId)
                        .aiNoticeView(isPresented: self.$showAINotice)
                    
                    TextFieldFormView(title: "Middle Name", text: self.$middleName, placeholder: "Placeholder", errorMessage: AttributedString(""), maxTextLength: 20, hintText: nil, isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.middleNameId)
                        .aiNoticeView(isPresented: self.$showAINotice, description: self.customizeNoticeMsg)
                    
                    TextFieldFormView(title: "Last Name", text: self.$lastName, placeholder: "Placeholder", errorMessage: self.lastNameErrorMessage, maxTextLength: 20, hintText: nil, isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: true, actionIcon: nil, action: nil)
                        .id(self.lastNameId)
                        .aiNoticeView(isPresented: self.$showAINotice, icon: Image(fioriName: "fiori.ai"), description: "AI Notice with link. ", actionLabel: self.customizeNoticeActionLabel, viewMoreAction: self.openURL)
                        .iconStyle(content: { config in
                            config.icon.foregroundStyle(Color.purple)
                        })
                    
                    TextFieldFormView(title: "Preferred Name", text: self.$preferredName, placeholder: "Placeholder", errorMessage: AttributedString(""), maxTextLength: 20, hintText: AttributedString("Starting 2025, preferred name is a required field."), isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.preferredNameId)
                        .aiNoticeView(isPresented: self.$showAINotice, icon: Image(systemName: "wand.and.sparkles"), description: "AI Notice with icon, long long long long long long message. ", actionLabel: "View more link", viewMoreAction: self.openURL)
                    
                    TextFieldFormView(title: "Partner Name Prefix", text: self.$partnerNamePrefix, placeholder: "Placeholder", errorMessage: AttributedString(""), maxTextLength: 20, hintText: nil, isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: false, actionIcon: nil, action: nil)
                        .id(self.partnerNamePrefixId)
                        .aiNoticeView(isPresented: self.$showAINotice, icon: Image(fioriName: "fiori.ai"), description: "AI Notice with icon. ", actionLabel: "View more details", viewMoreAction: self.toggleShowSheet)
                        .sheet(isPresented: self.$showBottomSheet) {
                            Text("detail information")
                                .presentationDetents([.height(250), .medium])
                                .presentationDragIndicator(.visible)
                        }
                    
                    Rectangle().fill(Color.preferredColor(.primaryGroupedBackground))
                        .frame(height: 30)
                        .listRowInsets(EdgeInsets())
                } header: {
                    Text("Name Information")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                }
                .listRowSeparator(.hidden, edges: .bottom)
                .environment(\.defaultMinListRowHeight, 0)
                .environment(\.defaultMinListHeaderHeight, 0)
                
                Section {
                    Picker(selection: self.$gender) {
                        Text("Female").tag("Female")
                        Text("Male").tag("Male")
                    } label: {
                        Text("Gender*")
                            .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                            .foregroundStyle(Color.preferredColor(.primaryLabel))
                    }
                    .pickerStyle(.navigationLink)
                    .id(self.genderId)
                    .aiNoticeView(isPresented: self.$showAINotice, description: "AI Notice")
                    
                    TextFieldFormView(title: "Email Address", text: self.$emailAddress, placeholder: "Placeholder", errorMessage: self.emailAddressErrorMessage, maxTextLength: 100, hintText: nil, isCharCountEnabled: self.showsCharCount, allowsBeyondLimit: self.allowsBeyondLimit, isRequired: true, actionIcon: nil, action: nil)
                        .listRowSeparator(.hidden, edges: .bottom)
                        .id(self.emailAddressId)
                        .aiNoticeView(isPresented: self.$showAINotice, icon: Image(fioriName: "fiori.ai"), description: "AI Notice with icon. ", actionLabel: "View more details", viewMoreAction: self.toggleShowSheet)
                        .sheet(isPresented: self.$showBottomSheet) {
                            Text("detail information")
                                .font(.fiori(forTextStyle: .footnote, weight: .semibold))
                                .foregroundStyle(Color.preferredColor(.tintColor))
                                .presentationDetents([.height(250), .medium])
                                .presentationDragIndicator(.visible)
                        }
                    
                    Picker(selection: self.$maritalStatus) {
                        Text("Married").tag("Married")
                        Text("Single").tag("Single")
                    } label: {
                        Text("Marital Status*")
                            .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                            .foregroundStyle(Color.preferredColor(.primaryLabel))
                    }
                    .pickerStyle(.navigationLink)
                    .id(self.maritalStatusId)
                    .aiNoticeView(isPresented: self.$showAINotice, description: self.customizeNoticeMsg)
                    
                    KeyValueItem {
                        Text("Marital Status Since*")
                    } value: {
                        Text(self.maritalStatusSince)
                    }
                    .id(self.maritalStatusSinceId)
                    .aiNoticeView(isPresented: self.$showAINotice, description: self.customizeNoticeMsg)
                    
                    Picker(selection: self.$nativePreferredLanguage) {
                        Text("English").tag("English")
                    } label: {
                        Text("Native Preferred Language")
                            .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
                            .foregroundStyle(Color.preferredColor(.primaryLabel))
                    }
                    .pickerStyle(.navigationLink)
                    .id(self.nativePreferredLanguageId)
                    
                    Rectangle().fill(Color.preferredColor(.primaryGroupedBackground))
                        .frame(height: 30)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                } header: {
                    Text("Additional Information")
                        .font(.fiori(forTextStyle: .subheadline))
                        .foregroundStyle(Color.preferredColor(.secondaryLabel))
                }
                .environment(\.defaultMinListRowHeight, 0)
                .environment(\.defaultMinListHeaderHeight, 0)
            }
            .listStyle(.inset)
            .listSectionSeparator(.hidden)
            .navigationTitle("Edit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button(NSLocalizedString("Save", comment: "")) {
                            self.validateUploadData()
                        }
                        .padding(.trailing, 16)
                        Button(NSLocalizedString("Options", comment: "")) {
                            self.isOptionPresented = true
                        }
                    }
                }
            }
            .onChange(of: self.firstName) {
                self.validateUploadData()
            }
            .onChange(of: self.lastName) {
                self.validateUploadData()
            }
            .onChange(of: self.emailAddress) {
                self.validateUploadData()
            }
            .sheet(isPresented: self.$isOptionPresented, content: {
                VStack {
                    Toggle("Show AI Notice", isOn: self.$showAINotice)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    Toggle("Show AI Notice on Banner", isOn: self.$showAINoticeOnBanner)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                }
                .padding()
                .presentationDetents([.medium])
            })
        }
    }
    
    func removeItem(category: String, at id: UUID?) {
        for i in 0 ..< self.bannerMultiMessages.count {
            let item = self.bannerMultiMessages[i]
            if item.category == category {
                if let id {
                    var messages = self.bannerMultiMessages[i].items
                    for index in 0 ..< messages.count where messages[index].id == id {
                        messages.remove(at: index)
                        break
                    }
                    self.bannerMultiMessages[i].items = messages
                    
                    if messages.isEmpty {
                        self.removeCategory(category: category)
                    }
                } else {
                    self.removeCategory(category: category)
                }
                break
            }
        }
    }
    
    func removeCategory(category: String) {
        for i in 0 ..< self.bannerMultiMessages.count {
            let item = self.bannerMultiMessages[i]
            if item.category == category {
                self.bannerMultiMessages.remove(at: i)
                break
            }
        }
    }
    
    func getItemData(with id: UUID) -> (BannerMessageItemModel, String)? {
        for element in self.bannerMultiMessages {
            for item in element.items {
                if item.id == id {
                    return (item, element.category)
                }
            }
        }
        return nil
    }

    private func attributedMessageTitle(title: String, typeDesc: String) -> AttributedString {
        let attributedString = NSMutableAttributedString(string: title)
        
        let viewDetail = NSAttributedString(string: " View \(typeDesc)", attributes: [.foregroundColor: UIColor(Color.preferredColor(.tintColor))])
        attributedString.append(viewDetail)
        return AttributedString(attributedString)
    }
    
    var currentDateStr: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, YYYY"
        return formatter.string(from: Date())
    }
    
    @State var bannerMultiMessages: [BannerMessageListModel] = []
    
    private var alignment: HorizontalAlignment {
        switch self.alignmentRawValue {
        case 0:
            return .leading
        case 1:
            return .center
        default:
            return .trailing
        }
    }
    
    func validateUploadData() {
        var errorMessages: [BannerMessageItemModel] = []
        
        var warningMessages: [BannerMessageItemModel] = []
        
        var informationMessages: [BannerMessageItemModel] = []
        
        if self.firstName.isEmpty {
            let tips = "First name is required."
            self.firstNameErrorMessage = AttributedString(tips)
            warningMessages.append(BannerMessageItemModel(id: self.firstNameId, icon: Image(fioriName: "fiori.warning2"), title: tips, messageType: .critical))
        } else if self.firstName.count > 20 {
            let tips = "First name is too long."
            self.firstNameErrorMessage = AttributedString(tips)
            errorMessages.append(BannerMessageItemModel(id: self.firstNameId, icon: Image(fioriName: "fiori.notification.3"), title: tips, messageType: .negative))
        } else {
            let tips = "First name correct."
            self.firstNameErrorMessage = AttributedString()
            informationMessages.append(BannerMessageItemModel(id: self.firstNameId, icon: EmptyView(), title: tips, messageType: .positive))
            
            informationMessages.append(BannerMessageItemModel(id: UUID(), icon: EmptyView(), title: tips, messageType: .positive))
        }
        
        if self.lastName.isEmpty {
            let tips = "Last name is required."
            self.lastNameErrorMessage = AttributedString(tips)
            warningMessages.append(BannerMessageItemModel(id: self.lastNameId, icon: Image(fioriName: "fiori.warning2"), title: tips, messageType: .critical))
        } else if self.lastName.count > 20 {
            let tips = "Last name is too long."
            self.lastNameErrorMessage = AttributedString(tips)
            errorMessages.append(BannerMessageItemModel(id: self.lastNameId, icon: Image(fioriName: "fiori.notification.3"), title: tips, messageType: .negative))
        } else {
            let tips = "Last name correct."
            self.lastNameErrorMessage = AttributedString()
            informationMessages.append(BannerMessageItemModel(id: self.lastNameId, icon: Image(fioriName: "fiori.hint"), title: tips, messageType: .positive))
        }
        
        if self.emailAddress.isEmpty {
            let tips = "Email address is required!"
            self.emailAddressErrorMessage = AttributedString(tips)
            warningMessages.append(BannerMessageItemModel(id: self.emailAddressId, icon: Image(fioriName: "fiori.warning2"), title: tips, messageType: .critical))
        } else if self.isEmailInvalid {
            let tips = "Email address is Invalid! This can be multiple lines. This can be multiple lines. This can be multiple lines. This can be multiple lines. This can be multiple lines. This can be multiple lines. This can be multiple lines. This can be multiple lines."
            self.emailAddressErrorMessage = AttributedString(tips)
            errorMessages.append(BannerMessageItemModel(id: self.emailAddressId, icon: Image(fioriName: "fiori.notification.3"), title: tips, messageType: .negative))
        } else {
            let tips = "Email address correct."
            self.emailAddressErrorMessage = AttributedString()
            informationMessages.append(BannerMessageItemModel(id: self.emailAddressId, icon: Image(fioriName: "fiori.hint"), title: tips, messageType: .positive))
        }
        
        if self.showAINotice {
            informationMessages.append(BannerMessageItemModel(id: self.aiNoticeId, icon: Image(fioriName: "fiori.ai"), title: "Powered by AI.", messageType: .aiNotice, showDetailLink: false, showCloseAction: false))
        }
        
        var result: [BannerMessageListModel] = []
        if !errorMessages.isEmpty {
            result.append(BannerMessageListModel(category: "Errors", items: errorMessages))
        }
        if !warningMessages.isEmpty {
            result.append(BannerMessageListModel(category: "Warnings", items: warningMessages))
        }
        if !informationMessages.isEmpty {
            result.append(BannerMessageListModel(category: "Information", items: informationMessages))
        }
        
        self.bannerMultiMessages = result
        
        self.showingMessageDetail = !self.bannerMultiMessages.isEmpty
    }
    
    var isEmailInvalid: Bool {
        let emailRegex = Regex {
            OneOrMore(.word)
            "@"
            ChoiceOf {
                "sap"
                "gmail"
            }
            ".com"
        }
        if let _ = emailAddress.wholeMatch(of: emailRegex)?.output {
            return false
        }
        return true
    }
    
    var noticeTitleView: some View {
        Text("Supported by AI. ")
            .foregroundStyle(.purple)
            .font(Font.fiori(forTextStyle: .footnote))
            +
            Text("View more")
            .foregroundStyle(.blue)
            .font(Font.fiori(forTextStyle: .footnote))
    }
    
    func openURL() {
        let url = URL(string: "https://sap.com")!
        UIApplication.shared.open(url)
    }
    
    func toggleShowSheet() {
        self.showBottomSheet.toggle()
    }
}

#Preview {
    BannerMultiMessageExample()
}
