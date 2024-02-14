import Foundation
import SwiftUI

extension Fiori {
    enum SideBar {
        struct Subtitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .frame(alignment: .leading)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                    .lineLimit(1)
                    .font(.fiori(fixedSize: 24))
                    .truncationMode(.tail)
                    .foregroundColor(.preferredColor(.primaryLabel))
            }
        }
        
        typealias SubtitleCumulative = EmptyModifier

        static let subtitle = Subtitle()
        static let subtitleCumulative = SubtitleCumulative()
    }
}

@available(iOS 14, *)
extension SideBar: View {
    public var body: some View {
        VStack(spacing: 0) {
            subtitle
                .frame(height: 34)
            detail
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                .clipped()
            footer
                .frame(maxHeight: 77)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

@available(iOS 14, *)
public extension SideBar where Detail == AnyView {
    /// Returns a side bar view with given configuration.
    /// - Parameters:
    ///   - subtitle: The view builder which returns the subtitle view.
    ///   - footer: The view builder which returns the footer view.
    ///   - list: The configuration for constructing an expandable list of side bar items.
    init<Data, Row, Destination>(@ViewBuilder subtitle: @escaping () -> Subtitle,
                                 @ViewBuilder footer: @escaping () -> Footer,
                                 list: ExpandableList<Data, Row, Destination>)
        where Data: RandomAccessCollection, Data.Element: Identifiable & Hashable,
        Row: View, Destination: View
    {
        self.init(subtitle: subtitle, footer: footer, detail: { AnyView(list) })
    }
}

@available(iOS 14, *)
public extension SideBar where Subtitle == _ConditionalContent<Text, EmptyView>, Detail == AnyView {
    /// Returns a side bar view with given configuration.
    /// - Parameters:
    ///   - subtitle: The subtitle string.
    ///   - footer: The view builder which returns the footer view.
    ///   - list: The configuration for constructing an expandable list of side bar items.
    init<Data, Row, Destination>(subtitle: String? = nil,
                                 @ViewBuilder footer: @escaping () -> Footer,
                                 list: ExpandableList<Data, Row, Destination>)
        where Data: RandomAccessCollection, Data.Element: Identifiable & Hashable,
        Row: View, Destination: View
    {
        self.init(subtitle: { subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) },
                  footer: footer,
                  detail: { AnyView(list) })
    }
}

@available(iOS 14, *)
public extension SideBar where Subtitle == _ConditionalContent<Text, EmptyView>,
    Footer == _ConditionalContent<AnyView, EmptyView>,
    Detail == _ConditionalContent<AnyView, EmptyView>
{
    /// Returns a side bar view with given configuration.
    /// - Parameters:
    ///   - subtitle: The subtitle string of a side bar.
    ///   - footerModel: Object item model for the footer view.
    ///   - list: The configuration for constructing an expandable list of side bar items.
    init<Data, Row, Destination>(subtitle: String? = nil,
                                 footerModel: ObjectItemModel? = nil,
                                 list: ExpandableList<Data, Row, Destination>? = nil)
        where Data: RandomAccessCollection, Data.Element: Identifiable & Hashable,
        Row: View, Destination: View
    {
        self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
        self._footer = footerModel != nil ?
            ViewBuilder.buildEither(first: AnyView(_ObjectItem(model: footerModel!)
                    .detailImageModifier { $0.foregroundColor(.preferredColor(.primaryLabel))
                        .padding(.leading, 16)
                    }
                    .titleModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
                    .subtitleModifier { $0.foregroundColor(.preferredColor(.tertiaryLabel)) }
                    .background(Color.preferredColor(.quarternaryFill))))
            : ViewBuilder.buildEither(second: EmptyView())
        self._detail = list != nil ? ViewBuilder.buildEither(first: AnyView(list)) : ViewBuilder.buildEither(second: EmptyView())
    }
}

/// Defines an expandable list which supports multi-level hierarchy with the ability to select a single item.
@available(iOS 14, *)
public struct ExpandableList<Data, Row, Destination>: View where Data: RandomAccessCollection, Data.Element: Identifiable & Hashable, Row: View, Destination: View {
    var contentView: AnyView!
    
    /// Creates an expandable list from a collection of data which supports multi-level hierarchy with the ability to select a single item.
    /// - Parameters:
    ///   - data: The data for constructing the list.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to the selected data element.
    ///   - rowContent: The view builder which returns the content of each row in an expandable list.
    ///   - destination: The view builder which returns the destination view when a row is selected.
    public init(data: Data,
                children: KeyPath<Data.Element, Data?>,
                selection: Binding<Data.Element?>,
                @ViewBuilder rowContent: @escaping (Data.Element) -> Row,
                @ViewBuilder destination: @escaping (Data.Element) -> Destination? = { _ in nil })
    {
        self.contentView = ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(spacing: 0) {
                ForEach(data) { item in
                    if let childElements = item[keyPath: children] {
                        ExpandableSection(list: {
                            ExpandableList(data: childElements,
                                           children: children,
                                           selection: selection,
                                           rowContent: rowContent,
                                           destination: destination).contentView
                        }, header: {
                            RowContentContainer<Data, Row>(item: item,
                                                           rowContent: rowContent(item),
                                                           selectionBinding: selection)
                                .environment(\.sideBarListItemConfigMode, SideBarListItemConfig(isSelected: false, isHeaderContent: true))
                        }, isModelInit: false)
                    } else {
                        if item == selection.wrappedValue {
                            RowContentContainer<Data, Row>(item: item,
                                                           rowContent: rowContent(item),
                                                           selectionBinding: selection)
                                .environment(\.sideBarListItemConfigMode, SideBarListItemConfig(isSelected: true, isHeaderContent: false))
                                .overlay(NavigationLink(destination: destination(item),
                                                        tag: item,
                                                        selection: selection,
                                                        label: { EmptyView() })
                                        .buttonStyle(PlainButtonStyle()))
                        } else {
                            RowContentContainer<Data, Row>(item: item,
                                                           rowContent: rowContent(item),
                                                           selectionBinding: selection)
                                .environment(\.sideBarListItemConfigMode, SideBarListItemConfig(isSelected: false, isHeaderContent: false))
                        }
                    }
                }
            }
        }).typeErased
    }
    
    public var body: some View {
        contentView
    }
}

@available(iOS 14, *)
public extension ExpandableList where Row == SideBarListItem<_ConditionalContent<Image, EmptyView>, Text, _ConditionalContent<Text, EmptyView>, _ConditionalContent<Image, EmptyView>> {
    /// Creates an expandable list from a collection of data which supports multi-level hierarchy with the ability to select a single item.
    /// - Parameters:
    ///   - data: The data for constructing the list.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to the selected data element.
    ///   - rowModel: A closure which returns the content model of each row in an expandable list.
    ///   - destination: The view builder which returns the destination view when a row is selected.
    init(data: Data,
         children: KeyPath<Data.Element, Data?>,
         selection: Binding<Data.Element?>,
         rowModel: @escaping (Data.Element) -> SideBarListItemModel,
         destination: @escaping (Data.Element) -> Destination)
    {
        self.contentView = ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(spacing: 0) {
                ForEach(data) { item in
                    if let group = item[keyPath: children] {
                        ExpandableSection(list: {
                            ExpandableList(data: group,
                                           children: children,
                                           selection: selection,
                                           rowModel: rowModel,
                                           destination: destination)
                        }, header: {
                            Text(rowModel(item).title)
                                .lineLimit(1)
                                .font(.fiori(fixedSize: 17.0))
                                .truncationMode(.tail)
                                .foregroundColor(.preferredColor(.tertiaryLabel))
                        }, isModelInit: true)
                    } else {
                        if item == selection.wrappedValue {
                            SideBarListItem(model: rowModel(item))
                                .modifier(ListItemBackgroundSelectionStyle())
                                .environment(\.sideBarListItemConfigMode, SideBarListItemConfig(isSelected: true, isHeaderContent: false))
                                .overlay(NavigationLink(destination: destination(item),
                                                        tag: item,
                                                        selection: selection,
                                                        label: { EmptyView() })
                                        .buttonStyle(PlainButtonStyle()))
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selection.wrappedValue = item
                                }
                        } else {
                            SideBarListItem(model: rowModel(item))
                                .environment(\.sideBarListItemConfigMode, SideBarListItemConfig(isSelected: false, isHeaderContent: false))
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selection.wrappedValue = item
                                }
                        }
                    }
                }
            }
        }).typeErased
    }
}

@available(iOS 14, *)
public extension ExpandableList where Destination == EmptyView {
    /// Creates an expandable list from a collection of data which supports multi-level hierarchy with the ability to select a single item. No destination view will be defined when using this initializer.
    /// - Parameters:
    ///   - data: The data for constructing the list.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to the selected data element.
    ///   - rowModel: A closure which returns the content model of each row in an expandable list.
    init(data: Data,
         children: KeyPath<Data.Element, Data?>,
         selection: Binding<Data.Element?>,
         @ViewBuilder rowContent: @escaping (Data.Element) -> Row)
    {
        self.init(data: data, children: children, selection: selection, rowContent: rowContent, destination: { _ in EmptyView() })
    }
}

@available(iOS 14, *)
struct ExpandableSection<Header, ListContent>: View where Header: View, ListContent: View {
    @State var isExpanded: Bool = true
    var list: () -> ListContent
    var header: () -> Header
    var isModelInit: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                header()
                Spacer()
                Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .padding(.trailing, isModelInit ? 0 : 16)
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .onTapGesture {
                        isExpanded.toggle()
                    }
            }.padding(isModelInit ? EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11) : EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            if !isExpanded {
                Rectangle()
                    .fill(Color.preferredColor(.separator))
                    .frame(height: 0.5)
            }
        }
        if isExpanded {
            list()
        }
    }
}

struct ListItemBackgroundSelectionStyle: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            content
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.preferredColor(.tertiaryFill)))
        }
    }
}

struct RowContentContainer<Data, Row>: View where Data: RandomAccessCollection, Data.Element: Identifiable & Hashable, Row: View {
    var item: Data.Element?
    var rowContent: Row
    var selectionBinding: Binding<Data.Element?>
    
    var body: some View {
        if item == selectionBinding.wrappedValue {
            rowContent
                .modifier(ListItemBackgroundSelectionStyle())
                .contentShape(Rectangle())
                .onTapGesture {
                    selectionBinding.wrappedValue = item
                }
        } else {
            rowContent
                .contentShape(Rectangle())
                .onTapGesture {
                    selectionBinding.wrappedValue = item
                }
        }
    }
}
