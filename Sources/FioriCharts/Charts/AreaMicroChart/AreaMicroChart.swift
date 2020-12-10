import SwiftUI

struct AreaMicroChart: View {
    enum Mode: Int {
        case standard, wide
    }
    
    @EnvironmentObject var model: AreaMicroChartModel
    @State var mode: Mode? = .standard
    
    public var body: some View {
        if model.chartPoints == nil {
            return AnyView(NoDataView())
        } else {
            return AnyView(
                HStack(alignment: .center, spacing: 2) {
                    VStack(alignment: .center, spacing: 2) {
                        ZStack {
                            upperLabelsBody()
                            AnyView(model.maxLabel)
                        }
                        HStack {
                            leadingLabelsBody()
                            plotBody()
                            trailingLabelsBody()
                        }
                        ZStack {
                            lowerLabelsBody()
                            AnyView(model.minLabel)
                        }
                    }
                }
            )
        }
    }
    
    private func leadingLabelsBody() -> some View {
        self.mode == .wide ? AnyView(VStack(alignment: .trailing) {
            AnyView(model.firstYLabel)
            Spacer()
            AnyView(model.firstXLabel)
        }) : EmptyView.any
    }
    
    private func upperLabelsBody() -> some View {
        self.mode == .wide ? EmptyView.any : AnyView(HStack {
            AnyView(model.firstYLabel)
            Spacer()
            AnyView(model.lastYLabel)
        })
    }
    
    private func trailingLabelsBody() -> some View {
        self.mode == .wide ? AnyView(VStack(alignment: .leading) {
            AnyView(model.lastYLabel)
            Spacer()
            AnyView(model.lastXLabel)
        }) : EmptyView.any
    }
    
    private func lowerLabelsBody() -> some View {
        self.mode == .wide ? EmptyView.any : AnyView(HStack {
            AnyView(model.firstXLabel)
            Spacer()
            AnyView(model.lastXLabel)
        })
    }
    
    private func plotBody() -> some View {
        ZStack {
            // AnyView(model.innerMaxThreshold?.environment(\.chartBoundingBox, model.boundary)
            AnyView(model.maxThreshold?.environment(\.chartBoundingBox, model.boundary))
            AnyView(model.innerMinThreshold?.environment(\.chartBoundingBox, model.boundary))
            AnyView(model.minThreshold?.environment(\.chartBoundingBox, model.boundary))
            AnyView(model.targetPoints?.environment(\.chartBoundingBox, model.boundary))
            AnyView(model.chartPoints?.environment(\.chartBoundingBox, model.boundary))
        }
    }
}

// MARK: - preview content

struct AreaMicroChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(AreaMicroChartModel.allCases) {
                // MARK: standard layout previews

                AreaMicroChart().environmentObject($0)
                    .frame(width: 312, height: 100, alignment: .center)
                
                // MARK: wide layout previews

                AreaMicroChart(mode: .wide).environmentObject($0)
                    .frame(width: 312, height: 100, alignment: .center)
            }.previewLayout(.sizeThatFits)
        }
    }
}
