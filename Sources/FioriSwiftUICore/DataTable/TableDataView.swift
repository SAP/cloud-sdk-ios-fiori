import SwiftUI

public struct TableDataView: View {
    @EnvironmentObject var model: TableModel
    @Environment(\.layoutDirection) var layoutDirection
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @EnvironmentObject var layoutManager: TableLayoutManager
    @EnvironmentObject var dataManager: TableDataManager
        
    public var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        self.layoutManager.sizeClass = self.horizontalSizeClass ?? .compact
        self.layoutManager.rect = rect
//        self.layoutManager.deviceMode = deviceMode ?? .iphonePortraitOrIpadSplit
        
        return Group {
//            if deviceMode == .iphonePortraitOrIpadSplit, model.showListView {
//                let listView = TableListView()
//                listView
//                    .environmentObject(self.model)
//                    .environment(\.tableContext, self.tableContext)
//                    .padding([.leading])
//            } else {
//                let gridView = GridTableView()
//                gridView
//            }
            
            let gridView = GridTableView()
            gridView
        }
        .navigationBarTitle("grid data table", displayMode: .inline)
    }
}

enum DeviceMode {
    case iphonePortraitOrIpadSplit
    case iphoneLandscape
    case ipadRegular
}

extension DeviceMode {
    init?(_ hSizeClass: UserInterfaceSizeClass?, _ vSizeClass: UserInterfaceSizeClass?) {
        guard let hSizeClass = hSizeClass, let vSizeClass = vSizeClass else {
            return nil
        }
        
        if vSizeClass == .regular, hSizeClass == .compact {
            // iPhone Portrait or iPad 1/3 split view for Multitasking for instance
            self = .iphonePortraitOrIpadSplit
        } else if vSizeClass == .compact, hSizeClass == .compact {
            // some "standard" iPhone Landscape (iPhone SE, X, XS, 7, 8, ...)
            self = .iphoneLandscape
        } else if vSizeClass == .compact, hSizeClass == .regular {
            // some "bigger" iPhone Landscape (iPhone Xs Max, 6s Plus, 7 Plus, 8 Plus, ...)
            self = .iphoneLandscape
        } else if vSizeClass == .regular, hSizeClass == .regular {
            // macOS or iPad without split view - no Multitasking
            self = .ipadRegular
        } else {
            return nil
        }
    }
}
