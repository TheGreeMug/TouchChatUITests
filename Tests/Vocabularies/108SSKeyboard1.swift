//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchWordPower108SSKeyboard: XCTestCase {
    
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

       
    
    func testLaunchWordPower108SSKeyboard() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.wordPowerVocab.tap()
        pages.wordPower108Position.tap()
        pages.wordPower108SSKeyboard.tap()
        
        pages.verifyTheVocab(lastElement: "clear", vocabWord: "PEOPLE ", vocabElement: 3, nameElement: "PEOPLE ")
        
        XCTAssertTrue(app.buttons["mom"].exists)
        app.buttons["mom"].tap()
        app.buttons["T"].tap()
        app.buttons["E"].tap()
        app.buttons["S"].tap()
        pages.backButton.tap()
        app.buttons["more"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Mom ")
    
        pages.backToVocab();
        
        print("WordPower 108 Keyboard Test Finished with success!")
        
        app.terminate()
    
    }
}















