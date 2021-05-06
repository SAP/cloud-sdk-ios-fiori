# utils

## NOTICE
**Important**: this Package is set up *just* to link against `SourceryRuntime` during dev/test.  During *generation*, `SourceryRuntime` is injected by the `sourcery` tool.  But, *no other dependencies* will be linked.  So, it does not make sense to introduce additional dependencies to this package.  

If you have functionality provided by another package (e.g. `swift-algorithms`), copy those files into a directory in this project.

> Stan has a working PR for sourcery which would add support for spm dependencies, but that is lower-priority since the `includeFile()` API meets our current requirements.

## Best Practices
1. Document the expected output of each API, which can be leveraged by the template.  E.g.

    ```swift
    /*
    public init( // starts here =>
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle, ...
    */
    public var viewBuilderInitParams: String {
       map({ "@ViewBuilder \($0.trimmedName): @escaping () -> \($0.trimmedName.capitalizingFirst())"}).joined(separator: ",\n\t\t")
    }
   ```
2. Use `public`/`internal` accessibility correctly, assuming at some future point the code may be consumed as a module.

