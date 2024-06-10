//
//  00_About.swift
//  TouchChatUITests
//
//  Created by Marius N on 07.06.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class _0_About: XCTestCase {
    
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

    func testAbout() throws {
        let pages = Pages(app: app)
        
        app.launch()
        pages.reachAboutScreen()
        

    }
}
