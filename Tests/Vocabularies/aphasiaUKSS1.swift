//
//  basicTest.swift
//  TouchChatTests
//
//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class e2e_TCHDWPLaunchaphasiaUKSS: XCTestCase {
    
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

    func testLaunchaphasiaUKSS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        pages.aphasiaVocab.tap()
        pages.aphasiaUKSS.tap()
        
        pages.verifyTheVocab(lastElement: "Scales", vocabWord: "Places", vocabElement: 7, nameElement: "Social")
        
        app.buttons["Shopping"].tap()
        XCTAssertTrue(app.buttons["supermarket "].exists)
        app.buttons["supermarket "].tap()
        
        pages.checkSdbText(sdbText: "Supermarket ")
        pages.backButton.tap()
        pages.backButton.tap()
    
        pages.backToVocab();
        
        print("aphasia UK SS Test Finished with success!")
        
        app.terminate()
    }
}







