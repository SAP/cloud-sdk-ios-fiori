# generate overview page
jazzy --sourcekitten-sourcefile ./jazzy/empty.json --clean --readme=./jazzy/Overview_README.md --disable-search --hide-documentation-coverage

# generate FioriThemeManager documentation
sourcekitten doc --module-name FioriThemeManager -- -scheme FioriSwiftUI-Package -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 13' > theme.json
jazzy --sourcekitten-sourcefile theme.json --output docs/themeManager --readme=./jazzy/FioriThemeManager_README.md --module "FioriThemeManager"

# generate FioriCharts documentation
sourcekitten doc --module-name FioriCharts -- -scheme FioriSwiftUI-Package -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 13' > charts.json
jazzy --sourcekitten-sourcefile charts.json --output docs/charts --readme=./jazzy/FioriCharts_README.md --module "FioriCharts"

# generate FioriSwiftUICore documentation
sourcekitten doc --module-name FioriSwiftUICore -- -scheme FioriSwiftUI-Package -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 13' > fioriswiftui.json
jazzy --sourcekitten-sourcefile fioriswiftui.json --output docs/fioriswiftui --readme=./jazzy/FioriSwiftUICore_README.md --module "FioriSwiftUICore"
