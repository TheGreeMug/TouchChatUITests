//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchadult12SS: XCTestCase {
    
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

       
    
    func testLaunchadult12SS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.myQuickChatVocab.tap()
        pages.adultQuickChatVocab.tap()
        pages.quickChatAdult12SS.tap()
        
        pages.verifyTheVocab(lastElement: "Interact", vocabWord: "People", vocabElement: 11, nameElement: "Clothes")
        
        XCTAssertTrue(app.buttons["Daughter"].exists)
        app.buttons["Daughter"].tap()
        
        pages.checkSdbText(sdbText: "Daughter ")
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("myQuickChat Adult 12SS Test Finished with success!")
        
        app.terminate()
    }
}












