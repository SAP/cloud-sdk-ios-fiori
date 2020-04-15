//
//  DimensionSelector.swift
//  DimensionSelector
//
//  Created by Ma, Xiao on 3/17/20.
//  Copyright © 2020 Ma, Xiao. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public struct DimensionSelector: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass: UserInterfaceSizeClass?
    
    let segmentTitles: [String]
    
    let interItemSpacing: CGFloat
    
    public var selectedIndex: Int? {
        get {
            return model.selectedIndex
        }
        set {
            model.selectedIndex = newValue
        }
    }
    
    lazy public private(set) var selectionDidChangePublisher: AnyPublisher<Int?, Never> = {
        self.model.$selectedIndex.eraseToAnyPublisher()
    }()
    
    @ObservedObject private var model: Model = Model()
    
    public init(segmentTitles: [String],
                interItemSpacing: CGFloat = 6,
                selectedIndex: Int?) {
        self.segmentTitles = segmentTitles
        self.interItemSpacing = interItemSpacing
        self.model.selectedIndex = selectedIndex
    }
    
    public var body: some View {
        getBody(selectionDidChangeHandler: nil)
    }
    
    func getBody(selectionDidChangeHandler: ((Int?) -> Void)?) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: interItemSpacing) {
                ForEach(segmentTitles.indices, id: \.self) { index in
                    Segment(title: self.segmentTitles[index], isSelected: self.model.selectedIndex == index)
                        .onTapGesture {
                            selectionDidChangeHandler?(index)
                            self.selectionDidChange(index: index)
                        }
                }
            }
            .padding([.top, .bottom], 8)
            .padding([.leading, .trailing], horizontalSizeClass == .compact ? 16 : 48)
        }
    }
    
    private func selectionDidChange(index: Int?) {
        if selectedIndex != index {
            self.model.selectedIndex = index
//            print("selectedIndex change: \(selectedIndex)")
        }     
    }
}

//extension DimensionSelector {
//    public func onIndexChange(_ handler: @escaping ((Int?) -> Void)) -> some View {
//        self.modifier(OnIndexChangeModifier(dimensionSelector: self, handler: handler))
//    }
//}
//
//struct OnIndexChangeModifier: ViewModifier {
//    let dimensionSelector: DimensionSelector
//    let handler: ((Int?) -> Void)
//    
//    func body(content: Content) -> some View {
//        dimensionSelector.getBody(selectionDidChangeHandler: handler)
//    }
//}

extension DimensionSelector {
    struct Segment: View {
        
        let title: String
        
        var isSelected: Bool

        var body: some View {
            Text(title)
                .padding(8)
                .foregroundColor(self.isSelected ? Color.blue : Color.gray)
                .overlay(ButtonOverlayView(isSelected: self.isSelected))
        }
    }
    
    class Model: ObservableObject {
        @Published var selectedIndex: Int?
    }
}

struct DimensionSelector_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}


