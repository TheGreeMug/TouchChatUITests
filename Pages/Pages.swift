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
    var vocabName = "vocabulary"
    lazy var mainPage: MainPage = {
        return MainPage(app: XCUIApplication(), vocabName: vocabName)
    }()
    let vocabPage = VocabPage(app: XCUIApplication(), vocabName: "vocab")
    
    init(app: XCUIApplication) {
        self.app = app
        permissionScreen = app.buttons["Allow"]
        yesButton = app.buttons["Yes"]
        noButton = app.buttons["Yes"]
    }
    
    func clearAppCache() {
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
        UserDefaults.standard.synchronize()
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
