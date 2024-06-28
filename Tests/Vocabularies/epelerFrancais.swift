//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchEpelerfrancais: XCTestCase {
    
   
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

    func testLaunchEpelerFrancaisSS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.frenchVocab.tap()
        pages.epelerFrancaisSS.tap()
        
        pages.verifyTheVocab(lastElement: "?", vocabWord: "PHRASES", vocabElement: 3, nameElement: "j'ai ")
        
        XCTAssertTrue(app.buttons["Bonjour!"].exists)
        app.buttons["Bonjour!"].tap()
        
        pages.checkSdbText(sdbText: "Bonjour, comment-allez vous? ")
        pages.backButton.tap()
        
        pages.backToVocab();
        
        print("Epeler Francais Test Finished with success!")
        
        app.terminate()
        
    }
}





































