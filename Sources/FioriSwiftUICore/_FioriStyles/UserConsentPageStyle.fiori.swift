import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct UserConsentPageBaseStyle: UserConsentPageStyle {
    public func makeBody(_ configuration: UserConsentPageConfiguration) -> some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                configuration.title
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                
                configuration.bodyText

                configuration.action
                    .padding(.top, 30)
            }
        }
        .padding(.top, 2)
        .padding(.leading, 32)
        .padding(.trailing, 32)
        .navigationBarBackButtonHidden(true)
    }
}

// Default fiori styles
extension UserConsentPageFioriStyle {
    struct ContentFioriStyle: UserConsentPageStyle {
        func makeBody(_ configuration: UserConsentPageConfiguration) -> some View {
            UserConsentPage(configuration)
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let userConsentPageConfiguration: UserConsentPageConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .title1).weight(.bold))
                .foregroundColor(.preferredColor(.primaryLabel))
                .multilineTextAlignment(.center)
        }
    }
    
    struct BodyTextFioriStyle: BodyTextStyle {
        let userConsentPageConfiguration: UserConsentPageConfiguration
        
        func makeBody(_ configuration: BodyTextConfiguration) -> some View {
            BodyText(configuration)
                .font(.fiori(forTextStyle: .body))
                .foregroundColor(.preferredColor(.primaryLabel))
                .multilineTextAlignment(.center)
        }
    }
    
    struct ActionFioriStyle: ActionStyle {
        let userConsentPageConfiguration: UserConsentPageConfiguration
        
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(.preferredColor(.tintColor))
        }
    }
}
