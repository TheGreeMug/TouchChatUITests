//  TouchChatTests
//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchchild4SS: XCTestCase {
    
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

    
    func testLaunchchild4SS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.myQuickChatVocab.tap()
        pages.childQuickChatVocab.tap()
        pages.quickChatChild4SS.tap()
        
        pages.verifyTheVocab(lastElement: "Greetings/Closings", vocabWord: "Playing", vocabElement: 18, nameElement: "Greetings/Closings")
        
        XCTAssertTrue(app.buttons["Can I play?"].exists)
        app.buttons["Can I play?"].tap()
        
        pages.checkSdbText(sdbText: "Can I play? ")
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("myQuickChat Child 4SS Test Finished with success!")
        
        app.terminate()
    }
}















