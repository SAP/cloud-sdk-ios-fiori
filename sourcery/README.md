# Sourcery (Code Generation)

Used for FioriSwiftUICore component generation to ensure API consistency and to leverage common implementation logic

```bash
# use option `--disableCache` in case changes were done to utility swift package `./sourcery/.lib`

sourcery --config phase_pre_sourcery.yml # creates Component protocols
sourcery --config phase_main_sourcery.yml # creates ViewModels for single property components
sourcery --config phase_post_sourcery.yml # creates ViewModels which rely on other ViewModels
```

Use either Stencil templates or Swift templates.

For Swift templates you can outsource logic to a local utility Swift package located in `.lib` folder.

# Reference

- [Sourcery: Writing Templates](https://github.com/krzysztofzablocki/Sourcery/blob/master/guides/Writing%20templates.md)
- [Sourcery: Documentation](https://cdn.rawgit.com/krzysztofzablocki/Sourcery/master/docs/index.html)
- [Stencil: template language](https://stencil.fuller.li/en/latest/)
- [StencilSwiftKit: additional tags and filters in Stencil](https://github.com/SwiftGen/StencilSwiftKit)
- [VSCode extension for Stencil](https://github.com/MarcoEidinger/vscode-stencil) (install with `install.sh`)
- "Syntax highlighting / coloring" for `.swifttemplate`: map `*.swifttemplate` file association to `swift` language

# Notes

- Sourcery built-in daemon (`--watch`) does not work properly for Swift templates
- To uptake changes in utility Swift package run Sourcery with `--disableCache` option
