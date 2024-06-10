//
//  XCUIElement+Extensions.swift
//  TouchChatUITests
//
//  Created by Marius N on 07.06.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
    func waitForExistence(timeout: TimeInterval) -> Bool {
        let existsPredicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: self)
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
        return result == .completed
    }
    
    func printAllIdentifiers() {
        for descendant in self.descendants(matching: .any).allElementsBoundByIndex {
            print("Identifier: \(descendant.identifier), Label: \(descendant.label)")
        }
    }
}
