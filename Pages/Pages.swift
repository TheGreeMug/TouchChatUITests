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
    let myQuickChatVocab = XCUIApplication().tables.staticTexts["My QuickChat  "]
    let childQuickChatVocab = XCUIApplication().tables.staticTexts["Child  "]
    let quickChatChild4SS = XCUIApplication().tables.staticTexts["My QuickChat Child 4 SS  "]
    let quickChatChild8SS = XCUIApplication().tables.staticTexts["My QuickChat Child 8 SS  "]
    let quickChatChild12SS = XCUIApplication().tables.staticTexts["My QuickChat Child 12 SS  "]
    let adultQuickChatVocab = XCUIApplication().tables.staticTexts["Adult  "]
    let quickChatAdult8SS = XCUIApplication().tables.staticTexts["My QuickChat Adult 8 SS  "]
    let quickChatAdult12SS = XCUIApplication().tables.staticTexts["My QuickChat Adult 12 SS  "]
    let multiChat15Vocab = XCUIApplication().tables.staticTexts["MultiChat 15  "]
    let multiChatAdolescentSS = XCUIApplication().tables.staticTexts["MultiChat 15 Adolescent SS  "]
    let multiChatAdultSS = XCUIApplication().tables.staticTexts["MultiChat 15 Adult SS  "]
    let multiChatStudentSS = XCUIApplication().tables.staticTexts["MultiChat 15 Student SS  "]
    let aphasiaVocab = XCUIApplication().tables.staticTexts["Aphasia  "]
    let aphasiaSpanishSS = XCUIApplication().tables.staticTexts["Aphasia Spanish SS  "]
    let aphasiaUKSS = XCUIApplication().tables.staticTexts["Aphasia UK SS  "]
    let aphasiaUSSS = XCUIApplication().tables.staticTexts["Aphasia US SS  "]
    let basic4SS = XCUIApplication().tables.staticTexts["4 Basic SS  "]
    let engageForiOS = XCUIApplication().tables.staticTexts["Engage for iOS SS  "]
    let myCoreSS = XCUIApplication().tables.staticTexts["MyCore SS  "]
    let spellingSS = XCUIApplication().tables.staticTexts["Spelling SS  "]
    let vocabPCSS = XCUIApplication().tables.staticTexts["VocabPC SS  "]
    let tecladoSS = XCUIApplication().tables.staticTexts["Teclado SS  "]
    let vocabPCSpanishSS = XCUIApplication().tables.staticTexts["Vocab PC Spanish SS  "]
    let wordPowerEspanol48 = XCUIApplication().tables.staticTexts["WordPower 48 Español SS  "]
    let wordPowerEspanol25 = XCUIApplication().tables.staticTexts["WordPower25 Español SS  "]
    let wordPowerBasico48 = XCUIApplication().tables.staticTexts["WordPower48 Español Básico SS  "]
    let wordPowerBasico60 = XCUIApplication().tables.staticTexts["WordPower60 Español Básico SS  "]
    let frenchVocab = XCUIApplication().tables.staticTexts["French  "]
    let base4FrenchSS = XCUIApplication().tables.staticTexts["4 de base français SS  "]
    let communicationFrancaisSS = XCUIApplication().tables.staticTexts["Communication Journey Aphasie français SS  "]
    let multiChat15FrancaisSS = XCUIApplication().tables.staticTexts["MultiChat15 français SS  "]
    let vocabPCFrancaisSS = XCUIApplication().tables.staticTexts["VocabPC français SS  "]
    let epelerFrancaisSS = XCUIApplication().tables.staticTexts["Épeler français SS  "]
    let wordPower120Azerty = XCUIApplication().tables.staticTexts["WordPower120 français AZERTY SS  "]
    let wordPower120FrancaisSS = XCUIApplication().tables.staticTexts["WordPower120 français SS  "]
    let wordPower60FrancaisSS = XCUIApplication().tables.staticTexts["WordPower60 français SS  "]
    
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
    
    func checkSdbText(sdbText: String){
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
    
    func reachAddAbbreviation(){
        app.navigationBars.buttons["Menu"].tap()
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        elementsQuery.buttons["Edit Abbreviations"].tap()
        let abbreviationsNavigationBar = popoversQuery.navigationBars["Abbreviations"]
        let existsAbbreviationNavigationBar = abbreviationsNavigationBar.waitForExistence(timeout: 5)
        abbreviationsNavigationBar.buttons["Add"].tap()
    }
    
    func addAbbreviation(){
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let abbreviationsNavigationBar = popoversQuery.navigationBars["Abbreviations"]
        let abbreviationElementsQuery = scrollViewsQuery.otherElements.containing(.staticText, identifier:"Abbreviation")
        abbreviationElementsQuery.children(matching: .textField).element(boundBy: 0).tap()
        abbreviationElementsQuery.children(matching: .textField).element(boundBy: 0).typeText("test")
        
        let clearTextTextField = elementsQuery.textFields.containing(.button, identifier:"Clear text").element
        clearTextTextField.tap()
        abbreviationElementsQuery.children(matching: .textField).element(boundBy: 1).tap()
        abbreviationElementsQuery.children(matching: .textField).element(boundBy: 1).typeText("Test by e2e")
        abbreviationsNavigationBar.buttons["Save"].tap()
        abbreviationsNavigationBar.buttons["Done"].tap()
    }
    
    func checkAddAbbreviation(){
        app.buttons["t"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["e"]/*[[".buttons[\"e\"].staticTexts[\"e\"]",".staticTexts[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["s"].tap()
        app.buttons["t"].tap()
        app.buttons["."].tap()
        app.buttons["t"].tap()
        app.buttons["BackButton"].tap()
    }
    
    func reachToEditAbbreviation(){
        app.navigationBars.buttons["Menu"].tap()
        let popoversQuery = app.popovers
        popoversQuery.scrollViews.otherElements.buttons["Edit Abbreviations"].tap()
        let editAbbreviationPage = popoversQuery.toolbars["Toolbar"].buttons["Edit"]
        let waitForTheEditAbbreviation = editAbbreviationPage.waitForExistence(timeout: 5)
        editAbbreviationPage.tap()
    }
    
    func removeTheAbbreviation(){
        app.buttons["Remove test., Test by e2e"].tap()
        app.buttons["Delete"].tap()
        
        let popoversQuery = app.popovers
        let scrollViewsQuery = popoversQuery.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        let abbreviationsNavigationBar = popoversQuery.navigationBars["Abbreviations"]
        abbreviationsNavigationBar.buttons["Done"].tap()
    }
    
    func clearAllAbbreviations(){
        app.popovers.toolbars["Toolbar"].buttons["Clear"].tap()
        XCTAssertTrue(app.staticTexts["Are you sure you want to erase all?"].exists, "The clear modal doesn't appear")
        app.alerts["Clear"].scrollViews.otherElements.buttons["Yes"].tap()
    }
    
    func restoreToDefaultsAbbreviation(){
        let popoversQuery = app.popovers
        popoversQuery.toolbars["Toolbar"].buttons["Restore Defaults"].tap()
        XCTAssertTrue(app.staticTexts["Are you sure you want to restore all default values?"].exists, "The restore modal doesn't appear")
        app.alerts["Restore Defaults"].scrollViews.otherElements.buttons["Yes"].tap()
        popoversQuery.navigationBars["Abbreviations"].buttons["Done"].tap()
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
