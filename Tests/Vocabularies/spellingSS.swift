//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchSpellingSS: XCTestCase {
    
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
    
    func testLaunchSpellingSS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.spellingSS.tap()
        
        pages.verifyTheVocab(lastElement: "BACKSPACE", vocabWord: "Mom ", vocabElement: 4, nameElement: "Is ")
        
        XCTAssertTrue(app.buttons["more "].exists)
        app.buttons["more "].tap()
        
        pages.checkSdbText(sdbText: "Mom more ")
    
        pages.backToVocab();
        
        print("Spelling SS Test Finished with success!")
        
        app.terminate()
    }
}












