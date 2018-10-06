//
//  MVPRegistrationPageTests.swift
//  MVPRegistrationPageTests
//
//  Created by Yaroslaw Bagriy on 10/6/18.
//  Copyright © 2018 Yaroslaw Bagriy. All rights reserved.
//

import XCTest
@testable import MVPRegistrationPage

class MVPRegistrationPageTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRegisterWithEmptyEmail(){
        let expec = expectation(description: "registration with empty email")
        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController1(expectation: expec))
        registrationPresenter.register(email: "", password: "123456789", fullName: "michel jhon", phoneNumber: "087654325673")
        wait(for: [expec], timeout: 3)
    }
    
    func testRegistrationWithEmptyPassword(){
        let expec = expectation(description: "registration with empty password")
        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController2(expectation: expec))
        registrationPresenter.register(email: "test@test.com", password: "", fullName: "michel jhon", phoneNumber: "087654325673")
        wait(for: [expec], timeout: 3)
    }
    
    func testRegistrationWithPasswordLessthan8Char(){
        let expec = expectation(description: "registration with password less then 8 char")
        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController5(expectation: expec))
        registrationPresenter.register(email: "test@test.com", password: "1234", fullName: "michel jhon", phoneNumber: "087654325673")
        wait(for: [expec], timeout: 3)
    }
    
    func testRegistrationWithEmptyFullName(){
        let expec = expectation(description: "registration with empty full name")
        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController3(expectation: expec))
        registrationPresenter.register(email: "test@test.com", password: "1234", fullName: "", phoneNumber: "087654325673")
        wait(for: [expec], timeout: 3)
    }
    
    func testRegistrationWithEmptyPhoneNumber(){
        let expec = expectation(description: "registration with empty phone number")
        let registrationPresenter = RegistrationPresenter(delegate: MockUIViewController4(expectation: expec))
        registrationPresenter.register(email: "test@test.com", password: "1234", fullName: "michel jhon", phoneNumber: "")
        wait(for: [expec], timeout: 3)
    }

}

// Mocks
//there are the mock of UIviewController which using the Presenter
class MockUIViewController1: RegistrationDelegate{
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress(){}
    func hideProgress(){}
    func registrationDidSucceed(){}
    func registrationDidFailed(message: String){
        XCTAssertEqual(message, "email can't be blank")
        self.expec.fulfill()
    }
}

class MockUIViewController2: RegistrationDelegate{
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress(){}
    func hideProgress(){}
    func registrationDidSucceed(){}
    func registrationDidFailed(message: String){
        XCTAssertEqual(message, "password can't be blank")
        self.expec.fulfill()
    }
}

class MockUIViewController3: RegistrationDelegate{
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress(){}
    func hideProgress(){}
    func registrationDidSucceed(){}
    func registrationDidFailed(message: String){
        XCTAssertEqual(message, "full name can't be blank")
        self.expec.fulfill()
    }
}


class MockUIViewController4: RegistrationDelegate{
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress(){}
    func hideProgress(){}
    func registrationDidSucceed(){}
    func registrationDidFailed(message: String){
        XCTAssertEqual(message, "phone number can't be blank")
        self.expec.fulfill()
    }
}

class MockUIViewController5: RegistrationDelegate{
    var expec: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expec = expectation
    }
    func showProgress(){}
    func hideProgress(){}
    func registrationDidSucceed(){}
    func registrationDidFailed(message: String){
        XCTAssertEqual(message, "password must be at least 8 characters")
        self.expec.fulfill()
    }
}
