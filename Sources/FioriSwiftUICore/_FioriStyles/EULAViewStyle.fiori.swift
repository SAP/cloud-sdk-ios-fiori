import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct EULAViewBaseStyle: EULAViewStyle {
    public func makeBody(_ configuration: EULAViewConfiguration) -> some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    configuration.title
                        .padding(.top, 30)
                        .padding(.bottom, 30)
                    
                    configuration.bodyText
                }
            }
            .padding(.top, 2)
            .padding(.leading, 32)
            .padding(.trailing, 32)
                        
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
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                self.navBarLeadingView(configuration)
            }
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
                .fioriButtonStyle(FioriPlainButtonStyle())
        }
    }
}
