/**
 *  Sass-plugin for Publish
 *  Copyright (c) Hejki 2020
 *  MIT license, see LICENSE file for details
 */

import XCTest

import SassPublishPluginTests

var tests = [XCTestCaseEntry]()
tests += SassPublishPluginTests.allTests()
XCTMain(tests)
