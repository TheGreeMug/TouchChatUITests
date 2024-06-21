//
//  VocabPage.swift
//  TouchChatUITests
//
//  Created by Marius N on 06.06.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//  This page contains methods and elements from the Vocabs screen

import Foundation
import XCTest

class MainPage {
    
    let app: XCUIApplication
    let editButton: XCUIElement
    let menuButton: XCUIElement
    let doneButton: XCUIElement
    let upgradeStoreMButton: XCUIElement
    let iShareServiceMButton: XCUIElement
    let createNewVocabMButton: XCUIElement
    let copyVocabMButton: XCUIElement
    let copyVocabButton: XCUIElement
    let importExportMButton: XCUIElement
    let deleteAccountMButton: XCUIElement
    let helpMButton: XCUIElement
    let aboutMButton: XCUIElement
    let vocabTable: XCUIElement
    
    // Search Elements
    let cancelSearchButton: XCUIElement
    
    // General Elements
    let _1stTextField: XCUIElement
    let _2ndTextField: XCUIElement
    let _3rdTextField: XCUIElement
    let _4thTextField: XCUIElement
    let cancelMButton: XCUIElement
    let saveMButton: XCUIElement
    
    // Copy a Vocab Elements
    let vocabSpellingSS: XCUIElement
    let _4BasicSS: XCUIElement
    let copiedVocab: XCUIElement
    let deleteVocabButtonCircle: XCUIElement
    let deleteVocabButtonSquare: XCUIElement
    
    
    init(app: XCUIApplication, vocabName: String) {
        self.app = app
        editButton = app.buttons["Edit"]
        menuButton = app.buttons["Menu"]
        doneButton = app.buttons["Done"]
        upgradeStoreMButton = app.buttons["Upgrade Store"]
        iShareServiceMButton = app.buttons["iShare Service"]
        createNewVocabMButton = app.buttons["Create New Vocab"]
        copyVocabMButton = app.buttons["Copy a Vocab"]
        copyVocabButton = app.popovers.scrollViews.otherElements.buttons["Copy a Vocab"]
        importExportMButton = app.buttons["Import/Export Vocab"]
        deleteAccountMButton = app.buttons["Delete Account"]
        helpMButton = app.buttons["Help"]
        aboutMButton = app.buttons["About"]
        vocabTable = app.tables.staticTexts[vocabName]
        
        // Search Elements
        cancelSearchButton = app.buttons["Cancel"]
        
        // General Elements
        _1stTextField = app.textFields.element(boundBy: 0)
        _2ndTextField = app.textFields.element(boundBy: 1)
        _3rdTextField = app.textFields.element(boundBy: 2)
        _4thTextField = app.textFields.element(boundBy: 3)
        cancelMButton = app.buttons["Cancel"]
        saveMButton = app.buttons["Save"]
        
        // Copy a Vocab Elements
        vocabSpellingSS = app.staticTexts["Spelling SS"]
        _4BasicSS = app.staticTexts["4 Basic SS"]
        copiedVocab = app.staticTexts["copied vocabulary"]
        deleteVocabButtonCircle = app.tables/*@START_MENU_TOKEN@*/.images["minus.circle.fill"]/*[[".cells",".buttons[\"Remove Spelling SS Copy  Modified 30 May 2024 at 14:51, Copy of Spelling SS, ✓\"]",".images[\"remove\"]",".images[\"minus.circle.fill\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/
        deleteVocabButtonSquare = app.tables.buttons["Delete"]
    }
    
    func verifyTextExists(textVerified: String) {
        let staticText = app.staticTexts[textVerified]
        XCTAssertTrue(staticText.exists, "The text '\(textVerified)' does not exist on the screen.")
    }
    
    func verifyTextExistsScroll(_ text: String, maxScrolls: Int = 5) {
        var staticText = app.staticTexts[text]
        var scrollAttempts = 0
        while !staticText.exists && scrollAttempts < maxScrolls {
            app.swipeUp()
            scrollAttempts += 1
            staticText = app.staticTexts[text]
        }
        XCTAssertTrue(staticText.exists, "The static text '\(text)' does not exist on the screen after \(scrollAttempts) scroll attempts.")
    }
    
    func verifyTextDoesNotExistScroll(textVerified: String, maxScrolls: Int = 5, timeout: TimeInterval = 5) {
        var scrollAttempts = 0
        var textFound = false
        let textNotExistExpectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == false"), object: app.staticTexts[textVerified])
        while scrollAttempts < maxScrolls {
            let staticText = app.staticTexts[textVerified]
            if staticText.exists {
                let result = XCTWaiter.wait(for: [textNotExistExpectation], timeout: timeout)
                if result == .completed {
                    textFound = false
                    break
                } else {
                    textFound = true
                    break
                }
            }
            app.swipeUp()
            scrollAttempts += 1
        }
        XCTAssertFalse(textFound, "The text '\(textVerified)' was found on the screen after \(scrollAttempts) scroll attempts.")
    }
    
    func copyVocab(vocabType: XCUIElement, vocabName: String, vocabDescription: String) {
        menuButton.tap()
        copyVocabMButton.tap()
        vocabType.tap()
        _1stTextField.tap()
        _1stTextField.typeText(vocabName)
        _2ndTextField.tap()
        _2ndTextField.typeText(vocabDescription)
        saveMButton.tap()
    }
    
    func copySSVocab(vocabName: String, vocabDescription: String) {
        copyVocab(vocabType: vocabSpellingSS, vocabName: vocabName, vocabDescription: vocabDescription)
    }
    
    func copy4BasicSS(vocabName: String, vocabDescription: String) {
        copyVocab(vocabType: _4BasicSS, vocabName: vocabName, vocabDescription: vocabDescription)
    }
    // To add more vocabs
    
    func deleteVocabFromMainPage(vocabDesc:String) {
        editButton.tap()
        deleteVocabButtonCircle.tap()
        deleteVocabButtonSquare.tap()
        app.alerts["Delete Vocabulary"].scrollViews.otherElements.buttons["Continue"].tap()
        verifyTextDoesNotExistScroll(textVerified: vocabDesc, maxScrolls: 10)
    }
    
    func concatenateStringWithQQ(_ input: String) -> String {
        return input + "  "
    }
    
    func openVocab(vocabToOpen: XCUIElement, vocab: String) {
        
        let vocabToOpen = app.staticTexts.containing(NSPredicate(format: "label CONTAINS[c] %@", vocab)).firstMatch

    if vocabToOpen.exists && vocabToOpen.isHittable {
            vocabToOpen.tap()
        } else {
            print("The vocabulary you're trying to open does not exist or is not hittable")
        }
    }
}
