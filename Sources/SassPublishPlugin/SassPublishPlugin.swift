/**
 *  Sass-plugin for Publish
 *  Copyright (c) Hejki 2020
 *  MIT license, see LICENSE file for details
 */

import Publish
import ShellOut

public extension Plugin {

    static func compileSass(sassFilePath: Path, cssFilePath: Path, compressed: Bool = false) -> Self {
        Plugin(name: "Sass") { context in
            let sassFile = try context.file(at: sassFilePath)
            let cssFile = try context.createOutputFile(at: cssFilePath)
            
            var args: [String] = []
            
            if compressed {
                args += ["--style=compressed", "--no-embed-sources"]
            }
            args += [sassFile.path, cssFile.path]
            
            do {
                try shellOut(to: "sass", arguments: args)
            } catch {
                print(error)
            }
        }
    }
}
