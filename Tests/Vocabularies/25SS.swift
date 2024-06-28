//
//  basicTest.swift
//  TouchChatTests
//
//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class e2e_TCHDWPLaunchWordPower25SS: XCTestCase {
    
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

       
    
    func testLaunchWordPower25SS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.wordPowerVocab.tap()
        pages.wordPower25Position.tap()
        pages.wordPower25TouchScan.tap()
        
        pages.verifyTheVocab(lastElement: "stop", vocabWord: "I want", vocabElement: 4, nameElement: "clear")
        
        XCTAssertTrue(app.buttons["to eat"].exists)
        app.buttons["to eat"].tap()
        app.buttons["cookies"].tap()
        
        pages.checkSdbText(sdbText: "I want to eat cookies ")
        
        pages.backButton.tap()
        pages.backToVocab();
        
        print("WordPower 25 SS Test Finished with success!")
        
        app.terminate()
        

    }
}















