import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.

 1. Uncomment the following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct UpVoteActionBaseStyle: UpVoteActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: UpVoteActionConfiguration) -> some View {
        // Add default layout here
        configuration.upVoteAction
    }
}

// Default fiori styles
public struct UpVoteActionFioriStyle: UpVoteActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: UpVoteActionConfiguration) -> some View {
        UpVoteAction(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

/// The style determines whether up vote button is selected.
public struct UpVoteButtonSelectedStyle: UpVoteActionStyle {
    public var isSelected: Bool
    
    public func makeBody(_ configuration: UpVoteActionConfiguration) -> some View {
        FioriButton { _ in
            
        } label: { _ in
            self.isSelected ? FioriIcon.actions.thumbUpFill : FioriIcon.actions.thumbUp
        }
    }
}

/// The style determines whether up vote button is selected.
public extension UpVoteActionStyle where Self == UpVoteButtonSelectedStyle {
    /// Set button is selected.
    /// - Parameter isSelected: Indicates if the button is selected.
    /// - Returns: UpVoteButtonSelectedStyle
    static func isSelected(isSelected: Bool) -> UpVoteButtonSelectedStyle {
        UpVoteButtonSelectedStyle(isSelected: isSelected)
    }
}
