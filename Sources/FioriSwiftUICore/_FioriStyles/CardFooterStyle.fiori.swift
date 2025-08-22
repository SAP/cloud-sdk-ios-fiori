import FioriThemeManager
import Foundation
import SwiftUI

struct CardFooterButtonWidthModeKey: EnvironmentKey {
    /// Default value is `.auto`
    public static let defaultValue: CardFooterButtonWidthMode = .auto
}

public extension EnvironmentValues {
    /// Sets the button width mode for `CardFooter`.
    var cardFooterButtonWidthMode: CardFooterButtonWidthMode {
        get { self[CardFooterButtonWidthModeKey.self] }
        set { self[CardFooterButtonWidthModeKey.self] = newValue }
    }
}

/// CardFooter button width mode
public enum CardFooterButtonWidthMode: Int {
    /// auto size based on carder footer's width. When it is regular size class, up to 3 buttons are shown with intrinsic width; when it is compact size class, up to 2 buttons are shown with equal width.
    case auto
    
    /// equal size and fill up the whole width except the overflow button
    case equal
    
    /// intrinsic size's width
    case intrinsic
}

private struct CardFooterLayout: Layout {
    struct LayoutMode: Equatable {
        let mode: CardFooterButtonWidthMode
        let num: Int
    }
    
    struct CacheData {
        var fitSize: CGSize
        var layoutMode: LayoutMode?
        var frames: [CGRect]
        
        mutating func clear() {
            self.fitSize = .zero
            self.layoutMode = nil
            self.frames = []
        }
    }
    
    /// The distance between adjacent subviews.
    var spacing: CGFloat? = 8
    
    /// Maximum width for each element in the container
    var maxButtonWidth: CGFloat
    
    let cardFooterButtonWidthMode: CardFooterButtonWidthMode
    
    init(spacing: CGFloat? = nil, maxButtonWidth: CGFloat? = nil, cardFooterButtonWidthMode: CardFooterButtonWidthMode = .auto) {
        self.spacing = spacing
        self.maxButtonWidth = max(100, maxButtonWidth ?? CGFloat.greatestFiniteMagnitude)
        self.cardFooterButtonWidthMode = cardFooterButtonWidthMode
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) -> CGSize {
        guard !subviews.isEmpty else { return .zero }
        
        self.calculateLayout(proposal: proposal, subviews: subviews, cache: &cache)
        return cache.fitSize
    }
    
    /// Creates and initializes a cache for a layout instance.
    func makeCache(subviews: Subviews) -> CacheData {
        CacheData(fitSize: .zero, layoutMode: nil, frames: [])
    }
    
    func calculateLayout(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        let isRegular: Bool
        switch self.cardFooterButtonWidthMode {
        case .auto: isRegular = proposal.width ?? 1024 > 667
        case .equal: isRegular = false
        case .intrinsic: isRegular = true
        }
        
        let layoutMode = LayoutMode(mode: isRegular ? .intrinsic : .equal,
                                    num: isRegular ? 3 : 2)
        if !cache.frames.isEmpty, cache.fitSize.width == proposal.width, cache.layoutMode == layoutMode {
            return
        }

        cache.clear()
        
        let subViewSizes = subviews.reversed().map {
            $0.sizeThatFits(.unspecified)
        }
        
        self.calculateLayout(proposalWidth: proposal.width, subViewSizes: subViewSizes, layoutMode: layoutMode, cache: &cache)
    }

    /**
     case 1: totol is 5 buttons, 3 buttons (tertiary, secondary, primary), overflow menu with 2 buttons, overflow menu with 1 button
     case 2: total is 3 buttons, 2 buttons (only two of tertiary, secondary and primary exist), overflow menu with 1 button
     case 3: total is 1 button, 1 button, only one of tertiary, secondary or primary exist
     
     In compact width, .equal, same size, up to 2 buttons
     In reguar width, .intrinsic, up to 3 buttons
     */
    func calculateLayout(proposalWidth: CGFloat?, subViewSizes: [CGSize], layoutMode: LayoutMode, cache: inout CacheData) {
        let subViewNoOflSizes: [CGSize]
        switch subViewSizes.count {
        case 5:
            subViewNoOflSizes = Array(subViewSizes.dropLast(2))
        case 3:
            subViewNoOflSizes = Array(subViewSizes.dropLast(1))
        default:
            subViewNoOflSizes = subViewSizes
        }
        
        let numButtons = subViewNoOflSizes.count
        let overflowSize = subViewNoOflSizes.count < subViewSizes.count ? subViewSizes[numButtons] : CGSize.zero
        let theSpacing: CGFloat = self.spacing ?? 0
        var maxHeight: CGFloat = 0
        var requiredFinalWidth: CGFloat = 0
        var finalWidth = proposalWidth ?? 0
        var buttonWidth: CGFloat? = nil
        let idealNumToShow = min(layoutMode.num, numButtons)
        var numToShow = idealNumToShow
        var numToHide = 0
        
        /// calculate numToShow, buttonWidth, requiredFinalWidth
        if finalWidth == 0 {
            if layoutMode.mode == .equal {
                let tmpButtonWidth: CGFloat = subViewNoOflSizes.suffix(numToShow).reduce(0) { partialResult, size in
                    min(self.maxButtonWidth, max(partialResult, size.width))
                }
                requiredFinalWidth = tmpButtonWidth * CGFloat(numToShow) + theSpacing * CGFloat(numToShow - 1)
                buttonWidth = tmpButtonWidth
            } else {
                requiredFinalWidth = subViewNoOflSizes.suffix(numToShow).reduce(0) { partialResult, size in
                    partialResult + min(self.maxButtonWidth, size.width)
                }
                requiredFinalWidth += theSpacing * CGFloat(numToShow - 1)
            }
            
            maxHeight = subViewNoOflSizes.suffix(numToShow).reduce(0) { partialResult, size in
                max(partialResult, size.height)
            }
            
            // check if overflow should be shown
            if numToShow < numButtons {
                requiredFinalWidth += min(self.maxButtonWidth, overflowSize.width) + theSpacing
            }
            finalWidth = requiredFinalWidth
        } else { // there is a proposalWidth
            var tmpButtonWidth: CGFloat = 0
            for i in 0 ..< idealNumToShow {
                if layoutMode.mode == .equal {
                    tmpButtonWidth = min(self.maxButtonWidth, max(tmpButtonWidth, subViewNoOflSizes[i].width))
                    requiredFinalWidth = tmpButtonWidth * CGFloat(i + 1) + theSpacing * CGFloat(i)
                } else {
                    requiredFinalWidth += min(self.maxButtonWidth, subViewNoOflSizes[i].width) + (i > 0 ? theSpacing : 0)
                }
                maxHeight = max(maxHeight, subViewNoOflSizes[i].height)
                numToShow = i + 1
                
                /// Failed to fit numToShow buttons
                if requiredFinalWidth + (numToShow < numButtons ? min(self.maxButtonWidth, overflowSize.width) + theSpacing : 0) > finalWidth {
                    if numToShow > 1 {
                        numToShow -= 1
                    }
                    if layoutMode.mode == .equal {
                        var availableWidth = finalWidth - theSpacing * CGFloat(max(0, numToShow - 1))
                        if numButtons > 1 {
                            availableWidth -= theSpacing + overflowSize.width
                        }
                        buttonWidth = min(self.maxButtonWidth, availableWidth / CGFloat(numToShow))
                    }
                    break
                }
            }
            
            if buttonWidth == nil, layoutMode.mode == .equal {
                var availableWidth = finalWidth - theSpacing * CGFloat(numToShow - 1)
                if numToShow < numButtons {
                    availableWidth -= min(self.maxButtonWidth, overflowSize.width) + theSpacing
                }
                buttonWidth = min(self.maxButtonWidth, availableWidth / CGFloat(numToShow))
            }
        }
        
        numToHide = numButtons - numToShow
        if numToHide > 0 {
            maxHeight = max(maxHeight, overflowSize.height)
        }
        /// calculate numToShow, buttonWidth, requiredFinalWidth
        /// set up frames for each subview
        
        let y = maxHeight / 2
        // Move the hidden buttons out of visible area
        let hideRect = CGRect(x: -2000, y: y, width: 0, height: 0)
        var frames = [CGRect]()
        
        var x: CGFloat = 0
        for i in 0 ..< subViewSizes.count {
            if i < numToShow {
                let btWidth = buttonWidth ?? min(finalWidth - (numToHide > 0 ? theSpacing + overflowSize.width : 0), self.maxButtonWidth, subViewNoOflSizes[i].width)
                x += btWidth + (i > 0 ? theSpacing : 0)
                frames.append(CGRect(origin: CGPoint(x: finalWidth - x + btWidth / 2, y: y), size: CGSize(width: btWidth, height: maxHeight)))
            } else if i < numButtons { // rest button to hide
                frames.append(hideRect)
            } else { // overflow
                if numToHide > 0, i == numButtons + numToHide - 1 { // last one to show overflow
                    frames.append(CGRect(x: overflowSize.width / 2, y: y, width: min(self.maxButtonWidth, overflowSize.width), height: overflowSize.height))
                } else { // hide the other overflow
                    frames.append(hideRect)
                }
            }
        }
        
        cache.frames = frames.reversed()
        cache.fitSize = CGSize(width: finalWidth, height: maxHeight)
        cache.layoutMode = layoutMode
    }
  
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        guard !subviews.isEmpty else { return }
        
        self.calculateLayout(proposal: proposal, subviews: subviews, cache: &cache)
        
        for (i, subview) in subviews.enumerated() {
            let x = cache.frames[i].origin.x + bounds.minX
            let y = cache.frames[i].origin.y + bounds.minY
            
            subview.place(at: CGPointMake(x, y),
                          anchor: .center,
                          proposal: ProposedViewSize(width: cache.frames[i].size.width, height: cache.frames[i].size.height))
        }
    }
}

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct CardFooterBaseStyle: CardFooterStyle {
    @Environment(\.cardFooterButtonWidthMode) var cardFooterButtonWidthMode

    @ViewBuilder
    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        // Add default layout here
        CardFooterLayout(spacing: 8, maxButtonWidth: nil, cardFooterButtonWidthMode: self.cardFooterButtonWidthMode) {
            if self.numOfButtons(configuration) == 3 {
                Menu {
                    configuration.secondaryAction.environment(\.isInMenu, true)
                    configuration.tertiaryAction.environment(\.isInMenu, true)
                } label: {
                    configuration.overflowAction
                }
                /// set the accessibilityLabel as same as SF symbol "ellipsis" which is "More"
                .accessibilityLabel(Text(Image(systemName: "ellipsis")))
            }
            
            if self.numOfButtons(configuration) > 1 {
                Menu {
                    if !configuration.tertiaryAction.isEmpty {
                        configuration.tertiaryAction.environment(\.isInMenu, true)
                    } else {
                        configuration.secondaryAction.environment(\.isInMenu, true)
                    }
                } label: {
                    configuration.overflowAction
                }
                /// set the accessibilityLabel as same as SF symbol "ellipsis" which is "More"
                .accessibilityLabel(Text(Image(systemName: "ellipsis")))
            }
            
            if !configuration.tertiaryAction.isEmpty {
                configuration.tertiaryAction
            }
            
            if !configuration.secondaryAction.isEmpty {
                configuration.secondaryAction
            }
            
            if !configuration.action.isEmpty {
                configuration.action
            }
        }
    }
    
    /**
        case 1: totol is 5 buttons, 3 buttons (tertiary, secondary, primary), overflow menu with 2 buttons, overflow menu with 1 button
        case 2: total is 3 buttons, 2 buttons (only two of tertiary, secondary and primary exist), overflow menu with 1 button
        case 3: total is 1 button, 1 button, only one of tertiary, secondary or primary exist
     */
    func numOfButtons(_ configuration: CardFooterConfiguration) -> Int {
        var value = 0
        if !configuration.action.isEmpty {
            value += 1
        }
        
        if !configuration.secondaryAction.isEmpty {
            value += 1
        }
        
        if !configuration.tertiaryAction.isEmpty {
            value += 1
        }
        return value
    }
}

// Default fiori styles
extension CardFooterFioriStyle {
    struct ContentFioriStyle: CardFooterStyle {
        func makeBody(_ configuration: CardFooterConfiguration) -> some View {
            CardFooter(configuration)
            // Add default style for its content
            // .background()
        }
    }
    
    struct ActionFioriStyle: ActionStyle {
        let cardFooterConfiguration: CardFooterConfiguration
        @Environment(\.isLoading) var isLoading
        func makeBody(_ configuration: ActionConfiguration) -> some View {
            Action(configuration)
                .fioriButtonStyle(FioriPrimaryButtonStyle(.infinity, isLoading: self.isLoading))
        }
    }
    
    struct SecondaryActionFioriStyle: SecondaryActionStyle {
        let cardFooterConfiguration: CardFooterConfiguration
        @Environment(\.isLoading) var isLoading
        func makeBody(_ configuration: SecondaryActionConfiguration) -> some View {
            SecondaryAction(configuration)
                .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .normal, maxWidth: .infinity, isLoading: self.isLoading))
        }
    }
    
    struct TertiaryActionFioriStyle: TertiaryActionStyle {
        let cardFooterConfiguration: CardFooterConfiguration
        @Environment(\.isLoading) var isLoading
        func makeBody(_ configuration: TertiaryActionConfiguration) -> some View {
            TertiaryAction(configuration)
                .fioriButtonStyle(FioriTertiaryButtonStyle(maxWidth: .infinity, isLoading: self.isLoading))
        }
    }
    
    struct OverflowActionFioriStyle: OverflowActionStyle {
        let cardFooterConfiguration: CardFooterConfiguration
        @Environment(\.isLoading) var isLoading
        func makeBody(_ configuration: OverflowActionConfiguration) -> some View {
            OverflowAction(configuration)
                .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .normal, isLoading: self.isLoading))
        }
    }
}

/// Card Tests
public enum CardFooterTests {
    static let footer0 = CardFooter(action: FioriButton(title: "Primary"))
    static let footer1 = CardFooter(secondaryAction: FioriButton(title: "Secondary"))
    static let footer2 = CardFooter(tertiaryAction: FioriButton(title: "Tertiary"))
    static let footer3 = CardFooter(action: FioriButton(title: "Primary long long long long"))
    static let footer4 = CardFooter(action: FioriButton(title: "Primary long long long long long long long long long long long long long long long long long long long"))
    static let footer5 = CardFooter(action: FioriButton(title: "Primary"), secondaryAction: FioriButton(title: "Secondary"))
    static let footer6 = CardFooter(action: FioriButton(title: "Primary"), secondaryAction: FioriButton(title: "Secondary"), tertiaryAction: FioriButton(title: "Tertiary"))
    static let footer7 = CardFooter(action: FioriButton(title: "Primary long long long long long long long long"), secondaryAction: FioriButton(title: "Secondary"))
    static let footer8 = CardFooter(action: FioriButton(title: "Primary"), secondaryAction: FioriButton(title: "Secondary long long long long long a b c long long long long"))
    static let footer9 = CardFooter(action: FioriButton(title: "Primary long long long long long"), secondaryAction: FioriButton(title: "Secondary long long long long long a b c long long long long"), tertiaryAction: FioriButton(title: "Tertiary"))
    static let footer10 = CardFooter(action: FioriButton(title: "Primary long long long long long long long long long long long long long long long long long long long"), secondaryAction: FioriButton(title: "Secondary long long long long long a b c long long long long"), tertiaryAction: FioriButton(title: "Tertiary"))
    public static let examples = [footer0, footer1, footer2, footer3, footer4, footer5, footer6, footer7, footer8, footer9, footer10]
}

#Preview("Empty") {
    VStack {
        CardFooter(action: { EmptyView() }, overflowAction: { EmptyView() }).border(Color.green)
        
        Text("Empty")
            
        CardFooter(action: { EmptyView() }).border(Color.green)
    }.border(Color.red)
}

#Preview("P") {
    CardFooter(action: FioriButton(title: "Primary"), overflowAction: FioriButton(title: "Overflow"))
}

#Preview("S") {
    CardFooter(secondaryAction: FioriButton(title: "Save"))
}

#Preview("T") {
    CardFooter(tertiaryAction: FioriButton(title: "Tertiary"))
}

#Preview("PS") {
    CardFooter(action: FioriButton(title: "Primary"), secondaryAction: FioriButton(title: "Save"))
}

#Preview("ST") {
    CardFooter(secondaryAction: FioriButton(title: "Save"), tertiaryAction: FioriButton(title: "Tertiary"))
}

#Preview("3") {
    CardFooter(action: FioriButton(title: "Primary"), secondaryAction: FioriButton(title: "Save"), tertiaryAction: FioriButton(title: "Tertiary"), overflowAction: FioriButton(title: "..."))
}

#Preview("LongP") {
    CardFooter(action: FioriButton(title: "Primary long long long"), secondaryAction: FioriButton(title: "Save"), tertiaryAction: FioriButton(title: "Tertiary"), overflowAction: FioriButton(title: "Overflow"))
}

#Preview("LongS") {
    CardFooter(action: FioriButton(title: "Primary"), secondaryAction: FioriButton(title: "Save long long long long"), tertiaryAction: FioriButton(title: "Tertiary"), overflowAction: FioriButton(title: "Overflow"))
}

#Preview("LongLong") {
    CardFooter(action: FioriButton(title: "Primary long long long long long long long long"), secondaryAction: FioriButton(title: "Save long long long long long long long long"), tertiaryAction: FioriButton(title: "Tertiary"), overflowAction: FioriButton(title: "Overflow"))
}

#Preview("Shadow1") {
    VStack {
        VStack {
            Text("hello foia weoi foiawefioa aiow efjoi aewiofifaj oei")
            Text("hewoeo fiowaoeifj jioaf wejioeawjfo oijfawe oijfaoiwef oaifj aeiwof oai fiowaoifejaiow fjioawefoaief joiafj ioawej foiawejfo iewfjoiaew fjioaewfjowaie")
            
        }.overlay {
            VStack {
                Text("hello world")
            }
            .frame(width: 200, height: 200)
            .background(.thinMaterial)
            .shadow(color: .black.opacity(0.04), radius: 2, x: 0, y: 0)
            .shadow(color: .black.opacity(0.04), radius: 16, x: 0, y: 8)
            .shadow(color: .black.opacity(0.2), radius: 100, x: 0, y: 10)
        }
    }
    .padding(.top, 60)
    .frame(maxWidth: .infinity)
    .background(Color.preferredColor(.primaryGroupedBackground))
}

#Preview("Same width") {
    VStack {
        Button("Log in") {}
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.red)

        Button("Reset Password") {}
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.red)
    }
    .fixedSize(horizontal: true, vertical: false)
}

#Preview("Model-4") {
    ScrollView(.horizontal) {
        CardFooter(action: FioriButton(title: "Primary long long long long long long long long"), secondaryAction: FioriButton(title: "Save"), tertiaryAction: FioriButton(title: "Tertiary"), overflowAction: FioriButton(title: "Overflow"))
    }
}

#Preview("Model-4") {
    ScrollView(.horizontal) {
        CardFooter(action: FioriButton(title: "Primary"), secondaryAction: FioriButton(title: "Save long long long"), tertiaryAction: FioriButton(title: "Tertiary"), overflowAction: FioriButton(title: "..."))
    }
}

#Preview("VB FioriButton") {
    CardFooter {
        FioriButton { state in
            print("primaryAction \(state)")
        } label: { _ in
            HStack {
                Image(systemName: "tray")
                Text("Save")
            }
        }
    } secondaryAction: {
        FioriButton { state in
            print("secondaryAction \(state)")
        } label: { _ in
            HStack {
                Image(systemName: "doc")
                Text("Decline")
            }
        }
    } tertiaryAction: {
        FioriButton { state in
            print("tertiaryAction \(state)")
        } label: { _ in
            HStack {
                Image(systemName: "paperplane")
                Text("Third")
            }
        }
    }
}

#Preview("VB FioriButton") {
    CardFooter {
        FioriButton { state in
            print("primaryAction \(state)")
        } label: { _ in
            HStack {
                Image(systemName: "tray")
                Text("Save")
            }
        }
    } secondaryAction: {
        Image(systemName: "doc")
            .onTapGesture {
                print("secondaryAction tapped")
            }
    } tertiaryAction: {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.purple)
            .frame(width: 200, height: 80)
            .onTapGesture {
                print("tertiaryAction tapped")
            }
    }
}

#Preview("VB FioriButton") {
    CardFooter {
        FioriButton { state in
            print("primaryAction \(state)")
        } label: { _ in
            HStack {
                Image(systemName: "tray")
                Text("Save")
            }
        }
    } secondaryAction: {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.purple)
            .frame(width: 150, height: 80)
            .onTapGesture {
                print("tertiaryAction tapped")
            }
    } tertiaryAction: {
        Image(systemName: "doc")
            .onTapGesture {
                print("secondaryAction tapped")
            }
    }
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

#Preview("Menu") {
    HStack {
        Menu("Working Day") {
            FioriButton(title: "Monday")
            FioriButton(title: "Tuesday")
            FioriButton(title: "Wednesday")
        }.menuStyle(.borderlessButton)
        
        FioriIcon.actions.overflow
        Image(fioriName: "fiori.overflow")
        Image("fiori.overflow", bundle: Bundle.accessor)
        Image(systemName: "ellipsis")
        FioriButton(title: "Save")
            .fioriButtonStyle(FioriSecondaryButtonStyle(colorStyle: .normal))
    }
}
