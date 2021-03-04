# generate overview page
jazzy --sourcekitten-sourcefile ./jazzy/empty.json --clean --readme=./jazzy/Overview_README.md --disable-search --hide-documentation-coverage
# generate FioriCharts documentation
sourcekitten doc --module-name FioriCharts -- -scheme FioriSwiftUI-Package -sdk iphonesimulator > charts.json
jazzy --sourcekitten-sourcefile charts.json --output docs/charts --readme=./jazzy/FioriCharts_README.md --module "FioriCharts"
# generate FioriIntegrationCards documentation
sourcekitten doc --module-name FioriIntegrationCards -- -scheme FioriSwiftUI-Package -sdk iphonesimulator > integrationCards.json
jazzy --sourcekitten-sourcefile integrationCards.json --output docs/integrationCards --readme=./jazzy/FioriIntegrationCards_README.md --module "FioriIntegrationCards"
