import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// Base Layout style
public struct ProcessingIndicatorBaseStyle: ProcessingIndicatorStyle {
    struct ProcessingIndicatorStyle: ProgressIndicatorStyle {
        func makeBody(_ configuration: ProgressIndicatorConfiguration) -> some View {
            ProgressIndicator(configuration)
                .frame(width: 56, height: 56)
        }
    }
    
    public func makeBody(_ configuration: ProcessingIndicatorConfiguration) -> some View {
        VStack {
            ProgressIndicator(progress: Binding<Double>.constant(0.0))
                .progressIndicatorStyle(ProcessingIndicatorStyle())
                .progressIndicatorStyle(.processing)
            if !configuration.optionalTitle.isEmpty {
                configuration.optionalTitle
                    .offset(y: 15)
            }
        }.padding()
    }
}

// Default fiori styles
extension ProcessingIndicatorFioriStyle {
    struct ContentFioriStyle: ProcessingIndicatorStyle {
        func makeBody(_ configuration: ProcessingIndicatorConfiguration) -> some View {
            ProcessingIndicator(configuration)
        }
    }

    struct OptionalTitleFioriStyle: OptionalTitleStyle {
        let processingIndicatorConfiguration: ProcessingIndicatorConfiguration

        func makeBody(_ configuration: OptionalTitleConfiguration) -> some View {
            OptionalTitle(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(fixedSize: 12))
        }
    }
}

// Default nss styles
extension ProcessingIndicatorNSSStyle {
    struct ContentNSSStyle: ProcessingIndicatorStyle {
        let processingIndicatorConfiguration: ProcessingIndicatorConfiguration
        let nssData: NSSStyleData
        func makeBody(_ configuration: ProcessingIndicatorConfiguration) -> some View {
            ProcessingIndicator(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for its content
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }

    struct OptionalTitleNSSStyle: OptionalTitleStyle {
        let processingIndicatorConfiguration: ProcessingIndicatorConfiguration
        let nssData: NSSStyleData

        func makeBody(_ configuration: OptionalTitleConfiguration) -> some View {
            OptionalTitle(configuration)
                .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.nssData))
            // Add custom nss style for OptionalTitle
            // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
        }
    }
}
