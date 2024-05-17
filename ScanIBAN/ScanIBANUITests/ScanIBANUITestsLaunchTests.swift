//
//  ScanIBANUITestsLaunchTests.swift
//  ScanIBANUITests
//
//  Created by Yassin El Mouden on 16/05/2024.
//

import XCTest

final class ScanIBANUITestsLaunchTests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()
    }

    func testIBanApp_shouldGoToScanView_whenTapScanButton() throws {
        app.buttons["scan"].tap()
        XCTAssert(app.staticTexts["Scan your IBAN"].exists)
    }
}
