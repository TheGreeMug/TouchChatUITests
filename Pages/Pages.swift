//
//  Pages.swift
//  TouchChatUITests
//
//  Created by Marius N on 06.06.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import Foundation
import XCTest

class Pages {
    
    let app: XCUIApplication
    let permissionScreen: XCUIElement
    let yesButton: XCUIElement
    let noButton: XCUIElement
    let backButton: XCUIElement
    var vocabName = "vocabulary"
    //Vocabs
    let SpanishVocab = XCUIApplication().tables.staticTexts["Spanish  "]
    let sintaxis4x4English = XCUIApplication().tables.staticTexts["sin sintaxis 4 x 4 English SS  "]
    let sintaxis4x4Spanish = XCUIApplication().tables.staticTexts["sin sintaxis 4 x 4 Spanish SS  "]
    let sintaxis4x5English = XCUIApplication().tables.staticTexts["sintaxis 4 x 5 English SS  "]
    let sintaxis4x5Spanish = XCUIApplication().tables.staticTexts["sintaxis 4 x 5 Spanish SS  "]
    let afasiaEspanol = XCUIApplication().tables.staticTexts["Afasia Español SS  "]
    let multiChat15Bilingual = XCUIApplication().tables.staticTexts["MultiChat 15 Spanish Bilingual SS  "]
    let multiChat15Spanish  = XCUIApplication().tables.staticTexts["MultiChat15 Spanish SS  "]
    let wordPowerVocab = XCUIApplication().tables.staticTexts["WordPower  "]
    let wordPower25Position = XCUIApplication().tables.staticTexts["25 Position  "]
    let wordPower25TouchScan = XCUIApplication().tables.staticTexts["WordPower25 Touch & Scan SS  "]
    let wordPower42Position = XCUIApplication().tables.staticTexts["42 Position  "]
    let wordPower42SS = XCUIApplication().tables.staticTexts["WordPower42 SS  "]
    let wordPower48Position = XCUIApplication().tables.staticTexts["48 Position  "]
    let wordPower48SS = XCUIApplication().tables.staticTexts["WordPower48 SS  "]
    let wordPower60Position = XCUIApplication().tables.staticTexts["60 Position  "]
    let wordPower60SS = XCUIApplication().tables.staticTexts["WordPower60 SS  "]
    let wordPower80Position = XCUIApplication().tables.staticTexts["80 Position  "]
    let wordPower80SS = XCUIApplication().tables.staticTexts["WordPower80 SS  "]
    let wordPower108Position = XCUIApplication().tables.staticTexts["108 Position  "]
    let wordPower108SS = XCUIApplication().tables.staticTexts["WordPower108 SS  "]
    let wordPower60BasicSS = XCUIApplication().tables.staticTexts["WordPower60 Basic SS  "]
    let wordPower42BasicSS = XCUIApplication().tables.staticTexts["WordPower42 Basic SS  "]
    let wordPower20Position = XCUIApplication().tables.staticTexts["20 Position  "]
    let wordPower20SimplySS = XCUIApplication().tables.staticTexts["WordPower20 Simply SS  "]
    let wordPower140Position = XCUIApplication().tables.staticTexts["140 Position  "]
    let wordPower140SS = XCUIApplication().tables.staticTexts["WordPower140 SS  "]
    let wordPower108SSKeyboard = XCUIApplication().tables.staticTexts["WordPower108 with Keyboard SS  "]
    
    lazy var mainPage: MainPage = {
        return MainPage(app: XCUIApplication(), vocabName: vocabName)
    }()
    let vocabPage = VocabPage(app: XCUIApplication(), vocabName: "vocab")
    
    init(app: XCUIApplication) {
        self.app = app
        permissionScreen = app.buttons["Allow"]
        yesButton = app.buttons["Yes"]
        noButton = app.buttons["Yes"]
        backButton = app.buttons["Back"]
    }
    
    func clearAppCache() {
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
    }
    //new functions
    func backToVocab(){
        app.navigationBars.buttons["Vocab"].tap()
        app.popovers.scrollViews.otherElements.buttons["Choose New Vocab"].tap()
        
        XCUIApplication().tables.staticTexts["MyCore SS  "].tap()
    }
    
    func sdbTexts(sdbText: String){
        let sdbElement = app.textFields[sdbText]
        XCTAssertTrue(sdbElement.exists, "Searched text not found")
    }
    
    func verifyTheVocab(lastElement: String, vocabWord: String, vocabElement: NSInteger, nameElement: String){
        let lastElementVocab = app.buttons[lastElement]
        let existsTheElement = lastElementVocab.waitForExistence(timeout: 5)
        XCTAssertTrue(existsTheElement, "The last element of the vocabulary is not visible")
        
        let elements = app.buttons.allElementsBoundByIndex
        let vocabElementNumber = elements[vocabElement]
        let vocabWordVocab = app.buttons[vocabWord]
        let nameElementVocab = app.buttons[nameElement]
        
        XCTAssertGreaterThan(elements.count, 3, "There are not enough elements")
        XCTAssertEqual(vocabElementNumber.label, nameElement, "The title is not correct")
        XCTAssertTrue(vocabWordVocab.exists);
        
        vocabWordVocab.tap()
    }
    
    func resetPersistentStorage() {
        // Reset Core Data
        //        if let persistentStoreCoordinator = (UIApplication.shared.delegate as? AppDelegate)?.persistentStoreCoordinator {
        //            for store in persistentStoreCoordinator.persistentStores {
        //                guard let storeURL = store.url else { continue }
        //                do {
        //                    try persistentStoreCoordinator.destroyPersistentStore(at: storeURL, ofType: NSSQLiteStoreType, options: nil)
        //                    try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        //                } catch {
        //                    XCTFail("Failed to reset Core Data store: \(error)")
        //                }
        //            }
        //        }
        
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
    
    func reachAboutScreen() {
        vocabPage.menuButton.tap()
        mainPage.aboutMButton.tap()
        sleep(10)
    }
    
    func reachMenuPageIfOnVocabPage() {
        sleep(3)
        if mainPage.menuButton.exists {
            if vocabPage.vocabButton.exists{
                vocabPage.vocabButton.tap()
                vocabPage.chooseNewVocab.tap()
                XCTAssert(mainPage.editButton.exists)}
        } else {
            print("We already are on the vocabulary list screen.")
        }
    }
    
    func deleteVocabFromVocabPageIfExisting(textVerified: String, maxScrolls: Int = 5, timeout: TimeInterval = 5) {
        var scrollAttempts = 0
        var textFound = false
        
        while scrollAttempts < maxScrolls {
            let staticText = app.staticTexts[textVerified]
            
            // Check if the text exists
            if staticText.exists {
                textFound = true
                
                let mainPage = MainPage(app: app, vocabName: "vocab")
                let vocabPage = VocabPage(app: app, vocabName: "vocab")
                app.tables.staticTexts[textVerified].tap()
                sleep(5)
                vocabPage.vocabButton.tap()
                vocabPage.chooseNewVocab.tap()
                mainPage.editButton.tap()
                mainPage.deleteVocabButtonCircle.tap()
                mainPage.deleteVocabButtonSquare.tap()
                app.alerts["Delete Vocabulary"].scrollViews.otherElements.buttons["Continue"].tap()
                mainPage.verifyTextDoesNotExistScroll(textVerified: textVerified, maxScrolls: 10)
                mainPage.doneButton.tap()
                // Wait for the text to disappear
                let textNotExistExpectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == false"), object: staticText)
                let result = XCTWaiter.wait(for: [textNotExistExpectation], timeout: timeout)
                
                if result == .completed {
                    textFound = false
                    break
                } else {
                    textFound = true
                    break
                }
            }
            
            // Scroll up to continue searching
            app.swipeUp()
            scrollAttempts += 1
        }
        
        XCTAssertFalse(textFound, "The text '\(textVerified)' was found on the screen after \(scrollAttempts) scroll attempts.")
    }
    
    func scrollUpUntilElementIsVisible(element: XCUIElement, maxScrolls: Int = 10, timeout: TimeInterval = 10) {
        let startTime = Date()
        var scrollAttempts = 0
        
        while !element.exists || !element.isHittable {
            if scrollAttempts >= maxScrolls || Date().timeIntervalSince(startTime) >= timeout {
            }
            app.swipeDown()
            scrollAttempts += 1
            sleep(1)
        }
    }
}
