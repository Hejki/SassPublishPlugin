// swift-tools-version:5.1

/**
*  Sass-plugin for Publish
*  Copyright (c) Hejki 2020
*  MIT license, see LICENSE file for details
*/

import PackageDescription

let package = Package(
    name: "SassPublishPlugin",
    products: [
        .library(
            name: "SassPublishPlugin",
            targets: ["SassPublishPlugin"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.1.0"),
        .package(url: "https://github.com/robinwalterfit/Swift-Sass.git", from: "1.0.1"),
    ],
    targets: [
        .target(
            name: "SassPublishPlugin",
            dependencies: ["Sass", "Publish"]
        ),
        .testTarget(
            name: "SassPublishPluginTests",
            dependencies: ["SassPublishPlugin"]
        ),
    ]
)
