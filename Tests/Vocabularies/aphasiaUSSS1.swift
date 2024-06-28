//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class e2e_TCHDWPLaunchaphasiaUSSS: XCTestCase {
    
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
    
    func testLaunchaphasiaUSSS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.aphasiaVocab.tap()
        pages.aphasiaUSSS.tap()
        
        pages.verifyTheVocab(lastElement: "Scales", vocabWord: "Me", vocabElement: 10, nameElement: "Clear")
        
        app.buttons["Feelings"].tap()
        XCTAssertTrue(app.buttons["happy"].exists)
        app.buttons["happy"].tap()
        
        pages.checkSdbText(sdbText: "Happy ")
        pages.backButton.tap()
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("aphasia US SS Test Finished with success!")
        
        app.terminate()
    }
}








