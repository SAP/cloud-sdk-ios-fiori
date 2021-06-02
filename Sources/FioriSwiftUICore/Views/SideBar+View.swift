import Foundation
import SwiftUI

extension Fiori {
    enum SideBar {
        struct Subtitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .lineLimit(1)
                    .font(.system(size: 32))
                    .truncationMode(.tail)
                    .background(Color.preferredColor(.header))
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
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
                .frame(maxHeight: 34)
            detail
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                .clipped()
            footer
                .frame(maxHeight: 77)
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
            ViewBuilder.buildEither(first: AnyView(ObjectItem(model: footerModel!)
                    .detailImageModifier { $0.foregroundColor(.white).padding(.leading, 16) }
                    .titleModifier { $0.foregroundColor(.white) }
                    .subtitleModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
                    .background(Color.preferredColor(.footer, background: .darkConstant))))
            : ViewBuilder.buildEither(second: EmptyView())
        self._detail = list != nil ? ViewBuilder.buildEither(first: AnyView(list)) : ViewBuilder.buildEither(second: EmptyView())
    }
}

/// Defines an expandable list which supports multi-level hierarchy with the ability to select a single item.
@available(iOS 14, *)
public struct ExpandableList<Data, Row, Destination>: View where Data: RandomAccessCollection, Data.Element: Identifiable & Hashable, Row: View, Destination: View {
    let data: Data
    
    let children: KeyPath<Data.Element, Data?>
    
    @Binding var selectedItem: Data.Element?
    
    @ObservedObject var __selectedItem = ListSelectedItem<Data>()
    
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
        self.data = data
        self.children = children
        self._selectedItem = selection
        self.contentView = ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(spacing: 0) {
                ForEach(data) { [__selectedItem] item in
                    if let _children = children, let childElements = item[keyPath: _children] {
                        ExpandableSection(list: {
                            ExpandableList(data: childElements,
                                           children: children,
                                           selection: selection,
                                           rowContent: rowContent,
                                           destination: destination).contentView
                        }, header: {
                            RowContentContainer<Data, Row>(item: item,
                                                           rowContent: rowContent(item),
                                                           selectionBinding: selection,
                                                           selectedItem: __selectedItem)
                        })
                    } else {
                        if item == selection.wrappedValue {
                            RowContentContainer<Data, Row>(item: item,
                                                           rowContent: rowContent(item),
                                                           selectionBinding: selection,
                                                           selectedItem: __selectedItem)
                                .overlay(NavigationLink(destination: destination(item),
                                                        tag: item,
                                                        selection: selection,
                                                        label: { EmptyView() })
                                        .buttonStyle(PlainButtonStyle()))
                        } else {
                            RowContentContainer<Data, Row>(item: item,
                                                           rowContent: rowContent(item),
                                                           selectionBinding: selection,
                                                           selectedItem: __selectedItem)
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
         destination: @escaping (Data.Element) -> Destination? = { _ in nil })
    {
        self.data = data
        self.children = children
        self._selectedItem = selection
        self.contentView = ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(spacing: 0) {
                ForEach(data) { item in
                    if let _children = children, let group = item[keyPath: _children] {
                        ExpandableSection(list: {
                            ExpandableList(data: group,
                                           children: children,
                                           selection: selection,
                                           rowModel: rowModel,
                                           destination: destination)
                        }, header: {
                            Text(rowModel(item).title_)
                                .lineLimit(1)
                                .font(.system(size: 17.0))
                                .truncationMode(.tail)
                                .foregroundColor(.preferredColor(.quarternaryLabel, display: .contrast))
                        })
                    } else {
                        if item == selection.wrappedValue {
                            SideBarListItem(model: rowModel(item))
                                .modifier(ListItemBackgroundSelectionStyle())
                                .iconModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
                                .titleModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
                                .subtitleModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
                                .accessoryIconModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
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
    /// Creates an expandable list from a collection of data which supports multi-level hierarchy with the ability to select a single item.
    /// - Parameters:
    ///   - data: The data for constructing the list.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selectionBinding: A binding to the selected data element.
    ///   - selectedItem: (Internal) An observable object used to wrap the selected data element.
    ///   - rowModel: A closure which returns the content model of each row in an expandable list.
    init(data: Data,
         children: KeyPath<Data.Element, Data?>,
         selectionBinding: Binding<Data.Element?>,
         _selectedItem: ListSelectedItem<Data>,
         @ViewBuilder rowContent: @escaping (Data.Element) -> Row)
    {
        self.data = data
        self.children = children
        self._selectedItem = selectionBinding
        self.__selectedItem = _selectedItem
        self.contentView = ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(spacing: 0) { [__selectedItem] in
                ForEach(data) { item in
                    if let _children = children, let childElements = item[keyPath: _children] {
                        ExpandableSection(list: {
                            ExpandableList(data: childElements,
                                           children: children,
                                           selectionBinding: selectionBinding,
                                           _selectedItem: __selectedItem,
                                           rowContent: rowContent)
                        }, header: {
                            rowContent(item)
                        })
                    } else {
                        RowContentContainer<Data, Row>(item: item,
                                                       rowContent: rowContent(item),
                                                       selectionBinding: selectionBinding,
                                                       selectedItem: __selectedItem)
                    }
                }
            }
        }).typeErased
    }
}

@available(iOS 14, *)
struct ExpandableSection<Header, ListContent>: View where Header: View, ListContent: View {
    @State var isExpanded: Bool = true
    var list: () -> ListContent
    var header: () -> Header
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                header()
                Spacer()
                Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(.preferredColor(.tintColor, display: .contrast))
                    .onTapGesture {
                        isExpanded.toggle()
                    }
            }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
            if !isExpanded {
                Rectangle()
                    .fill(Color.preferredColor(.line))
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
                .background(RoundedRectangle(cornerRadius: 5, style: .continuous).fill(Color.preferredColor(.tintColor, display: .contrast)))
        }
    }
}

public class ListSelectedItem<Data>: ObservableObject where Data: RandomAccessCollection, Data.Element: Identifiable & Hashable {
    @Published public var value: Data.Element?
    public init(_ value: Data.Element? = nil) {
        self.value = value
    }
}

struct RowContentContainer<Data, Row>: View where Data: RandomAccessCollection, Data.Element: Identifiable & Hashable, Row: View {
    var item: Data.Element?
    var rowContent: Row
    var selectionBinding: Binding<Data.Element?>
    @ObservedObject var selectedItem: ListSelectedItem<Data>
    
    var body: some View {
        if item == selectedItem.value || item == selectionBinding.wrappedValue {
            rowContent
                .modifier(ListItemBackgroundSelectionStyle())
                .iconModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
                .titleModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
                .subtitleModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
                .accessoryIconModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
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
