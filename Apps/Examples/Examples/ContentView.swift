import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct ContentView: View {
    @State var showSettings = false
    @State var envLocale: Locale = .none
    @State var fioriLocale: Locale = .none
    @State private var globalToastMessageSettings = GlobalToastMessageSettings()
    let globalToastMessageCustomStyle = ToastMessageRoundedBorderStyle(cornerRadius: 0, backgroundColor: .mint, borderWidth: 2, borderColor: .purple)

    var body: some View {
        NavigationStack {
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
        .toastMessage(isPresented: self.$globalToastMessageSettings.isPresented,
                      icon: self.globalToastMessageSettings.isCustomized ? { Image(systemName: "info.circle").foregroundStyle(.orange) } : { Image(systemName: "info.circle") },
                      title: self.globalToastMessageSettings.isCustomized ? { Text("This is a Toast Message").foregroundStyle(.green) } : { Text("This is a Toast Message") },
                      duration: self.globalToastMessageSettings.duration,
                      verticalPosition: 0.8,
                      style: self.globalToastMessageSettings.isCustomized ? self.globalToastMessageCustomStyle : ToastMessageRoundedBorderStyle(),
                      accessibilityMessage: self.globalToastMessageSettings.accessibilityMessage)
        .environment(\.globalToastMessageSettings, self.$globalToastMessageSettings)
        .sheet(isPresented: self.$showSettings) {
            SettingsView(envLocale: self.$envLocale, fioriLocale: self.$fioriLocale)
        }
        .ifApply(self.envLocale != .none) {
            $0.environment(\.locale, self.envLocale)
        }
        .setFioriLocale(self.fioriLocale)
    }
}

struct SettingsView: View {
    @Binding var envLocale: Locale
    @Binding var fioriLocale: Locale

    var body: some View {
        List {
            Picker("Fiori Locale", selection: self.$fioriLocale) {
                Text("none").tag(Locale.none)
                ForEach(0 ..< self.supportedLocales.count, id: \.self) { index in
                    let locale = self.supportedLocales[index]
                    Text(locale.identifier).tag(locale)
                }
            }
            Picker("Environment Locale", selection: self.$envLocale) {
                Text("none").tag(Locale.none)
                ForEach(0 ..< self.supportedLocales.count, id: \.self) { index in
                    let locale = self.supportedLocales[index]
                    Text(locale.identifier).tag(locale)
                }
            }
        }
    }

    // "de", "en", "es", "fr", "it", "pt"
    let supportedLocales: [Locale] = ["de-CH", "de-DE", "en-US", "en-GB", "es-ES", "es-MX", "fr-CA", "fr-FR", "it-IT", "it-CH", "pt", "pt-PT", "ko-KR", "he-IL", "zh-CN", "zh-TW"]
        .map { Locale(identifier: $0) }
}

extension Locale {
    static var none: Locale {
        Locale(identifier: "")
    }
}
