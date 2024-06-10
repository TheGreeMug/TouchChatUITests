//
//  EditPage.swift
//  TouchChatUITests
//
//  Created by Marius N on 06.06.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//


import XCTest

final class EditPage: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments.append("--reset")
        app.launch()

        clearAppCache()
        resetPersistentStorage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }
    
    func clearAppCache() {
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
    }
    
    func resetPersistentStorage() {
        
        // Reset SQLite
        let fileManager = FileManager.default
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dbURL = documentDirectory.appendingPathComponent("YourDatabaseName.sqlite")
            do {
                if fileManager.fileExists(atPath: dbURL.path) {
                    try fileManager.removeItem(at: dbURL)
                }
            } catch {
                XCTFail("Failed to reset SQLite database: \(error)")
            }
        }
        
        // Reset files in document directory
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            do {
                let fileURLs = try fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
                for fileURL in fileURLs {
                    try fileManager.removeItem(at: fileURL)
                }
            } catch {
                XCTFail("Failed to reset document directory: \(error)")
            }
        }
        
        // Clear UserDefaults
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
    }

    
    func testLaunchEditPage() throws {
//        navigateToCopyVocab()
//        createNewVocabCopy()
//        verifyNewVocabExists()
        sleep(10)
        editPage()
        addNewGesture()
        verifyGestureExists()
        deleteNewVocab()
        
        print("Test Finished with success!")
    }
    
    private func navigateToCopyVocab() {
        app.navigationBars.buttons["Menu"].tap()
        app.popovers.scrollViews.otherElements.buttons["Copy a Vocab"].tap()
    }
    
    private func createNewVocabCopy() {
        app.staticTexts["Spelling SS"].tap()
        let firstTextField = app.textFields.element(boundBy: 0)
        firstTextField.tap()
        firstTextField.typeText("Spelling SS Copy")
        
        let secondTextField = app.textFields.element(boundBy: 1)
        secondTextField.tap()
        secondTextField.typeText("Copy of Spelling SS")
        
        app.buttons["Save"].tap()
    }
    
    private func verifyNewVocabExists() {
        app.tables.staticTexts["Copy of Spelling SS"].tap()
        
        let elements = app.buttons.allElementsBoundByIndex
        XCTAssertGreaterThan(elements.count, 8, "Not enough elements")
        
        let eighthElement = elements[7]
        XCTAssertEqual(eighthElement.label, "PHRASES", "The title is incorrect")
        XCTAssertTrue(app.buttons["PHRASES"].exists)
    }
    
    private func editPage() {
        app.navigationBars.buttons["Menu"].tap()
        app.buttons["Edit Page"].tap()
    }
    
    private func addNewGesture() {
        app.navigationBars.buttons["Menu"].tap()
        app.buttons["Edit Gestures"].tap()
        sleep(3)
        app.buttons["Add"].tap()
        
        let firstTextField = app.textFields.element(boundBy: 0)
        firstTextField.tap()
        firstTextField.typeText("Gesture by e2e")
        
        let popoversQuery = app.popovers
        popoversQuery.scrollViews.otherElements.buttons["Add"].tap()
        
        let tablesQuery = popoversQuery.tables
        

        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Navigate Back"]/*[[".cells.staticTexts[\"Navigate Back\"]",".staticTexts[\"Navigate Back\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Repeat Last Spoken"]/*[[".cells.staticTexts[\"Repeat Last Spoken\"]",".staticTexts[\"Repeat Last Spoken\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Speech Message"]/*[[".cells.staticTexts[\"Speech Message\"]",".staticTexts[\"Speech Message\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // sleep(3)
        // tablesQuery.staticTexts["Navigate Back"].swipeUp()
        // sleep(3)
        // tablesQuery.staticTexts["Repeat Last Spoken"].swipeUp()
        
        // tablesQuery.staticTexts["Speech Message"].tap()
        
        app.buttons["Save"].tap()
        app.popovers.navigationBars["Select Gesture"].buttons["Done"].tap()
        app.navigationBars["SPKBD-QWERTY"].buttons["Done"].tap()
    }
    
    private func verifyGestureExists() {
        let scrollViewToolbar = app.buttons["t"]
        XCTAssertTrue(scrollViewToolbar.exists, "Toolbar doesn't exist.")
        
        let elementPosition = scrollViewToolbar.frame.origin
        let elementSize = scrollViewToolbar.frame.size
        let centerX = elementPosition.x + elementSize.width / 2
        let centerY = elementPosition.y + elementSize.height / 2
        
        let startCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: centerX / UIScreen.main.bounds.width, dy: centerY / UIScreen.main.bounds.height))
        let endCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: centerX / UIScreen.main.bounds.width, dy: (centerY - 100) / UIScreen.main.bounds.height))
        
        startCoordinate.press(forDuration: 0.1, thenDragTo: endCoordinate)
        
        let sdbElement = app.textFields["Gesture by e2e"]
        XCTAssertTrue(sdbElement.exists, "Searched text not found")
    }
    
    private func deleteNewVocab() {
        app.navigationBars.buttons["Vocab"].tap()
        app.popovers.scrollViews.otherElements.buttons["Choose New Vocab"].tap()
        app.navigationBars.buttons["Edit"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.images["minus.circle.fill"].tap()
        tablesQuery.buttons["Delete"].tap()
        app.alerts["Delete Vocabulary"].scrollViews.otherElements.buttons["Continue"].tap()
    }
}
