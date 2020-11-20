import Foundation

public struct TableRow: Identifiable, Decodable, Hashable {
    public let columns: [TableColumn]?
    public let actions: [Action]?
    public let id = UUID()
}

extension TableRow: Placeholding {
    public func replacingPlaceholders(withValuesIn objects: Any...) -> TableRow {
        let _columns = self.columns?.map { $0.replacingPlaceholders(withValuesIn: objects) }
        let _actions = self.actions?.map { $0.replacingPlaceholders(withValuesIn: objects) }
        return TableRow(columns: _columns, actions: _actions /* , id: id */ )
    }
}
