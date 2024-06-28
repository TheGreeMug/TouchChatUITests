//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchmultiChat15SS: XCTestCase {
    
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
       

       
    
    func testLaunchmultiChat15SS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.SpanishVocab.tap()
        pages.multiChat15Spanish.tap()
        
        pages.verifyTheVocab(lastElement: "Mis escenas ", vocabWord: "Yo necesito", vocabElement: 4, nameElement: "Personas")
        
        XCTAssertTrue(app.buttons["ir a la oficina"].exists)
        app.buttons["ir a la oficina"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Yo necesito ir a la ")
        
        pages.backToVocab();
        
        print("MutiChat 15 Test Finished with success!")
        
        app.terminate()
      
    }
}
























