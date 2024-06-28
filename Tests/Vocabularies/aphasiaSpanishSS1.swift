//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchaphasiaSpanishSS: XCTestCase {
    
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
       
    func testLaunchaphasiaSpanishSS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.aphasiaVocab.tap()
        pages.aphasiaSpanishSS.tap()
        
        pages.verifyTheVocab(lastElement: "Escalas", vocabWord: "Despejar", vocabElement: 7, nameElement: "Social")
        
        app.buttons["Yo"].tap()
        app.buttons["Emociones (hombre)"].tap()
        XCTAssertTrue(app.buttons["estresado"].exists)
        app.buttons["estresado"].tap()
        
        pages.checkSdbText(sdbText: "Estresado ")
        pages.backButton.tap()
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("aphasia Spanish SS Test Finished with success!")
        
        app.terminate()
        
    }
}






