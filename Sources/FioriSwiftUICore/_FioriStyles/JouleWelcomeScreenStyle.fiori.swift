import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct JouleWelcomeScreenBaseStyle: JouleWelcomeScreenStyle {
    public func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
        // Add default layout here
        VStack(spacing: 0) {
            VStack(spacing: 16) {
                configuration.mediaImage
                
                VStack(alignment: .leading, spacing: 0) {
                    configuration.greetingText
                    configuration.title
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding([.top], 8)
            .padding([.bottom], 16)
            .padding([.leading, .trailing])
            .background(Color.preferredColor(.jouleBrand))
            
            configuration.messageContent
            
            Spacer()
            configuration.footnote
        }
    }
}

// Default fiori styles
extension JouleWelcomeScreenFioriStyle {
    struct ContentFioriStyle: JouleWelcomeScreenStyle {
        func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
            JouleWelcomeScreen(configuration)
                // Add default style for its content
                .background(Color.preferredColor(.primaryBackground))
        }
    }
    
    struct MediaImageFioriStyle: MediaImageStyle {
        let jouleWelcomeScreenConfiguration: JouleWelcomeScreenConfiguration
        
        func makeBody(_ configuration: MediaImageConfiguration) -> some View {
            MediaImage(configuration)
                // Add default style for MediaImage
                .aspectRatio(contentMode: .fit)
                .frame(height: 48)
        }
    }
    
    struct GreetingTextFioriStyle: GreetingTextStyle {
        let jouleWelcomeScreenConfiguration: JouleWelcomeScreenConfiguration
        
        func makeBody(_ configuration: GreetingTextConfiguration) -> some View {
            GreetingText(configuration)
            // Add default style for GreetingText
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let jouleWelcomeScreenConfiguration: JouleWelcomeScreenConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .foregroundStyle(Color.preferredColor(.baseWhite))
                .font(.fiori(forTextStyle: .largeTitle))
                .lineLimit(2)
        }
    }
    
    struct FootnoteFioriStyle: FootnoteStyle {
        let jouleWelcomeScreenConfiguration: JouleWelcomeScreenConfiguration
        
        func makeBody(_ configuration: FootnoteConfiguration) -> some View {
            Footnote(configuration)
                // Add default style for Footnote
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .caption1))
        }
    }
    
    struct MessageContentFioriStyle: MessageContentStyle {
        let jouleWelcomeScreenConfiguration: JouleWelcomeScreenConfiguration
        
        func makeBody(_ configuration: MessageContentConfiguration) -> some View {
            MessageContent(configuration)
            // Add default style for MessageContent
        }
    }
}

// Default nss styles
extension JouleWelcomeScreenNSSStyle {
    struct ContentNSSStyle: JouleWelcomeScreenStyle {
        let jouleWelcomeScreenConfiguration: JouleWelcomeScreenConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: JouleWelcomeScreenConfiguration) -> some View {
            JouleWelcomeScreen(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct MediaImageNSSStyle: MediaImageStyle {
        let jouleWelcomeScreenConfiguration: JouleWelcomeScreenConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: MediaImageConfiguration) -> some View {
            MediaImage(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for MediaImage
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct GreetingTextNSSStyle: GreetingTextStyle {
        let jouleWelcomeScreenConfiguration: JouleWelcomeScreenConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: GreetingTextConfiguration) -> some View {
            GreetingText(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for GreetingText
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct TitleNSSStyle: TitleStyle {
        let jouleWelcomeScreenConfiguration: JouleWelcomeScreenConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Title
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct FootnoteNSSStyle: FootnoteStyle {
        let jouleWelcomeScreenConfiguration: JouleWelcomeScreenConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: FootnoteConfiguration) -> some View {
            Footnote(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for Footnote
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct MessageContentNSSStyle: MessageContentStyle {
        let jouleWelcomeScreenConfiguration: JouleWelcomeScreenConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: MessageContentConfiguration) -> some View {
            MessageContent(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for MessageContent
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}

#Preview(body: {
    JouleWelcomeScreen(mediaImage: {
        Image(systemName: "calendar")
            .resizable()
    }, greetingText: {
        Text("Hello,")
    }, title: {
        Text("How can I help|guide|assist you?")
    }, footnote: {
        Text("Powered by SAP Business AI")
    }, messageContent: {
        VStack {
            ForEach(0 ..< 10) { index in
                Label {
                    Text("Row \(index)")
                } icon: {}
            }
        }
    })
})
