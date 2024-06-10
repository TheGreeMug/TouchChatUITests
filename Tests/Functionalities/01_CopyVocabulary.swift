//
//  01_CopyVocabulary.swift
//  TouchChatUITests
//
//  Created by Marius N on 06.06.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//  This test will create a new vocabulary

import XCTest

final class _1_CopyVocabulary: XCTestCase {
    
    var app = XCUIApplication()
    //var app: XCUIApplication
    
    let vocabularyName = "copied vocabulary"
    let vocabylaryDesc = "vocabulary description e2e"
    var vocabName = "vocabulary"
    lazy var mainPage: MainPage = {
        return MainPage(app: XCUIApplication(), vocabName: vocabName)
    }()
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
    
    func testCopyVocabulary() {
        mainPage.copy4BasicSS(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.verifyTextExists(textVerified: vocabylaryDesc)
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabylaryDesc)
    }
}
