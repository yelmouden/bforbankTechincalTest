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
final class BeneficiaryAddViewTests: XCTestCase {

    class override func setUp() {
        isRecording = false
        configureSnapshotTest()
    }

    func testBeneficiaryAddView_shouldDisplayCorrectly_whenInit() async {
        let view = NavigationStack { BeneficiaryAddView() }

        let vc = convertToViewControllerForSnapshotTesting(view: view)

        assertSnapshot(of: vc, as: .image(on: .iPhone13))
    }

    func testBeneficiaryAddView_shouldDisplayCorrectly_whenIbanIsValid() async {
        let view = NavigationStack { BeneficiaryAddView(textIBAN: "FR7714508000507175862396V28") }

        let vc = convertToViewControllerForSnapshotTesting(view: view)

        assertSnapshot(of: vc, as: .image(on: .iPhone13))
    }
}

