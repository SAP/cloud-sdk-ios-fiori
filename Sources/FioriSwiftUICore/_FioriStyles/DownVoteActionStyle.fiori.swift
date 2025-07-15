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
public struct DownVoteActionBaseStyle: DownVoteActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DownVoteActionConfiguration) -> some View {
        // Add default layout here
        FioriButton { _ in
            
        } label: { state in
            state == .selected ? FioriIcon.actions.thumbDownFill : FioriIcon.actions.thumbDown
        }
    }
}

// Default fiori styles
public struct DownVoteActionFioriStyle: DownVoteActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DownVoteActionConfiguration) -> some View {
        DownVoteAction(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

/// The style determines whether down vote button is selected.
public struct DownVoteButtonSelectedStyle: DownVoteActionStyle {
    public var isSelected: Bool
    
    public func makeBody(_ configuration: DownVoteActionConfiguration) -> some View {
        FioriButton { _ in
            
        } label: { _ in
            self.isSelected ? FioriIcon.actions.thumbDownFill : FioriIcon.actions.thumbDown
        }
    }
}

/// The style determines whether down vote button is selected.
public extension DownVoteActionStyle where Self == DownVoteButtonSelectedStyle {
    /// Set button is selected.
    /// - Parameter isSelected: Indicates if the button is selected.
    /// - Returns: DownVoteButtonSelectedStyle
    static func isSelected(isSelected: Bool) -> DownVoteButtonSelectedStyle {
        DownVoteButtonSelectedStyle(isSelected: isSelected)
    }
}
