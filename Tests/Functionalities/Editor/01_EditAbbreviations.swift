//
//  01_EditAbbreviations.swift
//  TouchChatUITests
//
//  Created by Marius N on 07.06.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class _1_EditAbbreviations: XCTestCase {
    
    var app = XCUIApplication()
    
    let vocabularyName = "copied vocabulary"
    let vocabylaryDesc = "vocabulary description e2e"
    var vocabName = "vocabulary"
    lazy var mainPage: MainPage = { return MainPage(app: XCUIApplication(), vocabName: vocabName) }()
    lazy var vocabPage: VocabPage = { return VocabPage(app: XCUIApplication(), vocabName: vocabName) }()
    let pages = Pages(app: XCUIApplication())
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app.launch()
        pages.clearAppCache()
        pages.resetPersistentStorage()
        pages.reachMenuPageIfOnVocabPage()
        pages.deleteVocabFromVocabPageIfExisting(textVerified: vocabylaryDesc, maxScrolls: 3, timeout: 5)
        pages.scrollUpUntilElementIsVisible(element: mainPage.cancelSearchButton)
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }
    
    func testAbbreviationsFunctionality() throws {
        
        mainPage.openVocab(vocabToOpen: mainPage._4BasicSS, vocab: "4 Basic SS ")
        vocabPage.openAbbreviation()
        vocabPage.addAbbreviation(abbreviation: "AA", expandsTo: "This expands to end to end on iOS")
        
        XCUIApplication().tables.staticTexts["Spelling SS  "].tap()
        let spellingVocabWord = app.buttons["PHRASES"]
        let elements = app.buttons.allElementsBoundByIndex
        let eighthElement = elements[7]
        let abbreviationsTitle = app.staticTexts["Abbreviations"]
        
        XCTAssertGreaterThan(elements.count, 8, "Nu exista suficiente elemente")
        
        XCTAssertEqual(eighthElement.label, "PHRASES", "The title is correct")
        XCTAssertTrue(spellingVocabWord.exists);
        
        
        let abbexists = abbreviationsTitle.waitForExistence(timeout: 5)
        
        XCTAssertTrue(abbexists, "The element was not found");
        //app.staticTexts["Abbreviations"].exists
        //add abbreviation
        
        app.buttons["Add"].tap()
        app.textFields.element(boundBy: 2).tap()
        app.textFields.element(boundBy: 2).typeText("end")
        app.textFields.element(boundBy: 3).tap()
        app.textFields.element(boundBy: 3).typeText("e2e new word")
        app.buttons["Save"].tap()
        
        app.buttons["Done"].tap()
        app.buttons["e"].tap()
        app.buttons["n"].tap()
        app.buttons["d"].tap()
        app.buttons["."].tap()
        
        //        let speechDisplayBar = app.otherElements.containing(NSPredicate(format: "label CONTAINS[c] %@", "Speech Display Bar")).firstMatch
        //        let expectedText = "e2e new word"
        
        //let group = app.otherElements["e2e new word"]
        
        //let staticTexts = group.staticTexts.allElementsBoundByIndex
        
        //        let textElement = speechDisplayBar.descendants(matching: .any).matching(NSPredicate(format: "label CONTAINS[c] %@", expectedText)).firstMatch
        //        let textExists = textElement.waitForExistence(timeout: 5)
        
        //        var isTextFound = false
        //        for staticText in app.descendants(matching: .any).allElementsBoundByIndex {
        //            if staticText.label == expectedText{
        //                isTextFound = true
        //                break
        //            }
        //        }
        //
        //        XCTAssertTrue(isTextFound, "The element was not found")
        
        //delete abbreviation
        
        app.navigationBars.buttons["Menu"].tap()
        app.buttons["Edit Abbreviations"].tap()
        app.buttons["Edit"].tap()
        
        let popoversQuery = XCUIApplication().popovers
        let toolbar = popoversQuery.toolbars["Toolbar"]
        
        toolbar.buttons["Edit"].tap()
        
        let tablesQuery = popoversQuery.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Remove end., e2e new word"]/*[[".cells.buttons[\"Remove end., e2e new word\"]",".buttons[\"Remove end., e2e new word\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells.buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        toolbar.buttons["Done"].tap()
        
        //Restore Defaults
        
        XCUIApplication().popovers.toolbars["Toolbar"].buttons["Restore Defaults"].tap()
        let warningDeleteModal = app.staticTexts["Are you sure you want to restore all default values?"]
        XCTAssertEqual(warningDeleteModal.label, "Are you sure you want to restore all default values?", "The title is not correct")
        
        app.buttons["Yes"].tap()
        app.buttons["Done"].tap()
        
        app.buttons["CLEAR "].tap()
        app.buttons["e"].tap()
        app.buttons["n"].tap()
        app.buttons["d"].tap()
        app.buttons["."].tap()
        
        print("Test Finished with success!")
        
    }
}
