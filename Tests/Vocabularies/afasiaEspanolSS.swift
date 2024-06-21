//
//  basicTest.swift
//  TouchChatTests
//
//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class e2e_TCHDWPLaunchafasiaEspanolSS: XCTestCase {
    
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


       
    
    func testLaunchafasiaEspanolSS() throws {
        
        let pages = Pages(app: app)
        app.launch()
        
        
        pages.SpanishVocab.tap()
        pages.afasiaEspanol.tap()
        
        pages.verifyTheVocab(lastElement: "Escalas", vocabWord: "Mis Actividades", vocabElement: 3, nameElement: "Cosas")
        
        
        XCTAssertTrue(app.buttons["Terapia"].exists)
        app.buttons["Terapia"].tap()
        app.buttons["muy difícil"].tap()
        
        app.buttons["BackButton"].tap()
        
        pages.sdbTexts(sdbText: "Esto es muy ")
        
        pages.backButton.tap()
        pages.backButton.tap()
        
        pages.backToVocab();
        
        print("Afasia Espanol Test Finished with success!")
        
        app.terminate()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

//        let attachment = XCTAttachment(screenshot: app.screenshot())
//        attachment.name = "Launch Screen"
//        attachment.lifetime = .keepAlways
//        add(attachment)
    }
}






















