//
//  uiTestingUITests.swift
//  uiTestingUITests
//
//  Created by Elise El beze on 05/09/2018.
//  Copyright © 2018 Elise El beze. All rights reserved.
//

import XCTest
import Snap

@testable import uiTesting

class uiTestingUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

//        isRecord ing = true
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func snapshotView() -> UIView {
        let app = XCUIApplication()
        return UIImageView(image: app.windows.firstMatch.screenshot().image)
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
        
        XCTAssertTrue(app.staticTexts["❌ username or password don't match"].exists)

        expect(snapshotView()).toMatchSnapshot()
    }
    
    func testDisplayListApp() {
        let app = XCUIApplication()
        login()
        
        // Verify we displayed all applications
        XCTAssertEqual(app.tables.firstMatch.cells.count, 7)
        XCTAssertTrue(app.tables.cells.firstMatch.staticTexts["com.octo.askbob"].exists)
        XCTAssertTrue(app.tables.cells.firstMatch.staticTexts["AskBob"].exists)
        XCTAssertTrue(app.tables.cells.element(boundBy: 1).staticTexts["com.fogcreek.trello"].exists)
        XCTAssertTrue(app.tables.cells.element(boundBy: 1).staticTexts["Trello"].exists)
        expect(snapshotView()).toMatchSnapshot()
        // ....
    }
    
    func testShowAppDetail() {
        let app = XCUIApplication()
        
        login()
        
        let trelloCell = app.tables.cells.containing(.staticText, identifier: "Trello").element
        trelloCell.firstMatch.tap()
        
        XCTAssertTrue(app.staticTexts["com.fogcreek.trello"].exists)
        XCTAssertTrue(app.staticTexts["Trello"].exists)
        
        let predicate = NSPredicate(format: "label LIKE 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer erat ipsum, finibus nec erat sit amet, porta dignissim tortor. Cras venenatis faucibus convallis. In pharetra purus et bibendum sagittis.'")
        let descriptionLabel = app.staticTexts.element(matching: predicate)
        XCTAssert(descriptionLabel.exists)
        expect(snapshotView()).toMatchSnapshot()
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
