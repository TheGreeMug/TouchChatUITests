//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchwordPower25Espanol: XCTestCase {
    
   
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

       
    
    func testLaunchWordPower25EspanolSS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        
        pages.SpanishVocab.tap()
        pages.wordPowerEspanol25.tap()
        
        pages.verifyTheVocab(lastElement: "jugar", vocabWord: "toma", vocabElement: 4, nameElement: "borrar")
        
        
        XCTAssertTrue(app.buttons["una foto"].exists)
        app.buttons["una foto"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Toma una ")
        
        pages.backToVocab();
        
        print("Word Power 25 Espanol SS Test Finished with success!")
        
        app.terminate()
        
    }
}
































