//
//  IBANValidationTests.swift
//  
//
//  Created by Yassin El Mouden on 16/05/2024.
//

import Nimble
import XCTest

@testable import Utils

final class IBANValidationTests: XCTestCase {
    
    func testIBANValidation_shouldReturnTrue_whenIbanIsValid() {
        let iban = "FR7630003000501987483646G79"
        expect(iban.isValidFrenchIBAN) == true
    }

    func testIBANValidation_shouldReturnFalse_whenIbanISMalFormatted() {
        let iban = "FR763M003000501987483646G78"
        expect(iban.isValidFrenchIBAN) == false
    }

    func testIBANValidation_shouldReturnFalse_whenIBanHasBadLength() {
        let iban = "FR76300030005019874836G78"
        expect(iban.isValidFrenchIBAN) == false
    }

    func testIBANValidation_shouldReturnFalse_whenIbanHasControlKey() {
        let iban = "FR7630003000501987483646G78"
        expect(iban.isValidFrenchIBAN) == false
    }
}
