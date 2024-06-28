//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchwordPower60Francais: XCTestCase {
    
   
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

    func testLaunchWordPower60FrancaisSS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.frenchVocab.tap()
        pages.wordPower60FrancaisSS.tap()
        
        pages.verifyTheVocab(lastElement: "tout", vocabWord: "je", vocabElement: 4, nameElement: "ABC 123")
        
        XCTAssertTrue(app.buttons["donne"].exists)
        app.buttons["donne"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Je ")
        
        pages.backToVocab();
        
        print("WordPower 60 Francais Test Finished with success!")
        
        app.terminate()
        
    }
}








































