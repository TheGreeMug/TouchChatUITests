//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchCommunicationJourneyFrancais: XCTestCase {
    
   
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

    func testLaunchCommunityJourneyFrancaisSS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        
        pages.frenchVocab.tap()
        pages.communicationFrancaisSS.tap()
        
        pages.verifyTheVocab(lastElement: "Échelles", vocabWord: "Social", vocabElement: 3, nameElement: "Objets")
        
        XCTAssertTrue(app.buttons["Comment ça va?"].exists)
        app.buttons["Comment ça va?"].tap()
        
        pages.checkSdbText(sdbText: "Comment ça va? ")
        pages.backButton.tap()
        
        pages.backToVocab();
        
        print("Communication francais Test Finished with success!")
        
        app.terminate()
        
    }
}



































