import FioriThemeManager
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
public struct CardFooterBaseStyle: CardFooterStyle {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @ViewBuilder
    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        // Add default layout here
        EqualWidthWithMaxWidthHStackLayout(spacing: 8, alignment: .center, maxWidth: 170, horizontalSizeClass: self.horizontalSizeClass) {
            configuration.secondaryAction
            
            configuration.action
        }
    }
}

// Default fiori styles
extension CardFooterFioriStyle {
    struct ContentFioriStyle: CardFooterStyle {
        @Environment(\.horizontalSizeClass) var horizontalSizeClass
        
        func makeBody(_ configuration: CardFooterConfiguration) -> some View {
            CardFooter(configuration)
            // Add default style for its content
            // .background()
        }
    }
    
    struct ActionFioriStyle: ActionStyle {
        let cardFooterConfiguration: CardFooterConfiguration
        
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
                .frame(maxWidth: .infinity)
                .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity))
        }
    }
    
    struct SecondaryActionFioriStyle: SecondaryActionStyle {
        let cardFooterConfiguration: CardFooterConfiguration
        
        func makeBody(_ configuration: SecondaryActionConfiguration) -> some View {
            SecondaryAction(configuration)
                .frame(maxWidth: .infinity)
                .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .normal, maxWidth: .infinity))
        }
    }
}

#Preview("Model") {
    CardFooter(action: FioriButton(title: "Primary"), secondaryAction: FioriButton(title: "Save"))
}

#Preview("VB FioriButton") {
    CardFooter {
        FioriButton(title: "Save")
    } secondaryAction: {
        FioriButton(title: "Decline")
    }
}

#Preview("VB FioriButton") {
    CardFooter(action: {
        FioriButton(title: "Save")
    })
}

#Preview("VB Button") {
    CardFooter {
        Button {
            print("Tapped")
        } label: {
            Text("Save")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.bordered)
        
    } secondaryAction: {
        Button {
            print("Tapped")
        } label: {
            Text("Decline")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.bordered)
    }
}
