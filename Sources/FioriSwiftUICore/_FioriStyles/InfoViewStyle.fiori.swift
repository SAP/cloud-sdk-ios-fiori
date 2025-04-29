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
                        #if os(visionOS)
                            .padding(.bottom, -16)
                        #endif
                        configuration.descriptionText
                            .padding(.top, 16)
                        #if !os(visionOS)
                            .padding(.bottom, 250)
                        #else
                            .padding(.bottom, 16)
                        #endif
                        configuration.action
                        #if os(visionOS)
                            .padding(.bottom, 16)
                        #endif
                        configuration.secondaryAction
                    }
                }
                .padding(.top, 2)
                .padding(.bottom, 2)
                .padding(.leading, getInfoViewLeftPadding())
                .padding(.trailing, getInfoViewLeftPadding())
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
            #if !os(visionOS)
                Action(configuration)
                    .frame(minWidth: 201, minHeight: 44)
                    .padding(EdgeInsets(top: 9, leading: 16, bottom: 9, trailing: 16))
                    .font(.fiori(forTextStyle: .body))
            #else
                Action(configuration)
                    .frame(minWidth: 280, minHeight: 52)
                    .clipShape(Capsule())
            #endif
        }
    }
    
    struct SecondaryActionFioriStyle: SecondaryActionStyle {
        let infoViewConfiguration: InfoViewConfiguration
        
        func makeBody(_ configuration: SecondaryActionConfiguration) -> some View {
            #if !os(visionOS)
                SecondaryAction(configuration)
                    .fioriButtonStyle(FioriPlainButtonStyle())
                    .frame(minWidth: 201, minHeight: 44)
                    .padding(EdgeInsets(top: 9, leading: 16, bottom: 9, trailing: 16))
                    .font(.fiori(forTextStyle: .body))
            #else
                SecondaryAction(configuration)
                    .fioriButtonStyle(FioriPlainButtonStyle())
                    .frame(minWidth: 280, minHeight: 52)
                    .clipShape(Capsule())
            #endif
        }
    }
}

func getInfoViewLeftPadding() -> CGFloat {
    var margin: CGFloat = 35
    #if !os(visionOS)
        if UIDevice.current.userInterfaceIdiom == .pad {
            if UIDevice.current.orientation.isPortrait {
                margin = 157
            } else {
                margin = 296
            }
        }
    #else
        margin = 40
        return margin
    #endif
    return margin
}
