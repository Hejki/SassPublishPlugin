/**
 *  Sass-plugin for Publish
 *  Copyright (c) Hejki 2020
 *  MIT license, see LICENSE file for details
 */

import XCTest
import Publish
import Plot
import SassPublishPlugin
import Files

final class SassPublishPluginTests: XCTestCase {

    static var testDirPath: Path {
        let thisSourceFile = URL(fileURLWithPath: #file)
        return Path(thisSourceFile.deletingLastPathComponent().path)
    }

    private let sass: Path = "styles.sass"
    private let css: Path = "styles.css"

    private var outputFolder: Folder? {
        try? Folder(path: Self.testDirPath.appendingComponent("Output").absoluteString)
    }

    private var outputFile: File? {
        try? outputFolder?.file(named: "styles.css")
    }

    override func setUp() {
        try? outputFolder?.delete()
    }

    override func tearDown() {
        try? outputFolder?.delete()
        try? Folder(path: Self.testDirPath.appendingComponent(".publish").absoluteString).delete()
    }

    func testCompileSassCustomOptions() throws {
        try Web().publish(at: Self.testDirPath, using: [
            .installPlugin(
                .compileSass(sassFilePath: sass, cssFilePath: css, compressed: false)
            )
        ])

        let cssOutput = try outputFile?.readAsString()
        XCTAssertEqual(cssOutput, """
        body {
          color: blue;
        }

        """)
    }

    func testCompileSassCompressed() throws {
        try Web().publish(at: Self.testDirPath, using: [
            .installPlugin(
                .compileSass(sassFilePath: sass, cssFilePath: css, compressed: true)
            )
        ])

        let cssOutput = try outputFile?.readAsString()
        XCTAssertEqual(cssOutput, """
        body{color:blue}

        """)
    }

    static var allTests = [
        ("testCompileSassCustomOptions", testCompileSassCustomOptions),
        ("testCompileSassCompressed", testCompileSassCompressed),
    ]
}

private struct Web: Website {
    var url = URL(string: "http://httpbin.org")!
    var name = "test"
    var description = ""
    var language: Language = .english
    var imagePath: Path? = nil

    enum SectionID: String, WebsiteSectionID {
        case test
    }

    struct ItemMetadata: WebsiteItemMetadata {
    }
}
