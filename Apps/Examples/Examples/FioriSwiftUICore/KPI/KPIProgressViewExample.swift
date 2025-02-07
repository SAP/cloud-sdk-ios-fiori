import FioriSwiftUICore
import SwiftUI

protocol NumberFormatterProvider {
    var numberFormatter: NumberFormatter { get }
}

extension KPIProgressExample: NumberFormatterProvider {
    var numberFormatter: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }
}

public struct KPIProgressExample: View {
    @State private var progress: Double = 0.66
    var minProgress = 0.0
    var maxProgress = 1.0
    
    var formattedProgress: String {
        String(format: "%.3f", self.progress)
    }
    
    public var body: some View {
        VStack {
            let percentData = KPIItemData.percent(self.progress)
            KPIProgressItem(kpiCaption: "Completed", data: .constant(percentData))
            Text("Progress: \(self.formattedProgress)")
                .font(.subheadline)
                .padding(.top, 10)
            Slider(value: self.$progress,
                   in: self.minProgress ... self.maxProgress,
                   minimumValueLabel: Text("0"),
                   maximumValueLabel: Text("100%")) {}
                .font(.subheadline)
        }
        .padding(.bottom, 10)
        List {
            Section(header: Text("% Percent Data")) {
                NavigationLink("Percentage without caption", destination: PercentageNoCaption())
                NavigationLink("Percentage with caption inside", destination: PercentageCaptionInside())
                NavigationLink("Percentage with footnote", destination: PercentageCaptionOutside())
                NavigationLink("Percentage disabled", destination: PercentageDisabled())
            }
            Section(header: Text("Σ Fraction Data")) {
                NavigationLink("Fraction without caption", destination: FractionNoCaption(numberFormatterProvider: self))
                NavigationLink("Fraction with caption inside", destination: FractionCaptionInside(numberFormatterProvider: self))
                NavigationLink("Fraction with footnote", destination: FractionCaptionOutside(numberFormatterProvider: self))
                NavigationLink("Fraction disabled", destination: FractionDisabled(numberFormatterProvider: self))
            }
            Section(header: Text("? Customized view")) {
                NavigationLink("Customized view", destination: Customization(numberFormatterProvider: self))
            }
        }
    }
}

struct KPIProgressPreview: PreviewProvider {
    static var previews: some View {
        Group {
            KPIProgressExample()
                .previewDevice(PreviewDevice(rawValue: "iPhone 16"))
                .previewDisplayName("iPhone 16")
        }
    }
}
