//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchwordPower120Azerty: XCTestCase {
    
   
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

    func testLaunchWordPowerAzertySS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.frenchVocab.tap()
        pages.wordPower120Azerty.tap()
        
        pages.verifyTheVocab(lastElement: "efface tout", vocabWord: "je", vocabElement: 4, nameElement: "QUESTNS")
        
        XCTAssertTrue(app.buttons["'adore "].exists)
        app.buttons["'adore "].tap()
        
        pages.checkSdbText(sdbText: "J'adore ")
        
        pages.backToVocab();
        
        print("WordPower 120 Francais Azerty Test Finished with success!")
        
        app.terminate()
        
    }
}






































