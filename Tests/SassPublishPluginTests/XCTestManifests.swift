/**
 *  Sass-plugin for Publish
 *  Copyright (c) Hejki 2020
 *  MIT license, see LICENSE file for details
 */

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SassPublishPluginTests.allTests),
    ]
}
#endif
