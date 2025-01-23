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
