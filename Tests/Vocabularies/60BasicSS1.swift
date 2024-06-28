//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchWordPower60BasicSS: XCTestCase {
    
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
    
    func testLaunchWordPower60BasicSS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.wordPowerVocab.tap()
        pages.wordPower60Position.tap()
        pages.wordPower60BasicSS.tap()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "it", vocabElement: 9, nameElement: "SOCIAL")
        
        XCTAssertTrue(app.buttons["help"].exists)
        app.buttons["help"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "It ")
        
        pages.backToVocab();
        
        print("WordPower 60 Basic SS Test Finished with success!")
        
        app.terminate()
        
    }
}




















