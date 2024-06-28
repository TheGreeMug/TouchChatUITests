//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchwordPower48Espanol: XCTestCase {
    
   
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

       
    
    func testLaunchWordPower48EspanolSS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        
        pages.SpanishVocab.tap()
        pages.wordPowerEspanol48.tap()
        
        pages.verifyTheVocab(lastElement: "porque", vocabWord: "comer", vocabElement: 4, nameElement: "GENTE")
        
        
        XCTAssertTrue(app.buttons["que"].exists)
        app.buttons["que"].tap()
        app.buttons["el"].tap()
        
        pages.checkSdbText(sdbText: "Comer que el ")
        
        pages.backToVocab();
        
        print("Word Power 48 Espanol SS Test Finished with success!")
        
        app.terminate()
        
    }
}































