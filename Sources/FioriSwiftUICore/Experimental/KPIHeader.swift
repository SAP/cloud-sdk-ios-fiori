import Foundation
import SwiftUI

public protocol KPIListModel: KPIListComponent {}

public protocol KPIListComponent {
    var kpis: [KPIModel]? { get }
}

public struct KPIHeader<KPIContainer: View> {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    private let _kpis: () -> KPIContainer

    public init(@ViewBuilder kpis: @escaping () -> KPIContainer) {
        self._kpis = kpis
    }

    @ViewBuilder var kpis: some View {
        _kpis()
    }
}

// Question: can the initializer be for everything?
public extension KPIHeader where KPIContainer == KPI<Text, _ConditionalContent<Image, EmptyView>> {
    init(oneKpi: [KPIModel]) {
        self._kpis = { ViewBuilder.buildBlock(KPI(model: oneKpi[0])) }
    }
}

public extension KPIHeader where KPIContainer == TupleView<(KPI<Text, _ConditionalContent<Image, EmptyView>>, KPI<Text, _ConditionalContent<Image, EmptyView>>)> {
    init(twoKpis: [KPIModel]) {
        self._kpis = { ViewBuilder.buildBlock(KPI(model: twoKpis[0]), KPI(model: twoKpis[1])) }
    }
}

public extension KPIHeader where KPIContainer == TupleView<(KPI<Text, _ConditionalContent<Image, EmptyView>>, KPI<Text, _ConditionalContent<Image, EmptyView>>, KPI<Text, _ConditionalContent<Image, EmptyView>>)> {
    init(threeKpis: [KPIModel]) {
        self._kpis = { ViewBuilder.buildBlock(KPI(model: threeKpis[0]), KPI(model: threeKpis[1]), KPI(model: threeKpis[2])) }
    }
}

extension Fiori {
    enum KPIHeader {
        typealias KPIList = EmptyModifier

        // TODO: - substitute type-specific ViewModifier for EmptyModifier
        /*
         // replace `typealias Subtitle = EmptyModifier` with:

         struct Subtitle: ViewModifier {
         func body(content: Content) -> some View {
         content
         .font(.body)
         .foregroundColor(.preferredColor(.primary3))
         }
         }
         */
        static let kpiList = KPIList()
    }
}

// TODO: - Implement KPI View body

extension KPIHeader: View {
    public var body: some View {
        if horizontalSizeClass == .compact {
            VStack(alignment: .leading) {
                kpis
            }
        } else {
            if #available(iOS 14.0, *) {
                TabView {
                    kpis
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            } else {
                HStack {
                    kpis
                }
            }
        }
    }
}

public struct KPIHeaderControl<Data, ID>: View where Data: RandomAccessCollection, ID: Hashable {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    private let data: Data
    private let dataId: KeyPath<Data.Element, ID>

    public var body: some View {
        if horizontalSizeClass == .compact {
            VStack(alignment: .leading) {
                ForEach(data, id: self.dataId) { element in
                    KPI(title: (element as! KPIModel).title_, icon: (element as! KPIModel).icon_)
                }
            }
        } else {
            if #available(iOS 14.0, *) {
                TabView {
                    ForEach(data, id: self.dataId) { element in
                        KPI(title: (element as! KPIModel).title_, icon: (element as! KPIModel).icon_)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            } else {
                HStack {
                    ForEach(data, id: self.dataId) { element in
                        KPI(title: (element as! KPIModel).title_, icon: (element as! KPIModel).icon_)
                    }
                }
            }
        }
    }
}

public extension KPIHeaderControl {
    /// Creates an instance that uniquely identifies views across updates based
    /// on the `id` key path to a property on an underlying data element.
    ///
    /// - Parameter data: A collection of data.
    /// - Parameter id: Key path to a property on an underlying data element.
    /// - Parameter content: A function that can be used to generate content on demand given underlying data.
    init(_ data: Data, id: KeyPath<Data.Element, ID>) {
        self.data = data
        self.dataId = id
    }
}

public extension KPIHeaderControl where ID == Data.Element.ID, Data.Element: Identifiable {
    /// Creates an instance that uniquely identifies views across updates based
    /// on the identity of the underlying data element.
    ///
    /// - Parameter data: A collection of identified data.
    /// - Parameter content: A function that can be used to generate content on demand given underlying data.
    init(_ data: Data) {
        self.data = data
        self.dataId = \Data.Element.id
    }
}

public struct KPILayoutContainer<Data, ID, Content>: View where Data: RandomAccessCollection, Content: View, ID: Hashable {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    private let data: Data
    private let dataId: KeyPath<Data.Element, ID>
    private let content: (Data.Element) -> Content

    private let maxNumerOfItems: Int = 2

    public var body: some View {
        if horizontalSizeClass == .compact {
            VStack(alignment: .leading) {
                ForEach(data.prefix(maxNumerOfItems), id: self.dataId) { element in
                    self.content(element)
                }
            }
        } else {
            if #available(iOS 14.0, *) {
                TabView {
                    ForEach(data.prefix(maxNumerOfItems), id: self.dataId) { element in
                        self.content(element)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            } else {
                HStack {
                    ForEach(data.prefix(maxNumerOfItems), id: self.dataId) { element in
                        self.content(element)
                    }
                }
            }
        }
    }
}

public extension KPILayoutContainer {
    /// Creates an instance that uniquely identifies views across updates based
    /// on the `id` key path to a property on an underlying data element.
    ///
    /// - Parameter data: A collection of data.
    /// - Parameter id: Key path to a property on an underlying data element.
    /// - Parameter content: A function that can be used to generate content on demand given underlying data.
    init(_ data: Data, id: KeyPath<Data.Element, ID>, content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.dataId = id
        self.content = content
    }
}

public extension KPILayoutContainer where ID == Data.Element.ID, Data.Element: Identifiable {
    /// Creates an instance that uniquely identifies views across updates based
    /// on the identity of the underlying data element.
    ///
    /// - Parameter data: A collection of identified data.
    /// - Parameter content: A function that can be used to generate content on demand given underlying data.
    init(_ data: Data, content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.dataId = \Data.Element.id
        self.content = content
    }
}
