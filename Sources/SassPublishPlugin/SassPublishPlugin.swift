/**
 *  Sass-plugin for Publish
 *  Copyright (c) Hejki 2020
 *  MIT license, see LICENSE file for details
 */

import Publish
import Sass

public extension Plugin {

    static func compileSass(sassFilePath: Path, cssFilePath: Path, compressed: Bool = false) -> Self {
        compileSass(sassFilePath: sassFilePath, cssFilePath: cssFilePath) { options in
            if compressed {
                options.setOutputStyle(.compact)
                options.setSourceComments(false)
                options.setSourceMapEmbed(false)
                options.setOmitSourceMapUrl(true)
                options.setSourceMapContents(false)
                options.setSourceMapFileUrls(false)
            } else {
                options.setOutputStyle(.expanded)
                options.setSourceComments(true)
            }
        }
    }

    static func compileSass(sassFilePath: Path, cssFilePath: Path, optionsModifier: @escaping (Sass.Options) -> Void) -> Self {
        Plugin(name: "Sass") { context in
            let sassFile = try context.file(at: sassFilePath)
            let cssFile = try context.createOutputFile(at: cssFilePath)
            let sass = Sass(input: sassFile.path, outputFile: cssFile.path)

            if let options = sass.options {
                optionsModifier(options)
            }
            do {
                try sass.compile()
            } catch {
                print(error)
            }
        }
    }
}
