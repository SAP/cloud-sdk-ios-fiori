# This script generates boilerpate code for styleable components.

sourcery --config .ComponentGeneration.yml --disableCache
swiftformat ../Sources/FioriSwiftUICore/_generated --exclude ../Sources/FioriSwiftUICore/_generated/Components, ../Sources/FioriSwiftUICore/_generated/ViewModels
