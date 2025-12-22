import FioriThemeManager
import SwiftUI

struct NavigationBarDropdown: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selection: String = "Overview"
    
    var body: some View {
        List {
            switch self.selection {
            case "Overview":
                Section(header: Text("Overview")) {
                    Text("Welcome to the overview")
                    Text("High-level status and quick actions")
                    Text("Recent updates and highlights")
                }
            case "Details":
                Section(header: Text("Details")) {
                    Text("Detailed metrics and breakdown")
                    Text("Itemized list of components")
                    Text("Configuration specifics")
                }
            case "Analytics":
                Section(header: Text("Analytics")) {
                    Text("Charts and trends")
                    Text("KPIs and performance indicators")
                    Text("Forecast and anomalies")
                }
            case "Settings":
                Section(header: Text("Settings")) {
                    Text("Profile and preferences")
                    Text("Notifications and privacy")
                    Text("About & legal")
                }
            default:
                Section(header: Text("Selection")) { Text(self.selection) }
            }
        }
        .navigationTitle("Navigation toolbarTitleMenu")
        // Attach the menu to the title (iOS 17+)
        .toolbarTitleMenu {
            Picker("Select View", selection: self.$selection) {
                Text("Overview").tag("Overview")
                Text("Details").tag("Details")
                Text("Analytics").tag("Analytics")
                Text("Settings").tag("Settings")
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(self.selection)
                    .font(.fiori(forTextStyle: .subheadline)).fontWeight(.black)
            }
        }
    }
}

#Preview {
    NavigationStack {
        NavigationBarDropdown()
    }
}
