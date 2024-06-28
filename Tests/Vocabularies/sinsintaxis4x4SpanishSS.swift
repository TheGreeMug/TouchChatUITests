//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchSinSintaxis4x4SpanishSS: XCTestCase {
    
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
//        app.terminate()
        try super.tearDownWithError()
    }

       
    
    func testLaunchSinSintaxis4x4SpanishSS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        
        pages.SpanishVocab.tap()
        pages.sintaxis4x4Spanish.tap()
        
        pages.verifyTheVocab(lastElement: "lugares", vocabWord: "casa", vocabElement: 3, nameElement: "comida")
        
        XCTAssertTrue(app.buttons["cochera"].exists)
        app.buttons["cochera"].tap()
        app.buttons["sala"].tap()
        
        pages.checkSdbText(sdbText: "Cochera sala ")
        
        
        pages.backButton.tap()
        
        pages.backToVocab()
        
        print("SinSintaxis 4x4 Spanish Test Finished with success!")
        
        app.terminate()
        
    }
}


























