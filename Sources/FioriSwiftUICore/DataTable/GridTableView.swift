import Foundation
import SwiftUI

struct GridTableView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.sizeCategory) var sizeCategory
    @ObservedObject var layoutManager: TableLayoutManager
    @ObservedObject var model: TableModel
    
    init(model: TableModel, layoutManager: TableLayoutManager) {
        self.model = model
        layoutManager.model = model
        self.layoutManager = layoutManager
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }

    func makeBody(in rect: CGRect) -> some View {
        if self.horizontalSizeClass != self.layoutManager.sizeClass {
            self.layoutManager.sizeClass = self.horizontalSizeClass ?? .compact
        }
        
        // trigger the layout if it has been changed
        if self.layoutManager.sizeCategory != self.sizeCategory {
            self.layoutManager.sizeCategory = self.sizeCategory
        }
        
        // it only layouts when necessary
        self.layoutManager.layout(size: rect.size)
        
        return Group {
            if !layoutManager.isLayoutFinished(rect.size) {
                if #available(iOS 14.0, *) {
                    ProgressView().progressViewStyle(CircularProgressViewStyle())
                } else {
                    // Fallback on earlier versions
                    Text("Loading...", tableName: "FioriSwiftUICore", bundle: Bundle.accessor)
                }
            } else if self.layoutManager.layoutData != nil, self.layoutManager.layoutWorkItem == nil, self.layoutManager.numberOfRows() > 0, self.layoutManager.numberOfColumns() > 0, rect.size.width > 1, rect.size.height > 1 {
                ScrollAndZoomView(layoutManager: layoutManager, size: rect.size)
                    .frame(width: rect.size.width, height: rect.size.height)
            } else {
                EmptyView()
            }
        }
        .frame(width: rect.size.width, height: rect.size.height)
        .background(self.layoutManager.model.backgroundColor)
    }
}

struct ScrollAndZoomView: UIViewRepresentable {
    @Environment(\.layoutDirection) var layoutDirection
    
    @ObservedObject var layoutManager: TableLayoutManager
    var size: CGSize
    
    init(layoutManager: TableLayoutManager, size: CGSize) {
        self.layoutManager = layoutManager
        self.size = size
        if self.layoutManager.size != size {
            self.layoutManager.size = size
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let contentSizeWidth = self.layoutManager.totalContentWidth(size: self.size)
        let contentSizeHeight = self.layoutManager.totalContentHeight(size: self.size)
        
        let scrollView = UIScrollView()
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bouncesZoom = false
        scrollView.indicatorStyle = .default
        scrollView.minimumZoomScale = min(1, self.size.width / contentSizeWidth)
        scrollView.zoomScale = 1
        scrollView.maximumZoomScale = 8
        
        scrollView.delegate = context.coordinator
        scrollView.frame = CGRect(origin: .zero, size: self.size)
        
        // an UIView to zoom & scroll as UIScrollView does
        let gridTableViewBackground = InternalGridTableBackgroundUIView(layoutManager: layoutManager)
        gridTableViewBackground.frame.size = CGSize(width: contentSizeWidth, height: contentSizeHeight)
        scrollView.addSubview(gridTableViewBackground)
        
        gridTableViewBackground.translatesAutoresizingMaskIntoConstraints = false
        gridTableViewBackground.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        gridTableViewBackground.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        gridTableViewBackground.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        gridTableViewBackground.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        
        // an UIView with same frame size as UIScrollView to display real content
        let gridTableView = InternalGridTableUIView(layoutManager: layoutManager)
        gridTableView.frame.size = self.size
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
        if self.layoutManager.layoutData == nil {
            return
        }
        
        // update it when the orientation changes
        if abs(uiView.frame.width.distance(to: self.size.width)) > 1 || abs(uiView.frame.height.distance(to: self.size.height)) > 1 {
            DispatchQueue.main.async {
                if uiView.subviews.count < 2 {
                    return
                }
                
                uiView.frame.size = size
                let contentSizeWidth = layoutManager.totalContentWidth(size: size)
                let contentSizeHeight = layoutManager.totalContentHeight(size: size)
                let contentSize = CGSize(width: contentSizeWidth, height: contentSizeHeight)
                uiView.subviews[0].frame = CGRect(origin: .zero, size: contentSize)
                uiView.contentSize = contentSize
                uiView.contentOffset = .zero
                uiView.subviews[1].frame = CGRect(origin: .zero, size: size)
                layoutManager.resetPosition()
            }
        } else {
            let contentSizeWidth = self.layoutManager.totalContentWidth(size: self.layoutManager.size)
            let contentSizeHeight = self.layoutManager.totalContentHeight(size: self.layoutManager.size)
            
            if abs(uiView.contentSize.width.distance(to: contentSizeWidth)) > 1 || abs(uiView.contentSize.height.distance(to: contentSizeHeight)) > 1 {
                let contentSize = CGSize(width: contentSizeWidth, height: contentSizeHeight)
                uiView.subviews[0].frame = CGRect(origin: .zero, size: contentSize)
                uiView.contentSize = contentSize
            }
        }
    }

    class Coordinator: NSObject, UIScrollViewDelegate {
        var srollAndZoomView: ScrollAndZoomView
        
        init(_ srollAndZoomView: ScrollAndZoomView) {
            self.srollAndZoomView = srollAndZoomView
        }
    
        func scrollViewDidZoom(_ scrollView: UIScrollView) {
            DispatchQueue.main.async {
                if self.srollAndZoomView.layoutManager.layoutData == nil {
                    return
                }
                
                self.srollAndZoomView.layoutManager.scaleX = scrollView.zoomScale
                self.srollAndZoomView.layoutManager.scaleY = scrollView.zoomScale
                let offset = scrollView.contentOffset
                let tmpXY = self.srollAndZoomView.layoutManager.centerPosition(from: CGPoint(x: abs(offset.x), y: abs(offset.y)), size: self.srollAndZoomView.layoutManager.size)
                self.srollAndZoomView.layoutManager.centerPosition = tmpXY
            }
        }
        
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            if scrollView.subviews.count > 1 {
                return scrollView.subviews[0]
            } else {
                return nil
            }
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            DispatchQueue.main.async {
                if self.srollAndZoomView.layoutManager.layoutData == nil {
                    return
                }
                
                let tmpXY = self.srollAndZoomView.layoutManager.centerPosition(from: scrollView.contentOffset, size: self.srollAndZoomView.layoutManager.size)
                self.srollAndZoomView.layoutManager.centerPosition = tmpXY
            }
        }
    }
}

class InternalGridTableBackgroundUIView: UIView {
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
        let dataTableBackground = InternalGridTableViewBackground(layoutManager: layoutManager)
        let hostingVC = UIHostingController(rootView: dataTableBackground)
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

struct InternalGridTableViewBackground: View {
    @Environment(\.layoutDirection) var layoutDirection
    @ObservedObject var layoutManager: TableLayoutManager

    init(layoutManager: TableLayoutManager) {
        self.layoutManager = layoutManager
    }
    
    var body: some View {
        Color.clear
            .frame(width: self.layoutManager.totalContentWidth(size: layoutManager.size),
                   height: self.layoutManager.totalContentHeight(size: layoutManager.size))
            .flipsForRightToLeftLayoutDirection(layoutDirection == .rightToLeft)
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
    
    init(layoutManager: TableLayoutManager) {
        self.layoutManager = layoutManager
    }
    
    var body: some View {
        if !layoutManager.isLayoutFinished(layoutManager.size) {
            EmptyView()
        } else {
            makeBody()
        }
    }
    
    // swiftlint:disable force_unwrapping
    func makeBody() -> some View {
        let size = self.layoutManager.size
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
                let allowsToShowTheRow = showTheRow(for: rowIndex, y: y, startPosY: startPosition.y, layoutData: layoutData, size: size)
                if allowsToShowTheRow {
                    // general background color & selection background color for the row
                    Group {
                        if self.layoutManager.model.isEditing && self.layoutManager.selectedIndexes.contains(rowIndex - (self.layoutManager.model.hasHeader ? 1 : 0)) {
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
                        let zIndex: Double = {
                            if rowIndex == 0 {
                                return columnIndex == 0 ? 550 : 520
                            } else {
                                return columnIndex == 0 ? 500 : 100
                            }
                        }()
                        
                        // cell
                        ItemView(rowIndex: rowIndex, columnIndex: columnIndex)
                            .position(x: x, y: y)
                            .zIndex(zIndex)
                    }
                    
                    // row leading accessory view
                    LeadingAccessoryView(rowIndex: rowIndex)
                        .position(x: leadingAccessoryViewWidth * tmpScaleX / 2, y: y)
                        .zIndex(rowIndex == 0 ? 550 : 300)
                    
                    // row trailing accesory view
                    TrailingAccessoryView(rowIndex: rowIndex)
                        .position(x: rect.maxX - layoutData.trailingAccessoryViewWidth * tmpScaleX / 2, y: y)
                        .zIndex(rowIndex == 0 ? 460 : 290)
                }
                
                // row dividers
                if layoutManager.model.showRowDivider {
                    Rectangle()
                        .fill(Color.preferredColor(.separator))
                        .frame(width: rect.size.width, height: 1)
                        .position(x: rect.size.width / 2,
                                  y: y + layoutData.rowHeights[rowIndex] * tmpScaleY / 2)
                        .dropShadow(isVertical: false, show: rowIndex == 0 && isDropHorizontalShadow(size))
                        .zIndex(rowIndex == 0 ? 750 : 510)
                }
            }
            
            // first column separator
            if numbOfColumns > 1 && layoutManager.model.showColoumnDivider {
                let offsetX: CGFloat = self.layoutManager.model.isFirstColumnSticky ? 0 : startPosition.x
                let x: CGFloat = (leadingAccessoryViewWidth + allItems[0][0].pos.x + layoutData.columnWidths[0] / 2) * tmpScaleX - offsetX
                let height = columnDividerHeight(layoutData: layoutData) * tmpScaleY
                Rectangle()
                    .fill(Color.preferredColor(.separator))
                    .frame(width: 1, height: height)
                    .position(x: x, y: height / 2)
                    .dropShadow(isVertical: true, show: isDropVerticalShadow(size))
                    .zIndex(700)
            }
        }
        .frame(width: size.width, height: size.height)
        .background(self.layoutManager.model.backgroundColor)
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
        abs(self.layoutManager.startPosition(size: size).x) >= 0.01
    }
    
    private func isDropHorizontalShadow(_ size: CGSize) -> Bool {
        abs(self.layoutManager.startPosition(size: size).y) >= 0.01
    }
}
