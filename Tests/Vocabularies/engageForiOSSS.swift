//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class e2e_TCHDWPLaunchEngageiOSSS: XCTestCase {
    
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
    
    func testLaunchEngageForiOS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.engageForiOS.tap()
        
        pages.verifyTheVocab(lastElement: "i", vocabWord: "2 BUTTONS", vocabElement: 3, nameElement: "PRACTICE")
        
        XCTAssertTrue(app.buttons["Feelings"].exists)
        app.buttons["Feelings"].tap()
        app.buttons["happy"].tap()
        
        pages.checkSdbText(sdbText: "Happy ")
        pages.backButton.tap()
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("Engage for iOS SS Test Finished with success!")
        
        app.terminate()
    }
}










