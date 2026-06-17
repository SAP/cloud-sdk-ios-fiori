import SwiftUI

struct AreaMicroChart: View {
    enum Mode: Int {
        case standard, wide
    }
    
    @EnvironmentObject var model: AreaMicroChartModel
    @State var mode: Mode? = .standard
    
    public var body: some View {
        if self.model.chartPoints == nil {
            return AnyView(NoDataView())
        } else {
            return AnyView(
                HStack(alignment: .center, spacing: 2) {
                    VStack(alignment: .center, spacing: 2) {
                        ZStack {
                            self.upperLabelsBody()
                            AnyView(self.model.maxLabel)
                        }
                        HStack {
                            self.leadingLabelsBody()
                            self.plotBody()
                            self.trailingLabelsBody()
                        }
                        ZStack {
                            self.lowerLabelsBody()
                            AnyView(self.model.minLabel)
                        }
                    }
                }
            )
        }
    }
    
    private func leadingLabelsBody() -> some View {
        self.mode == .wide ? AnyView(VStack(alignment: .trailing) {
            AnyView(self.model.firstYLabel)
            Spacer()
            AnyView(self.model.firstXLabel)
        }) : EmptyView.any
    }
    
    private func upperLabelsBody() -> some View {
        self.mode == .wide ? EmptyView.any : AnyView(HStack {
            AnyView(self.model.firstYLabel)
            Spacer()
            AnyView(self.model.lastYLabel)
        })
    }
    
    private func trailingLabelsBody() -> some View {
        self.mode == .wide ? AnyView(VStack(alignment: .leading) {
            AnyView(self.model.lastYLabel)
            Spacer()
            AnyView(self.model.lastXLabel)
        }) : EmptyView.any
    }
    
    private func lowerLabelsBody() -> some View {
        self.mode == .wide ? EmptyView.any : AnyView(HStack {
            AnyView(self.model.firstXLabel)
            Spacer()
            AnyView(self.model.lastXLabel)
        })
    }
    
    private func plotBody() -> some View {
        ZStack {
            // AnyView(model.innerMaxThreshold?.environment(\.chartBoundingBox, model.boundary)
            AnyView(self.model.maxThreshold?.environment(\.chartBoundingBox, self.model.boundary))
            AnyView(self.model.innerMinThreshold?.environment(\.chartBoundingBox, self.model.boundary))
            AnyView(self.model.minThreshold?.environment(\.chartBoundingBox, self.model.boundary))
            AnyView(self.model.targetPoints?.environment(\.chartBoundingBox, self.model.boundary))
            AnyView(self.model.chartPoints?.environment(\.chartBoundingBox, self.model.boundary))
        }
    }
}
