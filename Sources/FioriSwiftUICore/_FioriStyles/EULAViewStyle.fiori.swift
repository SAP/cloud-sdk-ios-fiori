import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct EULAViewBaseStyle: EULAViewStyle {
    public func makeBody(_ configuration: EULAViewConfiguration) -> some View {
        Group {
            if #available(iOS 26, *) {
                containerView(configuration)
            } else {
                self.legacyContainerView(configuration)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                self.navBarLeadingView(configuration)
                    .fixedSize()
            }
        }
    }
    
    func containerView(_ configuration: EULAViewConfiguration) -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                configuration.title
                    .padding(.vertical, 30)
                configuration.bodyText
            }
            .padding(.horizontal, 32)
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                configuration.disagreeAction
                    .fixedSize()
                    .onSimultaneousTapGesture {
                        configuration.didDisagree?()
                    }
                Spacer()
                configuration.agreeAction
                    .fixedSize()
                    .onSimultaneousTapGesture {
                        configuration.didAgree?()
                    }
            }
        }
    }
    
    func legacyContainerView(_ configuration: EULAViewConfiguration) -> some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    configuration.title
                        .padding(.vertical, 30)
                    configuration.bodyText
                }
            }
            .padding(.top, 2)
            .padding(.horizontal, 32)
                        
            HStack {
                configuration.disagreeAction
                    .onSimultaneousTapGesture {
                        configuration.didDisagree?()
                    }
                
                Spacer()
                
                configuration.agreeAction
                    .onSimultaneousTapGesture {
                        configuration.didAgree?()
                    }
            }
            .padding()
        }
    }
    
    @ViewBuilder
    private func navBarLeadingView(_ configuration: EULAViewConfiguration) -> some View {
        configuration.cancelAction
            .onSimultaneousTapGesture {
                configuration.didCancel?()
            }
    }
}

// Default fiori styles
extension EULAViewFioriStyle {
    struct ContentFioriStyle: EULAViewStyle {
        func makeBody(_ configuration: EULAViewConfiguration) -> some View {
            EULAView(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let eULAViewConfiguration: EULAViewConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .title1).weight(.bold))
                .foregroundColor(.preferredColor(.primaryLabel))
                .multilineTextAlignment(.center)
        }
    }

    struct BodyTextFioriStyle: BodyTextStyle {
        let eULAViewConfiguration: EULAViewConfiguration

        func makeBody(_ configuration: BodyTextConfiguration) -> some View {
            BodyText(configuration)
                .font(.fiori(forTextStyle: .body))
                .foregroundColor(.preferredColor(.primaryLabel))
        }
    }

    struct AgreeActionFioriStyle: AgreeActionStyle {
        let eULAViewConfiguration: EULAViewConfiguration

        func makeBody(_ configuration: AgreeActionConfiguration) -> some View {
            AgreeAction(configuration)
                .fioriButtonStyle(FioriPlainButtonStyle())
        }
    }

    struct DisagreeActionFioriStyle: DisagreeActionStyle {
        let eULAViewConfiguration: EULAViewConfiguration

        func makeBody(_ configuration: DisagreeActionConfiguration) -> some View {
            DisagreeAction(configuration)
                .fioriButtonStyle(FioriPlainButtonStyle())
        }
    }

    struct CancelActionFioriStyle: CancelActionStyle {
        let eULAViewConfiguration: EULAViewConfiguration

        func makeBody(_ configuration: CancelActionConfiguration) -> some View {
            CancelAction(configuration)
                .fioriButtonStyle(FioriNavigationButtonStyle())
        }
    }
}
