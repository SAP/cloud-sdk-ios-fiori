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
public struct HierarchyViewBaseStyle: HierarchyViewStyle {
    @Environment(\.editMode) private var editMode
    @Environment(\.hierarchyItemSelectionMode) private var selectionMode
    @EnvironmentObject private var modelObject: HierarchyViewModelObject
    
    public func makeBody(_ configuration: HierarchyViewConfiguration) -> some View {
        VStack(spacing: 0) {
            configuration.header
            
            Divider()
            
            ScrollView(.vertical, showsIndicators: false, content: {
                if let currentItemID = modelObject.currentID {
                    LazyVStack(spacing: 0) {
                        ForEach(0 ..< configuration.numberOfChildren(configuration.dataSource, parentID: currentItemID), id: \.self) { index in
                            let childID = configuration.childItemID(configuration.dataSource, idForChildItemAt: index, parentID: currentItemID)
        
                            if self.editMode?.wrappedValue == .active, self.selectionMode != .none {
                                HStack {
                                    Image(systemName: configuration.isSelected(childID) ? "checkmark.circle.fill" : "circle")
                                        .foregroundStyle(Color.preferredColor(.tintColor))
                                    
                                    Spacer().frame(width: 16)
                                    
                                    configuration.hierarchyItem(childID).typeErased
                                }
                                .padding(16)
                                .background(Color.preferredColor(self.modelObject.childID == childID ? .informationBackground : .cellBackground))
                                .onTapGesture {
                                    configuration.onSelected(childID, selectionMode: self.selectionMode)
                                }
                            } else {
                                configuration.hierarchyItem(childID).typeErased
                                    .padding(16)
                                    .background(Color.preferredColor(self.modelObject.childID == childID ? .informationBackground : .cellBackground))
                            }
                            
                            Divider()
                        }
                    }
                } else {
                    EmptyView()
                }
            })
        }.background(Color.preferredColor(.secondaryBackground))
    }
}

// Default fiori styles
extension HierarchyViewFioriStyle {
    struct ContentFioriStyle: HierarchyViewStyle {
        @StateObject private var modelObject = HierarchyViewModelObject()
        
        func makeBody(_ configuration: HierarchyViewConfiguration) -> some View {
            let hierarchyView = AnyView(HierarchyView(configuration, dataSource: configuration.dataSource))
                .environmentObject(self.modelObject)
                .environment(\.onCurrentHierarchyItemChange, self.modelObject.onCurrentItemChange) // Let HierarchyIndicatorView have the opportunity to change the ID independently.
            
            return hierarchyView
                .onAppear {
                    // Update modelObject.selectedItemID safely
                    self.modelObject.dataSource = configuration.dataSource
                    if self.modelObject.currentID == nil {
                        self.modelObject.setCurrentID(configuration.dataSource.rootID())
                        self.modelObject.onCurrentItemChange = { newID in
                            self.modelObject.setCurrentID(newID)
                        }
                    }
                }
                .onChange(of: self.modelObject.childID) { _, newValue in
                    configuration.$activeChildItem.wrappedValue = newValue
                }
        }
    }
}
