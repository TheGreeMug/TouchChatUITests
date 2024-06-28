//
//  basicTest.swift
//  TouchChatTests
//
//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class e2e_TCHDWPLaunchWordPower140SS: XCTestCase {
    
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        let pages = Pages(app: app)
        
        app = XCUIApplication()
        app.launchArguments.append("--reset")
        app.launch()
        pages.clearAppCache()
        pages.resetPersistentStorage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

       
    
    func testLaunchWordPower140SS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.wordPowerVocab.tap()
        pages.wordPower140Position.tap()
        pages.wordPower140SS.tap()
        
        pages.verifyTheVocab(lastElement: "under", vocabWord: "I...", vocabElement: 4, nameElement: "I...")
        
        XCTAssertTrue(app.buttons["I am"].exists)
        app.buttons["I am"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "I am ")
    
        pages.backToVocab();
        
        print("WordPower 140 SS Test Finished with success!")
        
        app.terminate()
    }
}















