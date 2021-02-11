import FioriSwiftUICore
import Foundation
import SwiftUI

class World: KPIModel, Identifiable {
    var title_: String {
        "Hello World"
    }

    var icon_: Image? {
        nil
    }

    var id: String {
        self.title_
    }
}

class Space: KPIModel, Identifiable {
    var title_: String {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = MeasurementFormatter.UnitStyle.medium
        let distanceInMiles = Measurement(value: 321, unit: UnitLength.miles)
        return formatter.string(from: distanceInMiles)
    }

    var icon_: Image? {
        nil
    }

    var id: String {
        self.title_
    }
}

class Universe: KPIModel, Identifiable {
    var title_: String {
        let number = NSNumber(value: 99.9)
        let formattedValue = self.formatter.string(from: number)
        return formattedValue ?? "Hello Universe"
    }

    var icon_: Image? {
        Image(systemName: "moon.zzz")
    }

    var id: String {
        self.title_
    }

    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

struct KPIHeaderFreestyleExample: View { // alignment (h/v) and potential pagination is responsibility of container
    var data: [KPIModel] = [World(), Space(), Universe()]

    var body: some View {
        VStack {
            ExpHeaderView("KPI Header", subtitle: "Header vs Layout container", desc: "semantic vs container. see code for comments")

            // pro: don't have to work with KPI view
            // con: no individual styling possible
            KPIHeaderControl(data, id: \.title_).titleModifier { $0.font(.headline).foregroundColor(.red) }

            // pro: can work with any view
            // pro: allow individual styling
            KPILayoutContainer(data, id: \.title_) { element in
                KPI {
                    Text(element.title_)
                } icon: {
                    if element.icon_ != nil {
                        element.icon_!
                    } else {
                        EmptyView()
                    }
                }
            }

            // pro: can restrict number of elements (i.e. only two KPIs will be shown even more were specified)
            KPILayoutContainer(0 ..< 6, id: \.self) { index in
                KPI {
                    Text("\(index)")
                } icon: {
                    EmptyView()
                }
            }

            // con: not possible to limit the number of views to be shown (only possible with model-based initializers)
            KPIHeader {
                KPI {
                    Text("One")
                } icon: {
                    Image(systemName: "square.and.pencil")
                }
                KPI {
                    Text("Two")
                } icon: {
                    Image(systemName: "square.and.pencil")
                }
                KPI {
                    Text("Three")
                } icon: {
                    Image(systemName: "square.and.pencil")
                }
                KPI {
                    Text("Four")
                } icon: {
                    Image(systemName: "square.and.pencil")
                }
                KPI {
                    Text("Five")
                } icon: {
                    Image(systemName: "square.and.pencil")
                }
                KPI {
                    Text("Six")
                } icon: {
                    Image(systemName: "square.and.pencil")
                }
                KPI {
                    Text("Seven")
                } icon: {
                    Image(systemName: "square.and.pencil")
                }
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
