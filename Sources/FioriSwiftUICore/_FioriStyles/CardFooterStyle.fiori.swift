import FioriThemeManager
import Foundation
import SwiftUI

private struct CardFooterLayout: Layout {
    enum ButtonWidthMode {
        /// same and fill its width to use available container width
        case sameAndFill
        
        /// intrinsic size's width
        case intrinsic
    }
    
    struct LayoutMode {
        let mode: ButtonWidthMode
        let num: Int
    }
    
    struct CacheData {
        var fitSize: CGSize
        var frames: [CGRect]
        
        mutating func clear() {
            self.fitSize = .zero
            self.frames = []
        }
    }
    
    @Binding var numButtonsDisplayInOverflow: Int
    
    /// The distance between adjacent subviews.
    var spacing: CGFloat? = 8
    
    /// Maximum width for each element in the container
    var maxButtonWidth: CGFloat
    
    var horizontalSizeClass: UserInterfaceSizeClass? = .compact
    
    init(numButtonsDisplayInOverflow: Binding<Int>, spacing: CGFloat? = nil, maxButtonWidth: CGFloat? = nil, horizontalSizeClass: UserInterfaceSizeClass? = nil) {
        self._numButtonsDisplayInOverflow = numButtonsDisplayInOverflow
        self.spacing = spacing
        self.maxButtonWidth = max(100, maxButtonWidth ?? CGFloat.greatestFiniteMagnitude)
        self.horizontalSizeClass = horizontalSizeClass
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) -> CGSize {
        guard !subviews.isEmpty else { return .zero }
        
        self.calculateLayout(proposal: proposal, subviews: subviews, cache: &cache)
        return cache.fitSize
    }
    
    /// Creates and initializes a cache for a layout instance.
    func makeCache(subviews: Subviews) -> CacheData {
        CacheData(fitSize: .zero, frames: [])
    }
    
    func calculateLayout(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        let subViewSizes = subviews.reversed().map {
            $0.sizeThatFits(.unspecified)
        }
        
        cache.clear()
        
        let isRegular = self.horizontalSizeClass == .regular && (proposal.width ?? 500 > 667)
        let layoutMode = LayoutMode(mode: isRegular ? .intrinsic : .sameAndFill,
                                    num: isRegular ? 3 : 2)
        
        let hideRect = CGRect(x: -2000, y: 0, width: 0, height: 0)
        self.calculateLayout(proposalWidth: proposal.width, subViewSizes: subViewSizes, hideRect: hideRect, layoutMode: layoutMode, cache: &cache)
    }

    /// .compact, .sameAndFill, same size, up to 2 buttons
    /// .reguar, .intrinsic, up to 3 buttons
    func calculateLayout(proposalWidth: CGFloat?, subViewSizes: [CGSize], hideRect: CGRect, layoutMode: LayoutMode, cache: inout CacheData) {
        let subViewNoOflSizes = subViewSizes.dropLast()
        let numButtons = subViewNoOflSizes.count
        let overflowSize = subViewSizes[numButtons]
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
            if layoutMode.mode == .sameAndFill {
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
                if layoutMode.mode == .sameAndFill {
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
                    if layoutMode.mode == .sameAndFill {
                        let availableWidth = finalWidth - theSpacing * CGFloat(numToShow) - overflowSize.width
                        buttonWidth = min(self.maxButtonWidth, availableWidth / CGFloat(numToShow))
                    }
                    break
                }
            }
            
            if buttonWidth == nil, layoutMode.mode == .sameAndFill {
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
        
        var frames = [CGRect]()
        
        var x: CGFloat = 0
        for i in 0 ... numButtons {
            if i < numToShow {
                let btWidth = buttonWidth ?? min(self.maxButtonWidth, subViewNoOflSizes[i].width)
                x += btWidth + (i > 0 ? theSpacing : 0)
                frames.append(CGRect(origin: CGPoint(x: finalWidth - x + btWidth / 2, y: y), size: CGSize(width: btWidth, height: maxHeight)))
            } else if i < numButtons { // rest button to hide
                frames.append(hideRect)
            } else { // overflow
                if numToHide > 0 {
                    frames.append(CGRect(x: overflowSize.width / 2, y: y, width: min(self.maxButtonWidth, overflowSize.width), height: overflowSize.height))
                } else {
                    frames.append(hideRect)
                }
            }
        }

        DispatchQueue.main.async {
            self.numButtonsDisplayInOverflow = numToHide
        }
        cache.frames = frames.reversed()
        cache.fitSize = CGSize(width: finalWidth, height: maxHeight)
    }
  
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        guard !subviews.isEmpty else { return }
        
        if cache.frames.isEmpty || cache.fitSize.width != proposal.width {
            self.calculateLayout(proposal: proposal, subviews: subviews, cache: &cache)
        }
        
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
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State var numButtonsDisplayInOverflow: Int = 0
    
    @ViewBuilder
    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        // Add default layout here
        CardFooterLayout(numButtonsDisplayInOverflow: self.$numButtonsDisplayInOverflow, spacing: 8, maxButtonWidth: nil, horizontalSizeClass: self.horizontalSizeClass) {
            Menu {
                if self.numButtonsDisplayInOverflow == 1 {
                    if !configuration.tertiaryAction.isEmpty {
                        configuration.tertiaryAction.environment(\.isInMenu, true)
                    } else {
                        configuration.secondaryAction.environment(\.isInMenu, true)
                    }
                } else if self.numButtonsDisplayInOverflow == 2 {
                    configuration.secondaryAction.environment(\.isInMenu, true)
                    configuration.tertiaryAction.environment(\.isInMenu, true)
                }
            } label: {
                configuration.overflowAction
            }
            /// set the accessibilityLabel as same as SF symbol "ellipsis" which is "More"
            .accessibilityLabel(Text(Image(systemName: "ellipsis")))
            
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
