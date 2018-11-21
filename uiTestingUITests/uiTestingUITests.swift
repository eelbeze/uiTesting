//
//  uiTestingUITests.swift
//  uiTestingUITests
//
//  Created by Elise El beze on 05/09/2018.
//  Copyright © 2018 Elise El beze. All rights reserved.
//

import XCTest

class uiTestingUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }

    
    func testLoginFailure() {
        let app = XCUIApplication()
        
        let username = app.textFields["Username"]
        username.tap()
        username.typeText("wrongUsername")
        
        let password = app.secureTextFields["Password"]
        password.tap()
        password.typeText("wrongPassword")
        
        XCUIApplication().buttons["Login"].tap()
        
        XCTAssertTrue(app.staticTexts["❌ username or password not match"].exists)
    }
    
    func testDisplayListApp() {
        let app = XCUIApplication()
        login()
        
        // Verify we displayed all applications
        XCTAssertEqual(app.tables.firstMatch.cells.count, 7)
    }
    
    func testShowAppDetail() {
        let app = XCUIApplication()
        login()
        
        let trelloCell = app.tables.cells.containing(.staticText, identifier: "Trello").element
        trelloCell.firstMatch.tap()
        
        XCTAssertTrue(app.staticTexts["com.fogcreek.trello"].exists)
        XCTAssertTrue(app.staticTexts["Trello"].exists)
    }
    
    private func login() {
        let app = XCUIApplication()
        
        let username = app.textFields["Username"]
        username.tap()
        username.typeText("username")
        
        let password = app.secureTextFields["Password"]
        password.tap()
        password.typeText("password")
        
        XCUIApplication().buttons["Login"].tap()
        
        // We need to wait the server response
        waitForElementToAppear(app.navigationBars["Apps"])
    }
}
