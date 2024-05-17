//
//  File.swift
//  
//
//  Created by Yassin El Mouden on 16/05/2024.
//

import Foundation

public extension String {

    var isValidFrenchIBAN: Bool {
        do {
            // swiftlint:disable:next line_length
            let pattern = "^FR[a-zA-Z0-9]{2}\\s?([0-9]{4}\\s?){2}([0-9]{2})([a-zA-Z0-9]{2}\\s?)([a-zA-Z0-9]{4}\\s?){2}([a-zA-Z0-9]{1})([0-9]{2})\\s?$"

            let regex = try NSRegularExpression(pattern: pattern)

            guard regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.count)) != nil else { return false }

            let textRemoveSpace = self.replacingOccurrences(of: "\\s", with: "", options: .regularExpression)
            var shiftedCharacters = textRemoveSpace.utf8.map { $0 }
            while shiftedCharacters.count < 4 {
                shiftedCharacters.append(0)
            }
            let shiftedCharactersCyclic = shiftedCharacters[4..<shiftedCharacters.count] + shiftedCharacters[0..<4]
            let calculatedChecksum = shiftedCharactersCyclic.reduce(0) { result, value -> Int in
                let i = Int(value)
                return i > 64 ? (100 * result + i - 55) % 97 : (10 * result + i - 48) % 97
            }

            return calculatedChecksum == 1

        } catch {
            return false
        }

    }
}
