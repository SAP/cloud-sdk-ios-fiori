import FioriSwiftUICore
import Foundation
import SwiftUI

class World: KPIItemModel, Identifiable {
    var kpi_: String? {
        "Hello World"
    }
    
    var subtitle_: String?
}

class Space: KPIItemModel, Identifiable {
    var kpi_: String? {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = MeasurementFormatter.UnitStyle.medium
        let distanceInMiles = Measurement(value: 321, unit: UnitLength.miles)
        return formatter.string(from: distanceInMiles)
    }
    
    var subtitle_: String?
}

class Universe: KPIItemModel, Identifiable {
    var kpi_: String? {
        let number = NSNumber(value: 99.9)
        let formattedValue = self.formatter.string(from: number)
        return formattedValue ?? "Hello Universe"
    }
    
    var subtitle_: String?

    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

struct KPIHeaderFreestyleExample: View { // alignment (h/v) and potential pagination is responsibility of container
    var data: [KPIItemModel] = [World(), Space(), Universe()]

    var body: some View {
        VStack {
            ExpHeaderView("KPI Header", subtitle: "Header vs Layout container", desc: "semantic vs container. see code for comments")

            // pro: don't have to work with KPI view
            // con: no individual styling possible
            KPIHeaderControl(data, id: \.kpi_).titleModifier { $0.font(.headline).foregroundColor(.red) }

            // pro: can work with any view
            // pro: allow individual styling
            KPILayoutContainer(data, id: \.kpi_) { element in
                KPIItem(kpi: {
                    Text(element.kpi_ ?? "")
                }, subtitle: {
                    if element.subtitle_ != nil {
                        Text(element.subtitle_!)
                    } else {
                        EmptyView()
                    }
                })
            }

            // pro: can restrict number of elements (i.e. only two KPIs will be shown even more were specified)
            KPILayoutContainer(0 ..< 6, id: \.self) { index in
                KPIItem(kpi: {
                    Text("\(index)")
                }, subtitle: {
                    EmptyView()
                })
            }

            // con: not possible to limit the number of views to be shown (only possible with model-based initializers)
            KPIHeader {
                KPIItem(kpi: {
                    Text("One")
                }, subtitle: {
                    if #available(iOS 14.0, *) {
                        Text(Image(systemName: "square.and.pencil"))
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                })
                KPIItem(kpi: {
                    Text("Two")
                }, subtitle: {
                    if #available(iOS 14.0, *) {
                        Text(Image(systemName: "square.and.pencil"))
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                })
                KPIItem(kpi: {
                    Text("Three")
                }, subtitle: {
                    if #available(iOS 14.0, *) {
                        Text(Image(systemName: "square.and.pencil"))
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                })
                KPIItem(kpi: {
                    Text("Four")
                }, subtitle: {
                    if #available(iOS 14.0, *) {
                        Text(Image(systemName: "square.and.pencil"))
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                })
                KPIItem(kpi: {
                    Text("Five")
                }, subtitle: {
                    if #available(iOS 14.0, *) {
                        Text(Image(systemName: "square.and.pencil"))
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                })
                KPIItem(kpi: {
                    Text("Six")
                }, subtitle: {
                    if #available(iOS 14.0, *) {
                        Text(Image(systemName: "square.and.pencil"))
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                })
                KPIItem(kpi: {
                    Text("Seven")
                }, subtitle: {
                    if #available(iOS 14.0, *) {
                        Text(Image(systemName: "square.and.pencil"))
                    } else {
                        Image(systemName: "square.and.pencil")
                    }
                })
            }
        }
        .environment(\.horizontalSizeClass, .regular)
    }
}

struct KPIHeaderFreestyleExample_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KPIHeaderFreestyleExample()
        }
    }
}
