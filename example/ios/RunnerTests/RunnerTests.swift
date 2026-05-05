import Flutter
import UIKit
import XCTest

// If your plugin has been explicitly set to "type: .dynamic" in the Package.swift,
// you will need to add your plugin as a dependency of RunnerTests within Xcode.

@testable import open_pdf

// This demonstrates a simple unit test of the Swift portion of this plugin's implementation.
//
// See https://developer.apple.com/documentation/xctest for more information about using XCTest.

class RunnerTests: XCTestCase {

  func testOpen() {
    let plugin = OpenPdfPlugin()

    let call = FlutterMethodCall(methodName: "open", arguments: ["filePath": "test.pdf"])

    let resultExpectation = expectation(description: "result block must be called.")
    plugin.handle(call) { result in
      XCTAssertFalse(result as! Bool)
      resultExpectation.fulfill()
    }
    waitForExpectations(timeout: 1)
  }

}
