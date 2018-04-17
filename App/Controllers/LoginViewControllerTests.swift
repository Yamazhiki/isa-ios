//
//  LoginViewControllerTests.swift
//  AppUITests
//
//  Created by 斌王 on 2018/4/17.
//  Copyright © 2018 斌王. All rights reserved.
//

import XCTest

class LoginViewControllerTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let app = XCUIApplication()
        let username = app.textFields["username"]
        username.tap()
        username.typeText("Yamazhiki")
        
        let password = app.textFields["password"]
        password.tap()
        password.typeText("3689126")
        
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
