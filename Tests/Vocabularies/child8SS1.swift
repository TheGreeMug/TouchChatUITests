//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchchild8SS: XCTestCase {
    
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

       
    
    func testLaunchchild8SS() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        XCUIApplication().tables.staticTexts["My QuickChat  "].tap()
        XCUIApplication().tables.staticTexts["Child  "].tap()
        XCUIApplication().tables.staticTexts["My QuickChat Child 8 SS  "].tap()
        
        let elements = app.buttons.allElementsBoundByIndex
        let twentiethElement = elements[19]
        let childWord = app.buttons["Greetings/Closings"]
        
        XCTAssertGreaterThan(elements.count, 19, "There are not enough elements")
        XCTAssertEqual(twentiethElement.label, "Greetings/Closings", "The title is correct")
        XCTAssertTrue(childWord.exists);
        
        childWord.tap()
        
        XCTAssertTrue(app.buttons["Hey!"].exists)
        app.buttons["Hey!"].tap()
        
        
        let sdbElement = app.textFields["Hey! "]
        XCTAssertTrue(sdbElement.exists, "Searched text not found")
        
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















