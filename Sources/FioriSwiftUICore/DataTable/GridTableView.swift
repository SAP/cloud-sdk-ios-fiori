import Combine
import Foundation
import SwiftUI

struct BannerData {
    let title: String
    
    // Level to drive tint colors and importance of the banner.
    var level: Level = .error

    enum Level {
        case info
        case warning
        case error

        var tintColor: Color {
            switch self {
            case .info:
                return .black
            case .warning:
                return .yellow
            case .error:
                return Color.preferredColor(.negativeLabel)
            }
        }
    }
}

struct BannerView: View {
    let data: BannerData
    @Binding var showBanner: Bool
    var action: (() -> Void)?

    init(data: BannerData, showBanner: Binding<Bool>, action: (() -> Void)? = nil) {
        self.data = data
        self._showBanner = showBanner
        self.action = action
    }
    
    var body: some View {
        HStack {
            HStack {
                Spacer()
                
                Image(systemName: "exclamationmark.triangle")
                    .foregroundColor(self.data.level.tintColor)
                    .fixedSize()
                    .frame(width: 16, height: 18)
                    
                Spacer().frame(width: 6)
                Text(self.data.title)
                    .font(.fiori(forTextStyle: .footnote))
                    .foregroundColor(self.data.level.tintColor)
                
                Spacer()
            }
            
            Button {
                self.action?()
                self.showBanner = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color.preferredColor(.quaternaryLabel))
            }
        }
        .padding(EdgeInsets(top: 13, leading: 8, bottom: 13, trailing: 8))
        .background(Color.preferredColor(.header))
        .onTapGesture {
            self.showBanner = false
        }
    }
}

struct BannerViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    let data: BannerData
    let action: (() -> Void)?

    func body(content: Content) -> some View {
        content.overlay(
            Group {
                if self.isPresented {
                    VStack {
                        Color.preferredColor(.negativeLabel).frame(height: 4)
                        
                        BannerView(data: self.data, showBanner: self.$isPresented)
                            .animation(.easeOut, value: self.isPresented)
                            .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                        
                        Color.preferredColor(.primaryLabel).frame(height: 0.33).opacity(0.7)
                    }
                    .background(Color.preferredColor(.header))
                }
            },
            alignment: .top
        )
    }
}

extension View {
    func banner(isPresented: Binding<Bool>, data: BannerData, action: (() -> Void)? = nil) -> some View {
        self.modifier(BannerViewModifier(isPresented: isPresented, data: data, action: action))
    }
}

/**
 DataTable view hierarchy
 
 DataTable
        -- ScrollAndZoomView (UIScrollView)
                -- InternalGridTableBackgroundUIView
                -- InternalGridTableUIView
                    -- InternalGridTableView
                        -- Group of ItemView
                        -- InlineEditingView
 */

struct ScrollAndZoomView: UIViewRepresentable {
    @Environment(\.layoutDirection) var layoutDirection
    @ObservedObject var layoutManager: TableLayoutManager
    let size: CGSize

    init(layoutManager: TableLayoutManager, size: CGSize) {
        self.size = size
        self.layoutManager = layoutManager
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bouncesZoom = false
        scrollView.indicatorStyle = .default
        scrollView.minimumZoomScale = self.layoutManager.minScaleAllowed
        scrollView.zoomScale = max(self.layoutManager.minScaleAllowed, min(self.layoutManager.maxScaleAllowed, self.layoutManager.scaleX))
        scrollView.maximumZoomScale = self.layoutManager.maxScaleAllowed
        scrollView.delegate = context.coordinator
        
        // an UIView to zoom & scroll as UIScrollView does
        let gridTableViewBackground = UIView(frame: .zero)
        scrollView.addSubview(gridTableViewBackground)
        
        // an UIView with same frame size as UIScrollView to display real content
        let gridTableView = InternalGridTableUIView(layoutManager: layoutManager)
        scrollView.addSubview(gridTableView)
        gridTableView.translatesAutoresizingMaskIntoConstraints = false
        gridTableView.topAnchor.constraint(equalTo: scrollView.frameLayoutGuide.topAnchor).isActive = true
        gridTableView.bottomAnchor.constraint(equalTo: scrollView.frameLayoutGuide.bottomAnchor).isActive = true
        gridTableView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor).isActive = true
        gridTableView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor).isActive = true

        if self.layoutDirection == .rightToLeft {
            let transform = CGAffineTransform(scaleX: -1, y: 1)

            scrollView.transform = transform
            for subview in scrollView.subviews where subview.isKind(of: InternalGridTableUIView.self) {
                subview.transform = transform
            }
        }
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        if !self.layoutManager.isLayoutFinished(self.size) { return }
        
        let contentSizeWidth = self.layoutManager.totalContentWidth()
        let contentSizeHeight = self.layoutManager.totalContentHeight()
        
        // check & restore scrollView's contentSize
        if abs(uiView.contentSize.width.distance(to: contentSizeWidth)) > 1 || abs(uiView.contentSize.height.distance(to: contentSizeHeight)) > 1 {
            uiView.contentSize = CGSize(width: contentSizeWidth, height: contentSizeHeight)
        }
        
        // check & restore scrollView's zoomScale
        if abs(self.layoutManager.scaleX.distance(to: uiView.zoomScale)) > 0.001 {
            uiView.zoomScale = self.layoutManager.scaleX
        }
        
        // check minimumZoomScale
        let minZoomScale = max(0.5, size.width / contentSizeWidth)
        if abs(uiView.minimumZoomScale.distance(to: minZoomScale)) > 0.001 {
            uiView.minimumZoomScale = max(0.5, self.size.width / contentSizeWidth)
        }
        
        // check & restore scrollView's contentOffset
        let tmpOffsetX = contentSizeWidth * self.layoutManager.startPosition.x
        let tmpOffsetY = contentSizeHeight * self.layoutManager.startPosition.y
        if abs(uiView.contentOffset.x.distance(to: tmpOffsetX)) > 1 || abs(uiView.contentOffset.y.distance(to: tmpOffsetY)) > 1 {
            uiView.contentOffset = CGPoint(x: tmpOffsetX, y: tmpOffsetY)
        }
        
        // InternalGridTableBackgroundUIView
        if let bkView = uiView.subviews.first {
            let bkSize = bkView.frame.size
            if abs(bkSize.width.distance(to: contentSizeWidth)) > 1 || abs(bkSize.height.distance(to: contentSizeHeight)) > 1 {
                bkView.frame = CGRect(origin: .zero, size: CGSize(width: contentSizeWidth, height: contentSizeHeight))
            }
        }
        
        // there could be multiple DataTable present when the keyboard shows up
        if self.layoutManager.model.editMode == .inline, self.layoutManager.cachedKeyboardHeight != self.layoutManager.keyboardHeight, self.layoutManager.currentCell != nil {
            let originalContentOffset = uiView.contentOffset
            var contentOffset = uiView.contentOffset
            
            self.layoutManager.cachedKeyboardHeight = self.layoutManager.keyboardHeight
          
            if self.layoutManager.keyboardHeight > 0 { // show keyboard
                contentOffset = self.adjustContentOffset(uiView)
            } else { // hide keyboard, may adjust start position
                let tmpPos = self.layoutManager.startPosition
                let validPos = self.layoutManager.validStartPosition(pt: tmpPos, size: self.size)
                contentOffset = self.layoutManager.convertUnitPointToContentPoint(validPos, size: self.size)
            }
            
            // do not adjust y if keyboardDidShowOrHide is available
            if self.layoutManager.model.keyboardDidShowOrHide != nil {
                contentOffset.y = originalContentOffset.y
            }
            
            if contentOffset != originalContentOffset {
                uiView.setContentOffset(contentOffset, animated: false)
            }
            
            if let keyboardDidShowOrHide = layoutManager.model.keyboardDidShowOrHide {
                keyboardDidShowOrHide(self.layoutManager.keyboardFrame)
            }
        }
    }
    
    func adjustContentOffset(_ uiView: UIScrollView) -> CGPoint {
        var contentOffset = uiView.contentOffset
        
        // show keyboard
        guard self.layoutManager.model.editMode == .inline, self.layoutManager.keyboardHeight > 0, let cellIndex = layoutManager.currentCell, let layoutData = self.layoutManager.layoutData else { return contentOffset }
        
        let size = self.layoutManager.size
        let rowIndex = cellIndex.0
        let columnIndex = cellIndex.1
        let dataItem = layoutData.allDataItems[cellIndex.0][cellIndex.1]
        let startPosition = contentOffset
        let tmpScaleX = self.layoutManager.scaleX(size: size)
        let tmpScaleY = self.layoutManager.scaleY(size: size)
        
        // adjust contentOffset.y
        let y: CGFloat = dataItem.pos.y * tmpScaleY - ((self.layoutManager.model.isHeaderSticky && rowIndex == 0) ? 0 : startPosition.y)
        let cellHeight = layoutData.rowHeights[rowIndex] * tmpScaleY
        let bottomY = y + cellHeight / 2
        let offsetY: CGFloat = self.layoutManager.model.hasHeader && self.layoutManager.model.isHeaderSticky ? layoutData.rowHeights[0] * tmpScaleY : 0
        
        // need to ajust y pos
        if self.layoutManager.model.keyboardDidShowOrHide == nil {
            // move the cell up
            if bottomY > size.height {
                contentOffset.y += bottomY - size.height
            } else if y - cellHeight / 2 < offsetY {
                // move the cell down and consider not to block the header
                contentOffset.y -= offsetY - (y - cellHeight / 2)
            }
            if contentOffset.y < 0 {
                contentOffset.y = 0
            }
        }
        
        // adjust contentOffset.x
        let leadingAccessoryViewWidth = layoutData.leadingAccessoryViewWidth
        let x: CGFloat = (leadingAccessoryViewWidth + dataItem.pos.x) * tmpScaleX - ((self.layoutManager.model.isFirstColumnSticky && columnIndex == 0) ? 0 : startPosition.x)
        let cellWidth = layoutData.columnWidths[columnIndex] * tmpScaleX
        let padding = CGFloat(0) // layoutData.cellContentInsets(for: rowIndex, columnIndex: 1).trailing
        let offsetX: CGFloat = (layoutManager.model.isFirstColumnSticky ? (layoutData.columnWidths[0] + padding) * tmpScaleX : 0) + leadingAccessoryViewWidth * tmpScaleX
        
        // move the cell right and consider not to block by first sticky row and leadingAccessoryView
        if x - cellWidth / 2 < offsetX {
            contentOffset.x -= offsetX - (x - cellWidth / 2)
        } else if x + cellWidth / 2 > size.width - layoutData.trailingAccessoryViewWidth * tmpScaleX {
            // move the cell left and consider not to block by the trailingAccessoryView
            contentOffset.x += (x + cellWidth / 2) - size.width + layoutData.trailingAccessoryViewWidth * tmpScaleX
        }
        
        if contentOffset.x < 0 {
            contentOffset.x = 0
        }
    
        return contentOffset
    }

    class Coordinator: NSObject, UIScrollViewDelegate {
        var srollAndZoomView: ScrollAndZoomView
        
        init(_ srollAndZoomView: ScrollAndZoomView) {
            self.srollAndZoomView = srollAndZoomView
        }
        
        func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
            DispatchQueue.main.async {
                if self.srollAndZoomView.layoutManager.layoutData == nil {
                    return
                }
                
                if self.srollAndZoomView.layoutManager.model.editMode == .inline, self.srollAndZoomView.layoutManager.currentCell != nil {
                    self.srollAndZoomView.layoutManager.currentCell = nil
                }
            }
        }
        
        func scrollViewDidZoom(_ scrollView: UIScrollView) {
            DispatchQueue.main.async {
                if self.srollAndZoomView.layoutManager.layoutData == nil {
                    return
                }
            
                self.srollAndZoomView.layoutManager.scaleX = scrollView.zoomScale
                self.srollAndZoomView.layoutManager.scaleY = scrollView.zoomScale
                self.srollAndZoomView.layoutManager.startPosition = self.srollAndZoomView.layoutManager.startPosition(from: scrollView.contentOffset)
            }
        }
        
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            if scrollView.subviews.count > 1 {
                return scrollView.subviews[0]
            } else {
                return nil
            }
        }
        
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            DispatchQueue.main.async {
                if self.srollAndZoomView.layoutManager.layoutData == nil {
                    return
                }
                
                if self.srollAndZoomView.layoutManager.model.editMode == .inline, self.srollAndZoomView.layoutManager.currentCell != nil {
                    self.srollAndZoomView.layoutManager.currentCell = nil
                }
            }
        }

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            DispatchQueue.main.async {
                if self.srollAndZoomView.layoutManager.layoutData == nil {
                    return
                }
                
                self.srollAndZoomView.layoutManager.startPosition = self.srollAndZoomView.layoutManager.startPosition(from: scrollView.contentOffset)
            }
        }
    }
}

class InternalGridTableUIView: UIView {
    var layoutManager: TableLayoutManager

    init(layoutManager: TableLayoutManager) {
        self.layoutManager = layoutManager
        super.init(frame: .zero)
        self.createView()
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView() {
        let dataTable = InternalGridTableView(layoutManager: layoutManager)
        let hostingVC = UIHostingController(rootView: dataTable)
        if let hostingView = hostingVC.view {
            hostingView.removeFromSuperview()
            self.addSubview(hostingView)
            
            hostingView.backgroundColor = .clear
            hostingView.translatesAutoresizingMaskIntoConstraints = false
            hostingView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            hostingView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            hostingView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            hostingView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }
    }
}

struct InternalGridTableView: View {
    @ObservedObject var layoutManager: TableLayoutManager
    
    /// observe this to make DataListItem refresh to show/hide the chevron icon when it enters in/out of the inline edit mode
    @ObservedObject var model: TableModel
    @State var showBanner: Bool = true

    init(layoutManager: TableLayoutManager) {
        self.layoutManager = layoutManager
        self.model = layoutManager.model
        
        let numOfErrors = layoutManager.layoutData?.numOfErrors ?? 0
        if numOfErrors > 0 {
            let errFormat = NSLocalizedString("There are %d errors in the data table.", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            let errMsg = String(format: errFormat, numOfErrors)
            layoutManager.isValid = (false, errMsg)
        }
        
        self._showBanner = State(initialValue: numOfErrors > 0 && self.showBanner)
    }

    var body: some View {
        GeometryReader { proxy in
            self.makeRootBody(proxy.frame(in: .local).size)
        }
    }
    
    func makeRootBody(_ size: CGSize) -> some View {
        Group {
            if size == .zero || !self.layoutManager.isLayoutFinished(self.layoutManager.size) {
                EmptyView()
            } else {
                ZStack(alignment: .top) {
                    self.makeBody(size)
                        .banner(isPresented: self.$showBanner, data: BannerData(title: self.layoutManager.isValid.1 ?? ""))
                    
                    // show the focused textfield or other type of inline editing view
                    if let cellIndex = layoutManager.currentCell, let ld = layoutManager.layoutData, layoutManager.model.editMode == .inline {
                        if ld.allDataItems[cellIndex.0][cellIndex.1].type == .text {
                            InlineEditingView(layoutManager: self.layoutManager, layoutData: ld, showBanner: self.$showBanner)
                                .id("\(cellIndex.0), \(cellIndex.1)")
                                .position(self.focusedCellPosition(self.layoutManager.size))
                        } else {
                            FocusedEditingView(rowIndex: cellIndex.0, columnIndex: cellIndex.1, layoutManager: self.layoutManager, layoutData: ld, showBanner: self.$showBanner)
                                .id("\(cellIndex.0), \(cellIndex.1)")
                                .position(self.focusedCellPosition(self.layoutManager.size))
                        }
                    }
                }
                .frame(width: size.width, height: size.height)
            }
        }
    }
    
    func itemViewId(rowIndex: Int, columnIndex: Int) -> String {
        var result = "\(rowIndex), \(columnIndex), \(model.editMode), \(self.layoutManager.scaleX), \(self.layoutManager.needRefresh)"
        
        var isStickyCell = false
        let isHeader: Bool = rowIndex == 0 && self.layoutManager.model.hasHeader
        if isHeader, self.layoutManager.model.isHeaderSticky {
            isStickyCell = true
        } else if self.layoutManager.model.isFirstColumnSticky, columnIndex == 0 {
            isStickyCell = true
        }
        
        let selectionIndex = rowIndex - (self.layoutManager.model.hasHeader ? 1 : 0)
        let isSelected = self.layoutManager.selectedIndexes.contains(selectionIndex)
        
        result += isStickyCell && isSelected ? "true" : "false"
        
        if let currentCell = layoutManager.currentCell, currentCell.0 == rowIndex, currentCell.1 == columnIndex {
            result += ", true"
        } else {
            result += ", false"
        }
        
        return result
    }
    
    func leadingAccessoryViewId(_ rowIndex: Int) -> String {
        var result = "\(rowIndex), \(layoutManager.scaleX), "
        var state = "false"
        if self.layoutManager.model.editMode == .select {
            let selectionIndex = rowIndex - (layoutManager.model.hasHeader ? 1 : 0)
            let isSelected = self.layoutManager.selectedIndexes.contains(selectionIndex)
            
            state = isSelected ? "true" : "false"
        }
        
        result += state
        
        return result
    }
    
    /**
     the z order of views:
     regular rows
        row: cells
        leading accessory, trailing accessory
        row divider
     sticky column
     sticky header
     sticky header divider
     column divider
     */
    func makeBody(_ size: CGSize) -> some View {
        let rect = CGRect(origin: .zero, size: size)
        let layoutData = self.layoutManager.layoutData!
        let allItems = layoutData.allDataItems
        let (indexOfRows, indexOfColumns) = self.layoutManager.visibleRowAndColumnIndexes()
        let numbOfColumns = self.layoutManager.numberOfColumns()
        let tmpScaleX = self.layoutManager.scaleX(size: size)
        let tmpScaleY = self.layoutManager.scaleY(size: size)
        let startPosition = self.layoutManager.startPositionInPoint(size: size)
        let leadingAccessoryViewWidth = layoutData.leadingAccessoryViewWidth
         
        return ZStack {
            // all visible rows
            ForEach(0 ..< indexOfRows.count, id: \.self) { i in
                let rowIndex = indexOfRows[i]
                let offsetY: CGFloat = (self.layoutManager.model.isHeaderSticky && rowIndex == 0) ? 0 : startPosition.y
                let y: CGFloat = allItems[rowIndex][0].pos.y * tmpScaleY - offsetY
                let allowsToShowTheRow = self.showTheRow(for: rowIndex, y: y, startPosY: startPosition.y, layoutData: layoutData, size: size)
                
                if allowsToShowTheRow {
                    // general background color & selection background color for the row
                    Group {
                        if self.layoutManager.model.editMode == .select, self.layoutManager.selectedIndexes.contains(rowIndex - (self.layoutManager.model.hasHeader ? 1 : 0)) {
                            Color.preferredColor(.informationBackground)
                        } else {
                            self.layoutManager.model.backgroundColor
                        }
                    }
                    .frame(width: size.width, height: layoutData.rowHeights[rowIndex] * tmpScaleY)
                    .position(x: size.width / 2, y: y)
                    
                    // all visible columns
                    ForEach(0 ..< indexOfColumns.count, id: \.self) { j in
                        let columnIndex = indexOfColumns[j]
                        let currentItem = allItems[rowIndex][columnIndex]
                        let offsetX: CGFloat = (self.layoutManager.model.isFirstColumnSticky && columnIndex == 0) ? 0 : startPosition.x
                        let x: CGFloat = (leadingAccessoryViewWidth + currentItem.pos.x) * tmpScaleX - offsetX
                        
                        // cell
                        ItemView(rowIndex: rowIndex, columnIndex: columnIndex, layoutManager: self.layoutManager, layoutData: layoutData, showBanner: self.$showBanner)
                            .id(self.itemViewId(rowIndex: rowIndex, columnIndex: columnIndex))
                            .position(x: x, y: y)
                    }
                    
                    // row leading accessory view
                    LeadingAccessoryView(rowIndex: rowIndex, layoutManager: self.layoutManager, layoutData: layoutData)
                        .id("\(self.leadingAccessoryViewId(rowIndex))")
                        .position(x: leadingAccessoryViewWidth * tmpScaleX / 2, y: y)
                    
                    // row trailing accesory view
                    TrailingAccessoryView(rowIndex: rowIndex, layoutManager: self.layoutManager, layoutData: layoutData)
                        .id("\(rowIndex), \(self.layoutManager.scaleX)")
                        .position(x: rect.maxX - layoutData.trailingAccessoryViewWidth * tmpScaleX / 2, y: y)
                }
                
                // row dividers
                if self.layoutManager.model.showRowDivider, (rowIndex + 1) % max(1, self.layoutManager.model.everyNumOfRowsToShowDivider) == 0 {
                    Rectangle()
                        .fill(self.layoutManager.model.rowDividerColor)
                        .frame(width: rect.size.width, height: self.layoutManager.model.rowDividerHeight)
                        .position(x: rect.size.width / 2,
                                  y: y + layoutData.rowHeights[rowIndex] * tmpScaleY / 2)
                        .dropShadow(isVertical: false, show: rowIndex == 0 && self.isDropHorizontalShadow(size))
                }
            }
            
            // first column divider
            if numbOfColumns > 1, self.layoutManager.model.showColoumnDivider {
                let offsetX: CGFloat = self.layoutManager.model.isFirstColumnSticky ? 0 : startPosition.x
                let x: CGFloat = (leadingAccessoryViewWidth + allItems[0][0].pos.x + layoutData.columnWidths[0] / 2) * tmpScaleX - offsetX
                let height = self.columnDividerHeight(layoutData: layoutData) * tmpScaleY
                Rectangle()
                    .fill(self.layoutManager.model.columnDividerColor)
                    .frame(width: self.layoutManager.model.columnDividerWidth, height: height)
                    .position(x: x, y: height / 2)
                    .dropShadow(isVertical: true, show: self.isDropVerticalShadow(size))
            }
        }
        .frame(width: size.width, height: size.height)
        .background(self.layoutManager.model.backgroundColor)
    }
    
    func focusedCellPosition(_ size: CGSize) -> CGPoint {
        guard let layoutData = layoutManager.layoutData, let currentCell = layoutManager.currentCell else { return .zero }
        
        let rowIndex = currentCell.0
        let columnIndex = currentCell.1
        let dataItem = layoutData.allDataItems[rowIndex][columnIndex]
        let tmpScaleY = self.layoutManager.scaleY(size: size)
        let startPosition = self.layoutManager.startPositionInPoint(size: size)
        let leadingAccessoryViewWidth = layoutData.leadingAccessoryViewWidth
        let offsetY: CGFloat = (layoutManager.model.isHeaderSticky && rowIndex == 0) ? 0 : startPosition.y
        let y: CGFloat = dataItem.pos.y * tmpScaleY - offsetY
        let offsetX: CGFloat = (layoutManager.model.isFirstColumnSticky && columnIndex == 0) ? 0 : startPosition.x
        let x: CGFloat = (leadingAccessoryViewWidth + dataItem.pos.x) * tmpScaleY - offsetX
        
        return CGPoint(x: x, y: y)
    }
    
    func columnDividerHeight(layoutData: LayoutData) -> CGFloat {
        var height: CGFloat = 0
        if let theCell = layoutData.allDataItems.last?.first {
            height += theCell.pos.y
        }
        
        if let lastRowHeight = layoutData.rowHeights.last {
            height += lastRowHeight / 2
        }
        
        return height
    }
    
    func showTheRow(for rowIndex: Int, y: CGFloat, startPosY: CGFloat, layoutData: LayoutData, size: CGSize) -> Bool {
        let hasStickyHeader = self.layoutManager.model.isHeaderSticky && self.layoutManager.model.hasHeader
        
        if self.layoutManager.model.allowsPartialRowDisplay || (hasStickyHeader && rowIndex == 0) {
            return true
        }
        
        let tmpScaleY = self.layoutManager.scaleY(size: size)
        let halfRowHeight = layoutData.rowHeights[rowIndex] * tmpScaleY / 2
        let firstRowHeight = (layoutData.rowHeights.first ?? 0) * tmpScaleY
        let minY = (hasStickyHeader ? firstRowHeight : 0) + halfRowHeight
        
        return y >= minY && y <= size.height - halfRowHeight
    }
    
    private func isDropVerticalShadow(_ size: CGSize) -> Bool {
        abs(self.layoutManager.startPosition.x) >= 0.01
    }
    
    private func isDropHorizontalShadow(_ size: CGSize) -> Bool {
        abs(self.layoutManager.startPosition.y) >= 0.01
    }
}
