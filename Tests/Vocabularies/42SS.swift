//  TouchChatTests
//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchWordPower42SS: XCTestCase {
    
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

       
    
    func testLaunchWordPower42SS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.wordPowerVocab.tap()
        pages.wordPower42Position.tap()
        pages.wordPower42SS.tap()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "go", vocabElement: 9, nameElement: "DESCRIBE")
        
        XCTAssertTrue(app.buttons["for a walk"].exists)
        app.buttons["for a walk"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Go for a walk ")
        
        pages.backToVocab();
        
        print("WordPower 42 SS Test Finished with success!")
        
        app.terminate()
    }
}

















