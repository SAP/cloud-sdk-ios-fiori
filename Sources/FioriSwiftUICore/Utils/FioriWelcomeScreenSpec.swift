import Foundation
import SwiftUI

// This is for internal usage
/// :nodoc:
protocol FioriWelcomeScreenSpec {
    var leftPadding: CGFloat { get }
    var rightPadding: CGFloat { get }

    var headlineImageTopPadding: CGFloat { get }
    var headlineLabelTopPadding: CGFloat { get }
    var detailLabelTopPadding: CGFloat { get }

    var tryDemoTopPadding: CGFloat { get }
    var logoTopPadding: CGFloat { get }
    var logoBottomPadding: CGFloat { get }
}

class FioriWelcomeScreenSpec_Small: FioriWelcomeScreenSpec {
    var leftPadding: CGFloat { 16 }
    var rightPadding: CGFloat { self.leftPadding }
    
    var headlineImageTopPadding: CGFloat { 8 }
    var headlineLabelTopPadding: CGFloat { 0 }
    var detailLabelTopPadding: CGFloat { 12.0 }
    
    var tryDemoTopPadding: CGFloat { 8 }
    var logoTopPadding: CGFloat { 8 }
    var logoBottomPadding: CGFloat { 8 }
}

class FioriWelcomeScreenSpec_Medium: FioriWelcomeScreenSpec {
    var leftPadding: CGFloat { 16.0 }
    var rightPadding: CGFloat { self.leftPadding }
    
    var headlineImageTopPadding: CGFloat { 42 }
    var headlineLabelTopPadding: CGFloat { 14 }
    var detailLabelTopPadding: CGFloat { 8.0 }
    
    var tryDemoTopPadding: CGFloat { 8 }
    var logoTopPadding: CGFloat { 8 }
    var logoBottomPadding: CGFloat { 32 }
}

class FioriWelcomeScreenSpec_Large: FioriWelcomeScreenSpec {
    var leftPadding: CGFloat { 32 }
    var rightPadding: CGFloat { self.leftPadding }
    
    var headlineImageTopPadding: CGFloat { 42 }
    var headlineLabelTopPadding: CGFloat { 14 }
    var detailLabelTopPadding: CGFloat { 40.0 }
    
    var tryDemoTopPadding: CGFloat { 8 }
    var logoTopPadding: CGFloat { 48 }
    var logoBottomPadding: CGFloat { 32 }
}

class FioriWelcomeScreenSpec_ExtraLarge: FioriWelcomeScreenSpec {
    var leftPadding: CGFloat { 76.0 }
    var rightPadding: CGFloat { self.leftPadding }

    var headlineImageTopPadding: CGFloat { 130 }
    var headlineLabelTopPadding: CGFloat { 200.0 }
    var detailLabelTopPadding: CGFloat { 60.0 }
    
    var tryDemoTopPadding: CGFloat { 8.0 }
    var logoTopPadding: CGFloat { 48.0 }
    var logoBottomPadding: CGFloat { 64 }
}

class FioriWelcomeScreenSpec_ExtraExtraLarge: FioriWelcomeScreenSpec {
    var leftPadding: CGFloat { 76.0 }
    var rightPadding: CGFloat { self.leftPadding }

    var headlineImageTopPadding: CGFloat { 130 }
    var headlineLabelTopPadding: CGFloat { 276.0 }
    var detailLabelTopPadding: CGFloat { 64.0 }
    
    var tryDemoTopPadding: CGFloat { 8.0 }
    var logoTopPadding: CGFloat { 64.0 }
    var logoBottomPadding: CGFloat { 112 }
}

func getWelcomeScreenSpec(height: CGFloat) -> FioriWelcomeScreenSpec {
    let supportedType = FioriOnboardingUtil.currentSupportedType(height: height)
    switch supportedType {
    case .small:
        return FioriWelcomeScreenSpec_Small()
    case .medium:
        return FioriWelcomeScreenSpec_Medium()
    case .large:
        return FioriWelcomeScreenSpec_Large()
    case .extraLarge:
        return FioriWelcomeScreenSpec_ExtraLarge()
    case .extraExtraLarge:
        return FioriWelcomeScreenSpec_ExtraExtraLarge()
    }
}
