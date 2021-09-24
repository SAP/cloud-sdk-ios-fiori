# Sourcery (Code Generation)

Used for FioriSwiftUICore component generation to ensure API consistency and to leverage common implementation logic

```bash
# Generate comonent protocol declarations
sourcery --config .phase_one_sourcery.yml --disableCache
# Generate component APIs, component view body boilerplate, init extensions, model extensions.
sourcery --config .phase_two_sourcery.yml --disableCache
# Generate environment keys/values and view modidiers in view extension.
sourcery --config .phase_three_sourcery.yml --disableCache
# Generate component protocol extensions.
sourcery --config .phase_four_sourcery.yml --disableCache
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
- To quickly trigger code generation from VSCode as a task to run (Command+R) you can create `.vscode/tasks.json` in root folder
	```
	{
		"version": "2.0.0",
		"tasks": [
			{
				"label": "Generate everything",
				"type": "shell",
				"command": "bash allPhasesNoCache.sh",
				"options": {
					"cwd": "${workspaceFolder}/sourcery"
				}
			},
			{
				"label": "Generate Pre-Phase (Components)",
				"type": "shell",
				"command": "sourcery --config .phase_pre_sourcery.yml --disableCache",
				"options": {
					"cwd": "${workspaceFolder}/sourcery"
				}
			},
			{
				"label": "Generate Main-Phase (Models)",
				"type": "shell",
				"command": "sourcery --config .phase_main_sourcery.yml --disableCache",
				"options": {
					"cwd": "${workspaceFolder}/sourcery"
				}
			},
			{
				"label": "Generate Post-Phase (Composites)",
				"type": "shell",
				"command": "sourcery --config .phase_post_sourcery.yml --disableCache",
				"options": {
					"cwd": "${workspaceFolder}/sourcery"
				}
			}
		]
	}
	```
