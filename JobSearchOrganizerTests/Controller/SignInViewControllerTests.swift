//
//  SignInViewControllerTests.swift
//  JobSearchOrganizerTests
//
//  Created by Vanessa Flores on 12/6/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import JobSearchOrganizer

class SignInViewControllerTests: XCTestCase {
    var sut: SignInViewController!

    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        sut = (viewController as! SignInViewController)
        
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_SignInView_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.signInView)
    }
    
    func test_GoogleSignInButton_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.signInView.googleSignInButton)
    }
 

}
