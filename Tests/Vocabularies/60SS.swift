//
//  basicTest.swift
//  TouchChatTests
//
//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class e2e_TCHDWPLaunchWordPower60SS: XCTestCase {
    
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

       
    
    func testLaunchWordPower60SS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.wordPowerVocab.tap()
        pages.wordPower60Position.tap()
        pages.wordPower60SS.tap()
        
        pages.verifyTheVocab(lastElement: "out", vocabWord: "finish", vocabElement: 7, nameElement: "ACTIONS")
        
        XCTAssertTrue(app.buttons["the"].exists)
        app.buttons["the"].tap()
        app.buttons["and"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Finish ")
        
        pages.backToVocab();
        
        print("WordPower 60 SS Test Finished with success!")
        
        app.terminate()
    }
}




















