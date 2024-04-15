// swift-tools-version:5.5

/**
*  Sass-plugin for Publish
*  Copyright (c) Hejki 2020
*  MIT license, see LICENSE file for details
*/

import PackageDescription

let package = Package(
    name: "SassPublishPlugin",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "SassPublishPlugin",
            targets: ["SassPublishPlugin"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.9.0"),
        .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "SassPublishPlugin",
            dependencies: [
                .product(name: "Publish", package: "publish"),
                "ShellOut",
            ]
        ),
        .testTarget(
            name: "SassPublishPluginTests",
            dependencies: ["SassPublishPlugin"]
        ),
    ]
)
