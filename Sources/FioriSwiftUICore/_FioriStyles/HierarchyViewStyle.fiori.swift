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
    @Environment(\.isHierarchyViewMultiColumnLayout) private var isMultiColumnLayout
    @Environment(\.hierarchyViewIsAsync) private var isAsync
    @EnvironmentObject private var modelObject: HierarchyViewModelObject
    
    @State private var asyncCount: Int = 0
    @State private var asyncCountParentID: String? = nil
    
    public func makeBody(_ configuration: HierarchyViewConfiguration) -> some View {
        VStack(spacing: 0) {
            if self.isMultiColumnLayout {
                HierarchyItemSwippingColumnsLayoutView(configuration: configuration)
            } else {
                configuration.header
                
                Divider()
                
                GeometryReader { geo in
                    ScrollView(.vertical, showsIndicators: false, content: {
                        if self.isAsync {
                            LazyVStack(spacing: 0) {
                                if let id = modelObject.currentActiveItemID {
                                    if self.asyncCountParentID == id, self.asyncCount == 0 {
                                        self.fullHeightProgress(minHeight: geo.size.height)
                                    } else {
                                        let countToShow = (asyncCountParentID == id) ? self.asyncCount : 0
                                        ForEach(0 ..< countToShow, id: \.self) { index in
                                            let childID = configuration.childItemID(configuration.dataSource, idForChildItemAt: index, parentID: id)
                        
                                            if self.editMode?.wrappedValue == .active, self.selectionMode != .none {
                                                HStack {
                                                    Image(systemName: configuration.isSelected(childID) ? "checkmark.circle.fill" : "circle")
                                                        .foregroundStyle(Color.preferredColor(.tintColor))
                                                    
                                                    Spacer().frame(width: 16)
                                                    
                                                    configuration.hierarchyItem(childID).typeErased
                                                }
                                                .padding(16)
                                                .background(Color.preferredColor(self.modelObject.activeChildID == childID ? .informationBackground : .cellBackground))
                                                .onTapGesture {
                                                    configuration.onSelected(childID, selectionMode: self.selectionMode)
                                                }
                                            } else {
                                                configuration.hierarchyItem(childID).typeErased
                                                    .padding(16)
                                                    .background(Color.preferredColor(self.modelObject.activeChildID == childID ? .informationBackground : .cellBackground))
                                            }
                                            
                                            Divider()
                                        }
                                    }
                                } else {
                                    self.fullHeightProgress(minHeight: geo.size.height)
                                }
                            }
                            .task(id: self.modelObject.currentActiveItemID) {
                                guard let id = modelObject.currentActiveItemID else {
                                    await MainActor.run {
                                        self.asyncCount = 0
                                        self.asyncCountParentID = nil
                                    }
                                    return
                                }

                                // Immediately clear the UI and mark which parent we're fetching for
                                await MainActor.run {
                                    self.asyncCount = 0
                                    self.asyncCountParentID = id
                                }

                                do {
                                    let fetched = try await configuration.dataSource.numberOfChildrenAsync(for: id)
                                    if Task.isCancelled { return }

                                    await MainActor.run {
                                        // only write result if parent hasn't changed
                                        if self.asyncCountParentID == id {
                                            self.asyncCount = fetched
                                        }
                                    }
                                } catch {
                                    if Task.isCancelled { return }

                                    await MainActor.run {
                                        if self.asyncCountParentID == id {
                                            self.asyncCount = 0
                                        }
                                    }
                                }
                            }
                        } else if let currentItemID = modelObject.currentActiveItemID {
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
                                        .background(Color.preferredColor(self.modelObject.activeChildID == childID ? .informationBackground : .cellBackground))
                                        .onTapGesture {
                                            configuration.onSelected(childID, selectionMode: self.selectionMode)
                                        }
                                    } else {
                                        configuration.hierarchyItem(childID).typeErased
                                            .padding(16)
                                            .background(Color.preferredColor(self.modelObject.activeChildID == childID ? .informationBackground : .cellBackground))
                                    }
                                    
                                    Divider()
                                }
                            }
                        } else {
                            EmptyView()
                        }
                        
                    })
                }
            }
        }.background(Color.preferredColor(.secondaryBackground))
    }
    
    @ViewBuilder private func fullHeightProgress(minHeight: CGFloat? = nil) -> some View {
        VStack {
            Spacer(minLength: 0)
            ProgressView()
            Spacer(minLength: 0)
        }
        .frame(minHeight: minHeight)
        .frame(maxWidth: .infinity)
    }
}

// Default fiori styles
extension HierarchyViewFioriStyle {
    struct ContentFioriStyle: HierarchyViewStyle {
        @StateObject private var modelObject = HierarchyViewModelObject()
        @Environment(\.isHierarchyViewMultiColumnLayout) private var isMultiColumnLayout
        @Environment(\.hierarchyViewIsAsync) private var isAsync
        
        func makeBody(_ configuration: HierarchyViewConfiguration) -> some View {
            let hierarchyView = AnyView(HierarchyView(configuration, dataSource: configuration.dataSource))
                .environmentObject(self.modelObject)
                .environment(\.isHierarchyViewMultiColumnLayout, UIDevice.current.userInterfaceIdiom == .pad)
                .environment(\.onCurrentHierarchyItemChange, self.modelObject.onCurrentActiveItemChange) // Let HierarchyIndicatorView have the opportunity to change the ID independently.
            
            return Group {
                if self.isAsync {
                    hierarchyView
                        .task { // Use .task modifier for async hierarchy view
                            guard self.isAsync else { return }
                            
                            await MainActor.run {
                                self.modelObject.dataSource = configuration.dataSource
                                if self.isMultiColumnLayout {
                                    self.modelObject.onIndicatorMultiLineChange = { newValue in
                                        self.modelObject.isMultilineIndicatorInMultiColumnLayout = nil
                                        self.modelObject.isMultilineIndicatorInMultiColumnLayout = newValue
                                    }
                                }
                                
                                // always set the change handler so other parts see it
                                self.modelObject.onCurrentActiveItemChange = { newID, columnIndex in
                                    if self.isMultiColumnLayout {
                                        self.modelObject.setMultiColumnLayoutActiveItem(newID, columnIndex: columnIndex)
                                    } else {
                                        self.modelObject.setActiveItem(newID)
                                    }
                                }
                            }

                            // Only fetch root if we don't already have an active item
                            // Check state on MainActor to be safe:
                            let hasActiveID = await MainActor.run { self.modelObject.currentActiveItemID != nil }
                            guard !hasActiveID else { return }

                            do {
                                // call async API (cancellable)
                                let rootID = try await configuration.dataSource.rootIDAsync()

                                try await self.modelObject.setCurrentActiveItemAsync(rootID)
                            } catch {
                                // handle error (log, set an error state on modelObject, etc.)
                                // e.g. await MainActor.run { self.modelObject.lastError = error }
                                print("Failed to load rootID: \(error)")
                            }
                        }
                } else {
                    hierarchyView
                        .onAppear {
                            guard !self.isAsync else { return }
                            
                            // Update modelObject.selectedItemID safely
                            self.modelObject.dataSource = configuration.dataSource
                            if self.isMultiColumnLayout {
                                self.modelObject.onIndicatorMultiLineChange = { newValue in
                                    self.modelObject.isMultilineIndicatorInMultiColumnLayout = nil
                                    self.modelObject.isMultilineIndicatorInMultiColumnLayout = newValue
                                }
                            }
        
                            guard let _ = modelObject.currentActiveItemID else {
                                self.modelObject.setCurrentActiveItem(configuration.dataSource.rootID())
                                self.modelObject.onCurrentActiveItemChange = { newID, columnIndex in
                                    if self.isMultiColumnLayout {
                                        self.modelObject.setMultiColumnLayoutActiveItem(newID, columnIndex: columnIndex)
                                    } else {
                                        self.modelObject.setActiveItem(newID)
                                    }
                                }
                                return
                            }
                        }
                }
            }
            .onChange(of: self.modelObject.currentActiveItemID) { _, _ in
                configuration.$activeChildItem.wrappedValue = self.modelObject.activeChildID
            }
        }
    }
}
