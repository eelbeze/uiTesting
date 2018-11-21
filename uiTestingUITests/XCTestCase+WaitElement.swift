//
//  XCTestCase+WaitElement.swift
//  uiTestingUITests
//
//  Created by Elise El beze on 21/11/2018.
//  Copyright © 2018 Elise El beze. All rights reserved.
//

import XCTest

extension XCTestCase {
    func waitForElementToAppear(_ element: XCUIElement) {
        expectation(for: NSPredicate(format: "exists == true"), evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
    }
}
