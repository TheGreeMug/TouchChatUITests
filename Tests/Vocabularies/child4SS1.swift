//  TouchChatTests
//  Created by Alin Voinescu on 24.04.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class e2e_TCHDWPLaunchchild4SS: XCTestCase {
    
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

       
    
    func testLaunchchild4SS() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        XCUIApplication().tables.staticTexts["My QuickChat  "].tap()
        XCUIApplication().tables.staticTexts["Child  "].tap()
        XCUIApplication().tables.staticTexts["My QuickChat Child 4 SS  "].tap()
        
        let elements = app.buttons.allElementsBoundByIndex
        let nineteenthElement = elements[18]
        let childWord = app.buttons["Playing"]
        
        XCTAssertGreaterThan(elements.count, 18, "There are not enough elements")
        XCTAssertEqual(nineteenthElement.label, "Playing", "The title is correct")
        XCTAssertTrue(childWord.exists);
        
        childWord.tap()
        
        XCTAssertTrue(app.buttons["Can I play?"].exists)
        app.buttons["Can I play?"].tap()
        
        
        let sdbElement = app.textFields["Can I play? "]
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















