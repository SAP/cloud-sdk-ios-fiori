import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct UserConsentFormBaseStyle: UserConsentFormStyle {
    @State var showAlert: (Bool, UserConsentAlertType) = (false, .deny)
    @State var pageIndex = 0
    @Environment(\.userConsentFormDidCancel) var userConsentFormDidCancel
    @Environment(\.userConsentFormDidDeny) var userConsentFormDidDeny
    @Environment(\.userConsentFormDidAllow) var userConsentFormDidAllow
    
    public func makeBody(_ configuration: UserConsentFormConfiguration) -> some View {
        self.makeContent(configuration)
    }
    
    @ViewBuilder
    func makeContent(_ configuration: UserConsentFormConfiguration) -> some View {
        configuration.userConsentPages.view(at: self.pageIndex).typeErased
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    self.navBarLeadingView(configuration)
                        .fixedSize()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    self.navBarTrailingView(configuration)
                        .fixedSize()
                }
                self.toolBar(configuration)
            }
            .navigationTitle(self.navTitle(configuration))
            .alert(configuration: self.alertConfiguration(configuration), isPresented: self.$showAlert.0)
    }
    
    @ToolbarContentBuilder
    private func toolBar(_ configuration: UserConsentFormConfiguration) -> some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            if self.pageIndex == configuration.userConsentPages.count - 1 {
                if configuration.isRequired {
                    configuration.denyAction
                        .fixedSize()
                        .onSimultaneousTapGesture {
                            if configuration.alertConfiguration?(.deny) != nil {
                                self.showAlert = (true, .deny)
                            } else {
                                self.didDeny(configuration)?(configuration.isRequired)
                            }
                        }
                } else {
                    configuration.notNowAction
                        .fixedSize()
                        .onSimultaneousTapGesture {
                            self.didDeny(configuration)?(configuration.isRequired)
                        }
                }
                
                Spacer()
                
                configuration.allowAction
                    .fixedSize()
                    .onSimultaneousTapGesture {
                        self.didAllow(configuration)?()
                    }
            }
        }
    }
    
    private func navTitle(_ configuration: UserConsentFormConfiguration) -> String {
        if configuration.userConsentPages.count > 1 {
            return "\(NSLocalizedString("Step", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")) \(self.pageIndex + 1) \(NSLocalizedString("of", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")) \(configuration.userConsentPages.count)"
        } else {
            return ""
        }
    }
    
    @ViewBuilder
    private func navBarLeadingView(_ configuration: UserConsentFormConfiguration) -> some View {
        switch self.pageIndex {
        case 0:
            configuration.cancelAction
                .onSimultaneousTapGesture {
                    if configuration.alertConfiguration?(.cancel) != nil {
                        self.showAlert = (true, .cancel)
                    } else {
                        configuration.didCancel?()
                    }
                }
        default:
            Button(NSLocalizedString("Back", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: ""), action: {
                self.pageIndex -= 1
            })
        }
    }
    
    @ViewBuilder
    private func navBarTrailingView(_ configuration: UserConsentFormConfiguration) -> some View {
        switch self.pageIndex {
        case configuration.userConsentPages.count - 1:
            EmptyView()
        default:
            configuration.nextAction
                .onSimultaneousTapGesture {
                    self.pageIndex += 1
                }
        }
    }
    
    func alertConfiguration(_ configuration: UserConsentFormConfiguration) -> AlertConfiguration {
        guard let alertConfig = configuration.alertConfiguration?(self.showAlert.1) else {
            fatalError("UserConsentForm: alert configuration cannot be nil")
        }
        
        var newAlertConfig = alertConfig
        
        switch self.showAlert.1 {
        case .deny:
            newAlertConfig.action._didSelectSetter {
                self.didAllow(configuration)?()
                alertConfig.action.didSelect?()
            }
            newAlertConfig.secondaryAction._didSelectSetter {
                self.didDeny(configuration)?(configuration.isRequired)
                alertConfig.secondaryAction.didSelect?()
            }
        case .cancel:
            newAlertConfig.secondaryAction._didSelectSetter {
                self.didCancel(configuration)?()
                alertConfig.secondaryAction.didSelect?()
            }
        }
        
        return newAlertConfig
    }
    
    func didAllow(_ configuration: UserConsentFormConfiguration) -> (() -> Void)? {
        if self.userConsentFormDidAllow == nil, configuration.didAllow == nil {
            return nil
        }
        
        return {
            configuration.didAllow?()
            self.userConsentFormDidAllow?()
        }
    }
    
    func didDeny(_ configuration: UserConsentFormConfiguration) -> ((Bool) -> Void)? {
        if self.userConsentFormDidDeny == nil, configuration.didDeny == nil {
            return nil
        }
        return {
            configuration.didDeny?($0)
            self.userConsentFormDidDeny?($0)
        }
    }
    
    func didCancel(_ configuration: UserConsentFormConfiguration) -> (() -> Void)? {
        if self.userConsentFormDidCancel == nil, configuration.didCancel == nil {
            return nil
        }
        
        return {
            configuration.didCancel?()
            self.userConsentFormDidCancel?()
        }
    }
}

// Default fiori styles
extension UserConsentFormFioriStyle {
    struct ContentFioriStyle: UserConsentFormStyle {
        func makeBody(_ configuration: UserConsentFormConfiguration) -> some View {
            UserConsentForm(configuration)
        }
    }
    
    struct NextActionFioriStyle: NextActionStyle {
        let userConsentFormConfiguration: UserConsentFormConfiguration
        
        func makeBody(_ configuration: NextActionConfiguration) -> some View {
            NextAction(configuration)
                .fioriButtonStyle(FioriNavigationButtonStyle())
        }
    }
    
    struct CancelActionFioriStyle: CancelActionStyle {
        let userConsentFormConfiguration: UserConsentFormConfiguration
        
        func makeBody(_ configuration: CancelActionConfiguration) -> some View {
            CancelAction(configuration)
                .fioriButtonStyle(FioriNavigationButtonStyle())
        }
    }
    
    struct AllowActionFioriStyle: AllowActionStyle {
        let userConsentFormConfiguration: UserConsentFormConfiguration
        
        func makeBody(_ configuration: AllowActionConfiguration) -> some View {
            AllowAction(configuration)
                .fioriButtonStyle(FioriPlainButtonStyle())
        }
    }
    
    struct DenyActionFioriStyle: DenyActionStyle {
        let userConsentFormConfiguration: UserConsentFormConfiguration
        
        func makeBody(_ configuration: DenyActionConfiguration) -> some View {
            DenyAction(configuration)
                .fioriButtonStyle(FioriPlainButtonStyle())
        }
    }
    
    struct NotNowActionFioriStyle: NotNowActionStyle {
        let userConsentFormConfiguration: UserConsentFormConfiguration
        
        func makeBody(_ configuration: NotNowActionConfiguration) -> some View {
            NotNowAction(configuration)
                .fioriButtonStyle(FioriPlainButtonStyle())
        }
    }
}
