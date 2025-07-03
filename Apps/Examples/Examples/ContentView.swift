import FioriCharts
import SwiftUI

struct ContentView: View {
    @State var showSettings = false
    @State var envLocale: Locale = .none
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    // putting `ChartsContentView` in a `LazyView` allows to demonstrate that overridden colors will be applied by `FioriCharts` views
                    destination: LazyView(ChartsContentView())
                ) {
                    Text("Charts")
                }
                NavigationLink(
                    destination: CoreContentView())
                {
                    Text("Core Elements")
                }
                NavigationLink(
                    destination: FioriThemeManagerContentView())
                {
                    Text("Theme Manager")
                }
                
                #if DEBUG
                
                    Section {
                        NavigationLink("Date Range Picker") {
                            DateRangePickerExample()
                        }
                    }
                #endif
            }
            .navigationBarTitle("Examples")
            .navigationViewStyle(StackNavigationViewStyle())
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        self.showSettings.toggle()
                    }) {
                        Image(systemName: "gear.circle")
                    }
                }
            }
        }
        .sheet(isPresented: self.$showSettings) {
            SettingsView(envLocale: self.$envLocale)
        }
        .ifApply(self.envLocale != .none) {
            $0.environment(\.locale, self.envLocale)
        }
    }
}

struct SettingsView: View {
    @Binding var envLocale: Locale
    
    var body: some View {
        List {
            Picker("Environment Locale", selection: self.$envLocale) {
                Text("none").tag(Locale.none)
                ForEach(0 ..< self.supportedLocales.count, id: \.self) { index in
                    let locale = self.supportedLocales[index]
                    Text(locale.identifier).tag(locale)
                }
            }
        }
    }
    
    let supportedLocales: [Locale] = ["en", "de", "he", "zh-Hans"]
        .map { Locale(identifier: $0) }
}

extension Locale {
    static var none: Locale {
        Locale(identifier: "")
    }
}
