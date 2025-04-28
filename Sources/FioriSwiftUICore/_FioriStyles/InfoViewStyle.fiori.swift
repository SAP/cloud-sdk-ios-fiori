import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct InfoViewBaseStyle: InfoViewStyle {
    public func makeBody(_ configuration: InfoViewConfiguration) -> some View {
        ZStack {
            VStack {
                ScrollView(.vertical) {
                    VStack {
                        configuration.title
                            .padding(.top, 16)
                        configuration.descriptionText
                            .padding(.top, 16)
                            .padding(.bottom, 250)
                        configuration.action
                        configuration.secondaryAction
                            .padding(.top, 16)
                            .padding(.bottom, 300)
                    }
                }
                .padding(.top, 2)
                .padding(.bottom, 2)
                .padding(.leading, 32)
                .padding(.trailing, 32)
                .scrollIndicators(.hidden)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            configuration.loadingIndicator
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

// Default fiori styles
extension InfoViewFioriStyle {
    struct ContentFioriStyle: InfoViewStyle {
        func makeBody(_ configuration: InfoViewConfiguration) -> some View {
            InfoView(configuration)
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let infoViewConfiguration: InfoViewConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            #if !os(visionOS)
                Title(configuration)
                    .font(.fiori(forTextStyle: .title1).weight(.bold))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .multilineTextAlignment(.center)
            #else
                Title(configuration)
                    .font(.fiori(forTextStyle: .extraLargeTitle2))
                    .multilineTextAlignment(.center)
            #endif
        }
    }
    
    struct DescriptionTextFioriStyle: DescriptionTextStyle {
        let infoViewConfiguration: InfoViewConfiguration
        
        func makeBody(_ configuration: DescriptionTextConfiguration) -> some View {
            #if !os(visionOS)
                DescriptionText(configuration)
                    .font(.fiori(forTextStyle: .body))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .multilineTextAlignment(.center)
            #else
                DescriptionText(configuration)
                    .font(.fiori(forTextStyle: .body))
                    .multilineTextAlignment(.center)
            #endif
        }
    }
    
    struct ActionFioriStyle: ActionStyle {
        let infoViewConfiguration: InfoViewConfiguration
        
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
        }
    }
    
    struct SecondaryActionFioriStyle: SecondaryActionStyle {
        let infoViewConfiguration: InfoViewConfiguration
        
        func makeBody(_ configuration: SecondaryActionConfiguration) -> some View {
            SecondaryAction(configuration)
                .fioriButtonStyle(FioriPlainButtonStyle())
        }
    }
}
