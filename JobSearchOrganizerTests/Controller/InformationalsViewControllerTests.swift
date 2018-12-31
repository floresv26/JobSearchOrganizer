//
//  InformationalsViewControllerTests.swift
//  JobSearchOrganizerTests
//
//  Created by Vanessa Flores on 12/29/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import JobSearchOrganizer

class InformationalsViewControllerTests: XCTestCase {

    var sut: InformationalsViewController!
    
    override func setUp() {
        sut = InformationalsViewController()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_InformationalsViewController_NavigationTitle_IsNotNil() {
        XCTAssertNotNil(sut.navigationItem.title)
    }
    
    func test_InformationalsViewController_NavigationTitle_IsInformationalInterviewsRequested() {
        let title = sut.navigationItem.title
        
        XCTAssertEqual(title, "Informational Interviews Requested")
    }

}
