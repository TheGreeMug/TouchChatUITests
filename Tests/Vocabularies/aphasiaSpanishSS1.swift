//
//  basicTest.swift
//  TouchChatTests
//
//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class e2e_TCHDWPLaunchaphasiaSpanishSS: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
        clearAppCache()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func clearAppCache(){
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
    }

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        //Set this to false in order to run it only once on the default configuration
        false
    }

    override func setUpWithError() throws {
        //XCUIDevice.shared.orientation = .portrait
        continueAfterFailure = false
    }

       
    
    func testLaunchaphasiaSpanishSS() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        XCUIApplication().tables.staticTexts["Aphasia  "].tap()
        XCUIApplication().tables.staticTexts["Aphasia Spanish SS  "].tap()
        
        let elements = app.buttons.allElementsBoundByIndex
        let eighthElement = elements[7]
        let aphasiaSpanishWord = app.buttons["Despejar"]
        
        XCTAssertGreaterThan(elements.count, 7, "There are not enough elements")
        XCTAssertEqual(eighthElement.label, "Despejar", "The title is correct")
        XCTAssertTrue(aphasiaSpanishWord.exists);
        
        
        app.buttons["Yo"].tap()
        app.buttons["Emociones (hombre)"].tap()
        XCTAssertTrue(app.buttons["estresado"].exists)
        app.buttons["estresado"].tap()
        
        
        let sdbElement = app.textFields["Estresado "]
        XCTAssertTrue(sdbElement.exists, "Searched text not found")
        
        app.buttons["Back"].tap()
        app.buttons["Back"].tap()
        
        app.navigationBars.buttons["Vocab"].tap()
        app.popovers.scrollViews.otherElements.buttons["Choose New Vocab"].tap()
        
        XCUIApplication().tables.staticTexts["MyCore SS  "].tap()
        
        print("Test Finished with success!")
        
        app.terminate()
        

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

//        let attachment = XCTAttachment(screenshot: app.screenshot())
//        attachment.name = "Launch Screen"
//        attachment.lifetime = .keepAlways
//        add(attachment)
    }
}






