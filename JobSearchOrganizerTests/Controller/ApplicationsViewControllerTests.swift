//
//  ApplicationsViewControllerTests.swift
//  JobSearchOrganizerTests
//
//  Created by Vanessa Flores on 12/29/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import JobSearchOrganizer

class ApplicationsViewControllerTests: XCTestCase {

    var sut: ApplicationsViewController!
    
    override func setUp() {
        sut = ApplicationsViewController()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ApplicationsViewController_NavigationTitle_IsNotNil() {
        XCTAssertNotNil(sut.navigationItem.title)
    }
    
    func test_ApplicationsViewController_NavigationTitle_IsApplicationsSubmitted() {
        let title = sut.navigationItem.title
        
        XCTAssertEqual(title, "Applications Submitted")
    }

}
