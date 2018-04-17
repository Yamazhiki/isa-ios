//
//  LoginViewModelTests.swift
//  AppTests
//
//  Created by 斌王 on 2018/4/16.
//  Copyright © 2018 斌王. All rights reserved.
//

import XCTest
import RxSwift
import RxTest

class LoginViewModelTests: XCTestCase {

    let booleans = ["t": true, "f": false]

    let stringValues = [
        "Y": "Yamazhiki",
        "p1": "huge secret",
        "p2": "secret",
        "e": ""
    ]

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        let scheduler = TestScheduler(initialClock: 0, resolution: 0.2, simulateProcessingDelay: false)
        let (
                username,
                password,
                signUp
        ) = (
                scheduler.parseEventsAndTimes(timeline: "e------Y---------------", values: stringValues).first!,
                scheduler.parseEventsAndTimes(timeline: "---p2------------------", values: stringValues).first!,
                scheduler.parseEventsAndTimes(timeline: "---f---t---------------", values: booleans).first!
        )

        let viewModel = LoginViewModel()
        _ = scheduler.createHotObservable(username).asObservable().subscribe {
            viewModel.inputs.username(val: $0.element ?? "")
        }
        _ = scheduler.createHotObservable(password).asObservable().subscribe {
            viewModel.inputs.password(src: $0.element ?? "")
        }
        let signUpEnable = scheduler.record(source: viewModel.outputs.canLogin.asObservable())
        scheduler.start()

        XCTAssertEqual(signUpEnable.events, signUp)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
