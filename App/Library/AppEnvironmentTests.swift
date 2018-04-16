//
//  AppEnvironmentTests.swift
//  AppTests
//
//  Created by 斌王 on 2018/4/16.
//  Copyright © 2018 斌王. All rights reserved.
//

import XCTest
import Api

class AppEnvironmentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUser() {
        AppEnvironment.updateUser(user: User.template)
        assert(AppEnvironment.current.currentUser.login == User.template.login, "替换用户出错")
    }
    
}
