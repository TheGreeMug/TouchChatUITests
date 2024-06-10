//
//  VocabPage.swift
//  TouchChatUITests
//
//  Created by Marius N on 07.06.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import Foundation
import XCTest

class VocabPage {
    
    //     private lazy var btnHomeScreen = app.buttons["Anasayfa"]
    
    let app: XCUIApplication
    var vocabName = "vocabulary"
    lazy var mainPage: MainPage = { return MainPage(app: XCUIApplication(), vocabName: vocabName) }()
    
    let vocabButton: XCUIElement
    let menuButton: XCUIElement
    let doneButton: XCUIElement
    let chooseNewVocab: XCUIElement
    let yesButton: XCUIElement
    
    // Menu Submenues
    let editAbbreviationMButton: XCUIElement
    
    // Abbreviations Buttons
    let abbreviationTitle: XCUIElement
    let addAbbreviationButton: XCUIElement
    let expandsToTextAbbreviation: XCUIElement
    let editAbbreviation: XCUIElement
    let restoreDefaultsAbbreviation: XCUIElement
    let clearAbbreviation: XCUIElement
    
    init(app: XCUIApplication, vocabName: String) {
        self.app = app
        
        vocabButton = app.buttons["Vocab"]
        menuButton = app.buttons["Menu"]
        doneButton = app.buttons["Done"]
        chooseNewVocab = app.buttons["Choose New Vocab"]
        yesButton = app.buttons["Yes"]
        
        // Menu Submenues
        editAbbreviationMButton = app.buttons["Edit Abbreviations"]
        
        // Abbreviation Elements
        abbreviationTitle = app.staticTexts["Abbreviations"]
        addAbbreviationButton = app.buttons["Add"]
        expandsToTextAbbreviation = app.staticTexts["Expands to"]
        editAbbreviation = app.buttons["Edit"]
        restoreDefaultsAbbreviation = app.buttons["Restore Defaults"]
        clearAbbreviation = app.buttons["Clear"]
    }
    
    func deleteVocabFromVocabPageIfExisting(textVerified: String, maxScrolls: Int = 5, timeout: TimeInterval = 5) {
        var scrollAttempts = 0
        var textFound = false
        
        while scrollAttempts < maxScrolls {
            let staticText = app.staticTexts[textVerified]
            
            // Check if the text exists
            if staticText.exists {
                textFound = true
                
                let mainPage = MainPage(app: app, vocabName: "vocab")
                app.tables.staticTexts[textVerified].tap()
                sleep(5)
                vocabButton.tap()
                chooseNewVocab.tap()
                mainPage.editButton.tap()
                mainPage.deleteVocabButtonCircle.tap()
                mainPage.deleteVocabButtonSquare.tap()
                app.alerts["Delete Vocabulary"].scrollViews.otherElements.buttons["Continue"].tap()
                mainPage.verifyTextDoesNotExistScroll(textVerified: textVerified, maxScrolls: 10)
                
                // Wait for the text to disappear
                let textNotExistExpectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == false"), object: staticText)
                let result = XCTWaiter.wait(for: [textNotExistExpectation], timeout: timeout)
                
                if result == .completed {
                    textFound = false
                    break
                } else {
                    textFound = true
                    break
                }
            }
            
            // Scroll up to continue searching
            app.swipeUp()
            scrollAttempts += 1
        }
        
        XCTAssertFalse(textFound, "The text '\(textVerified)' was found on the screen after \(scrollAttempts) scroll attempts.")
    }
    
    func openAbbreviation() {
        menuButton.tap()
        editAbbreviationMButton.tap()
        XCTAssertTrue(abbreviationTitle.exists)
    }
    
    func findButtonContainingText(_ text: String, timeout: TimeInterval = 10) -> XCUIElement? {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", text)
        let button = app.buttons.matching(predicate).firstMatch
        let exists = NSPredicate(format: "exists == 1")
        let expectation = XCTNSPredicateExpectation(predicate: exists, object: button)
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
        
        if result == .completed {
            return button
        } else {
            print("The button with label containing '\(text)' does not exist.")
            return nil
        }
    }
    
    func addAbbreviation(abbreviation: String, expandsTo: String) {
        addAbbreviationButton.tap()
        XCTAssert(expandsToTextAbbreviation.exists)
        mainPage._3rdTextField.tap()
        mainPage._3rdTextField.typeText(abbreviation)
        mainPage._4thTextField.tap()
        mainPage._4thTextField.typeText(expandsTo)
        mainPage.saveMButton.tap()
        if yesButton.exists { yesButton.tap() }
        let abbreviationAdded = app.staticTexts.containing(NSPredicate(format: "label CONTAINS[c] %@", abbreviation)).firstMatch
        XCTAssert(abbreviationAdded.exists)
        if abbreviationAdded.exists {
            print("The abbpreviation is added")
        } else {
            print("The abbreviation is not added/exists")
        }
    }
    
    //    func writeAAbbreviation(abbreviation.)
    //    func closeAbbreviationMenu()
    
    func deleteAbbreviation(abbreviation: String) {
        addAbbreviationButton.tap()
        XCTAssert(expandsToTextAbbreviation.exists)
        
    }
}
