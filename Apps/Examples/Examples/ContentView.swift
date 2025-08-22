import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct ContentView: View {
    @State var showSettings = false
    @State var envLocale: Locale = .none
    
    @State var selectedDate: Date?
    @State var selectedDates: Set<Date>? = []
    @State var selectedRange: ClosedRange<Date>? = nil
    
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
                
                Section {
                    NavigationLink("Calendar - week") {
                        VStack {
                            CalendarView(style: .week)
                                .environment(\.isEventIndicatorVisible, true)
                                .environment(\.showWeekNumber, true)
                            
                            Spacer()
                        }
                    }
                    NavigationLink("Calendar - expandable") {
                        VStack {
                            CalendarView(style: .expandable)
                                .environment(\.isEventIndicatorVisible, true)
                                .environment(\.showWeekNumber, true)
                            
                            Spacer()
                        }
                    }
                    NavigationLink("Calendar - month") {
                        VStack {
                            CalendarView(style: .month)
                                .environment(\.isEventIndicatorVisible, true)
                                .environment(\.showWeekNumber, true)
                            
                            Spacer()
                        }
                    }
                    NavigationLink("Calendar - fullScreenMonth") {
                        VStack {
                            CalendarView(style: .fullScreenMonth, selectedDate: self.$selectedDate)
                                .environment(\.isEventIndicatorVisible, true)
                                .environment(\.showWeekNumber, true)
                            Spacer()
                        }
                    }
                    NavigationLink("Calendar - datesSelection") {
                        VStack {
                            CalendarView(style: .datesSelection, selectedDates: self.$selectedDates)
                                .environment(\.isEventIndicatorVisible, true)
                                .environment(\.showWeekNumber, true)
                            Spacer()
                        }
                    }
                    NavigationLink("Calendar - rangeSelection") {
                        VStack {
                            CalendarView(style: .rangeSelection, selectedRange: self.$selectedRange)
                                .environment(\.isEventIndicatorVisible, true)
                                .environment(\.showWeekNumber, true)
                            Spacer()
                        }
                    }
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
        .sheet(isPresented: self.$showSettings) {
            SettingsView(envLocale: self.$envLocale)
        }
        .ifApply(self.envLocale != .none) {
            $0.environment(\.locale, self.envLocale)
        }
        .onChange(of: self.selectedDate) {
            print("selectedDate:\(self.selectedDate ?? .now)")
        }
        .onChange(of: self.selectedDates) {
            print("selectedDates:\(self.selectedDates?.sorted() ?? [])")
        }
        .onChange(of: self.selectedRange) {
            if let selectedRange {
                print("selectedRange:\(selectedRange)")
            } else {
                print("No range selected")
            }
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
