//
//  BeneficiaryAddViewTests.swift
//
//
//

import DesignSystem
import SnapshotTesting
import SwiftUI
import Utils
import XCTest

@testable import IBANFeature

@MainActor
final class IBANScanViewTests: XCTestCase {

    class override func setUp() {
        isRecording = false
        configureSnapshotTest()
    }

    func testIBANScanView_shouldDisplayCorrectly_whenInit() async {
        let view = NavigationStack { IBANScanView(selectedIban: .constant("")) }

        let vc = convertToViewControllerForSnapshotTesting(view: view)

        assertSnapshot(of: vc, as: .image(on: .iPhone13))
    }

    func testIBANScanView_shouldDisplayCorrectly_whenIBANFound() async {
        let view = NavigationStack { IBANScanView(foundIBAN: "FR7714508000507175862396V28",  selectedIban: .constant("")) }

        let vc = convertToViewControllerForSnapshotTesting(view: view)

        assertSnapshot(of: vc, as: .image(on: .iPhone13))
    }
}

