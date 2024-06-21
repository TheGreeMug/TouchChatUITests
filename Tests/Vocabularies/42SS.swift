//  TouchChatTests
//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchWordPower42SS: XCTestCase {
    
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

       
    
    func testLaunchWordPower42SS() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        
        XCUIApplication().tables.staticTexts["WordPower  "].tap()
        XCUIApplication().tables.staticTexts["42 Position  "].tap()
        XCUIApplication().tables.staticTexts["WordPower42 SS  "].tap()
        
        let lastElement = app.buttons["with"]
        let existsTheElement = lastElement.waitForExistence(timeout: 5)
        XCTAssertTrue(existsTheElement, "The element is not visible")
        
        let elements = app.buttons.allElementsBoundByIndex
        let vocabElement = elements[9]
        let vocabWord = app.buttons["go"]
        
        XCTAssertGreaterThan(elements.count, 9, "There are not enough elements")
        XCTAssertEqual(vocabElement.label, "DESCRIBE", "The title is not correct")
        XCTAssertTrue(vocabWord.exists);
        
        vocabWord.tap()
        
        XCTAssertTrue(app.buttons["for a walk"].exists)
        app.buttons["for a walk"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        
        
        let sdbElement = app.textFields["Go for a walk "]
        XCTAssertTrue(sdbElement.exists, "Searched text not found")
        
        
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

















