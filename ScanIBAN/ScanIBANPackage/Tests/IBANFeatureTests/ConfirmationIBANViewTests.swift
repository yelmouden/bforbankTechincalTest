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
final class ConfirmationIBANViewTests: XCTestCase {

    class override func setUp() {
        isRecording = false
        configureSnapshotTest()
    }

    func testConfirmationIBANViews_shouldDisplayCorrectly_whenInit() async {
        let view = NavigationStack {
            MainContainer {
                VStack {
                    Spacer()
                    ConfirmationIBANView(iban: "FR7714508000507175862396V28", onValidate: {}, onRetry: {})

                }
            }
        }

        let vc = convertToViewControllerForSnapshotTesting(view: view)

        assertSnapshot(of: vc, as: .image(on: .iPhone13))
    }
}

