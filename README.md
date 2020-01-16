# Sass plugin for Publish

A [Publish](https://github.com/johnsundell/publish) plugin that makes it easy to integrate the [Swift-Sass](https://github.com/robinwalterfit/Swift-Sass.git) wrapper around LibSass C/C++ port of the Sass engine.

## Installation

To use this repository you need to install the LibSass Library first. See [this instructions](https://github.com/sass/libsass/blob/master/docs/build.md) for building/installing LibSass.

To install plugin into your [Publish](https://github.com/johnsundell/publish) package, add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        ...
        .package(url: "https://github.com/hejki/sasspublishplugin", from: "0.1.0")
    ],
    targets: [
        .target(
            ...
            dependencies: [
                ...
                "SassPublishPlugin"
            ]
        )
    ]
    ...
)
```

Then import SassPublishPlugin wherever you’d like to use it:

```swift
import SassPublishPlugin
```

For more information on how to use the Swift Package Manager, check out [this article](https://www.swiftbysundell.com/articles/managing-dependencies-using-the-swift-package-manager), or [its official documentation](https://github.com/apple/swift-package-manager/tree/master/Documentation).

## Usage

The plugin can then be used within any publishing pipeline like this:

```swift
import SassPublishPlugin
...
try DeliciousRecipes().publish(using: [
    .installPlugin(
        .compileSass(
            sassFilePath: "Sources/sass/styles.sass", 
            cssFilePath: "styles.css"
        )
    )
    ...
])
```

You can use predefined compressed sass options for minimal result:

```swift
.compileSass(
    sassFilePath: "Sources/sass/styles.sass", 
    cssFilePath: "styles.css",
    compressed: true
)
```

Or yse can define sass options manually:

```swift
.compileSass(sassFilePath: "styles.sass", cssFilePath: "styles.css") { options in
    options.setOutputStyle(.compact)
    options.setSourceComments(true)
}
```
