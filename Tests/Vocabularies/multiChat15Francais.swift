//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchMultiChat15Francais: XCTestCase {
    
   
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

    func testLaunchMultiChat15FrancaisSS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.frenchVocab.tap()
        pages.multiChat15FrancaisSS.tap()
        
        pages.verifyTheVocab(lastElement: "Mon environnement", vocabWord: "J'ai besoin", vocabElement: 3, nameElement: "Questions ")
        
        XCTAssertTrue(app.buttons["de prendre un pause"].exists)
        app.buttons["de prendre un pause"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "J'ai besoin de prendre une ")
        
        pages.backToVocab();
        
        print("MultiChat15 Francais Test Finished with success!")
        
        app.terminate()
        
    }
}



































