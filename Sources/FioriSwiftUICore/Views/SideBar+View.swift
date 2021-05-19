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
                .frame(height: 34)
            detail
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                .clipped()
            footer
                .frame(height: 77)
        }
    }
}

@available(iOS 14, *)
public extension SideBar where Detail == AnyView {
    /// Returns a side bar view with given configuration.
    /// - Parameters:
    ///   - subtitle: The view builder which returns the subtitle view.
    ///   - footer: The view builder which returns the footer view.
    ///   - listConfig: The configuration for constructing an expandable list of side bar items.
    init<Data, Header, Row, Destination>(@ViewBuilder subtitle: @escaping () -> Subtitle,
                                         @ViewBuilder footer: @escaping () -> Footer,
                                         listConfig: ExpandableList<Data, Header, Row, Destination>) where Data: RandomAccessCollection, Data.Element: Identifiable & Hashable,
        Header: View, Row: View, Destination: View
    {
        self.init(subtitle: subtitle, footer: footer, detail: { AnyView(listConfig) })
    }
}

@available(iOS 14, *)
public extension SideBar where Subtitle == _ConditionalContent<Text, EmptyView>, Detail == AnyView {
    /// Returns a side bar view with given configuration.
    /// - Parameters:
    ///   - subtitle: The subtitle string.
    ///   - footer: The view builder which returns the footer view.
    ///   - listConfig: The configuration for constructing an expandable list of side bar items.
    init<Data, Header, Row, Destination>(subtitle: String? = nil,
                                         @ViewBuilder footer: @escaping () -> Footer,
                                         listConfig: ExpandableList<Data, Header, Row, Destination>) where Data: RandomAccessCollection, Data.Element: Identifiable & Hashable,
        Header: View, Row: View, Destination: View
    {
        self.init(subtitle: { subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) },
                  footer: footer,
                  detail: { AnyView(listConfig) })
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
    ///   - listConfig: The configuration for constructing an expandable list of side bar items.
    init<Data, Header, Row, Destination>(subtitle: String? = nil,
                                         footerModel: ObjectItemModel? = nil,
                                         listConfig: ExpandableList<Data, Header, Row, Destination>? = nil) where Data: RandomAccessCollection, Data.Element: Identifiable & Hashable,
        Header: View, Row: View, Destination: View
    {
        self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
        self._footer = footerModel != nil ? ViewBuilder.buildEither(first: AnyView(makeFooterView(model: footerModel!))) : ViewBuilder.buildEither(second: EmptyView())
        self._detail = listConfig != nil ? ViewBuilder.buildEither(first: AnyView(listConfig)) : ViewBuilder.buildEither(second: EmptyView())
    }
}

func makeFooterView(model: ObjectItemModel) -> some View {
    ObjectItem(model: model)
        .detailImageModifier { $0.foregroundColor(.white).padding(.leading, 16) }
        .titleModifier { $0.foregroundColor(.white) }
        .subtitleModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
        .background(Color.preferredColor(.footer, background: .darkConstant))
}

/// Defines an expandable list which supports multi-level hierarchy with the ability to select a single item.
@available(iOS 14, *)
public struct ExpandableList<Data, Header, Row, Destination>: View where Data: RandomAccessCollection, Data.Element: Identifiable & Hashable, Header: View, Row: View, Destination: View {
    let data: Data
    
    let children: KeyPath<Data.Element, Data?>
    
    @Binding var selectedItem: Data.Element?
    
    var contentView: AnyView!
    
    /// Creates an expandable list from a collection of data which supports multi-level hierarchy with the ability to select a single item.
    /// - Parameters:
    ///   - data: The data for constructing the list.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to the selected data element.
    ///   - headerContent: The view builder which returns the content of section headers in an expandable list.
    ///   - rowContent: The view builder which returns the content of each row in an expandable list.
    ///   - destination: The view builder which returns the destination view when a row is selected.
    public init(data: Data,
                children: KeyPath<Data.Element, Data?>,
                selection: Binding<Data.Element?>,
                @ViewBuilder headerContent: @escaping (Data.Element) -> Header,
                @ViewBuilder rowContent: @escaping (Data.Element) -> Row,
                @ViewBuilder destination: @escaping (Data.Element) -> Destination? = { _ in nil })
    {
        self.data = data
        self.children = children
        self._selectedItem = selection
        self.contentView = ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(spacing: 0) {
                ForEach(data) { item in
                    if let _children = children, let childElements = item[keyPath: _children] {
                        ExpandableSection(list: {
                            ExpandableList(data: childElements,
                                           children: children,
                                           selection: selection,
                                           headerContent: headerContent,
                                           rowContent: rowContent,
                                           destination: destination).contentView
                        }, header: {
                            headerContent(item)
                        })
                    } else {
                        if item == selection.wrappedValue {
                            rowContent(item)
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
                            rowContent(item)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selection.wrappedValue = item
                                }
                        }
                    }
                }
            }
        })
            .typeErased
    }
    
    public var body: some View {
        contentView
    }
}

@available(iOS 14, *)
public extension ExpandableList where Header == SideBarListSectionHeader<Text>, Row == SideBarListItem<_ConditionalContent<Image, EmptyView>, Text, _ConditionalContent<Text, EmptyView>, _ConditionalContent<Image, EmptyView>> {
    /// Creates an expandable list from a collection of data which supports multi-level hierarchy with the ability to select a single item.
    /// - Parameters:
    ///   - data: The data for constructing the list.
    ///   - children: The key path to the optional property of a data element whose value indicates the children of that element.
    ///   - selection: A binding to the selected data element.
    ///   - headerModel: A closure which returns the content model of section headers in an expandable list.
    ///   - rowModel: A closure which returns the content model of each row in an expandable list.
    ///   - destination: The view builder which returns the destination view when a row is selected.
    init(data: Data,
         children: KeyPath<Data.Element, Data?>,
         selection: Binding<Data.Element?>,
         headerModel: @escaping (Data.Element) -> SideBarListSectionHeaderModel,
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
                                           headerModel: headerModel,
                                           rowModel: rowModel,
                                           destination: destination)
                        }, header: {
                            SideBarListSectionHeader(model: headerModel(item))
                        })
                    } else {
                        if item == selection.wrappedValue {
                            SideBarListItem(model: rowModel(item))
                                .modifier(ListItemBackgroundSelectionStyle())
                                .iconModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
                                .titleModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
                                .detailModifier { $0.foregroundColor(.preferredColor(.primaryLabel)) }
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
        })
            .background(Color.preferredColor(.header))
            .typeErased
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
                header().padding(.leading, 11)
                Spacer()
                Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 11)
                    .foregroundColor(.preferredColor(.tintColor, display: .contrast))
                    .onTapGesture {
                        isExpanded.toggle()
                    }
            }
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
