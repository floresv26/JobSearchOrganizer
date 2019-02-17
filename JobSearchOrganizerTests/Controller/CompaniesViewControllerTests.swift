//
//  CompaniesViewControllerTests.swift
//  JobSearchOrganizerTests
//
//  Created by Vanessa Flores on 2/16/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import JobSearchOrganizer

class CompaniesViewControllerTests: XCTestCase {
    
    var sut: CompaniesViewController!

    override func setUp() {
        sut = CompaniesViewController()
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_NavigationTitle_IsNotNil() {
        XCTAssertNotNil(sut.navigationItem.title)
    }
    
    func test_NavigationTitle_IsCompanies() {
        let title = sut.navigationItem.title
        
        XCTAssertEqual(title, "Companies")
    }
    
    func test_AddCompanyView_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.addCompanyView)
    }
    
    func test_AddCompanyView_IsDescendantOfView() {
        XCTAssertTrue(sut.addCompanyView.isDescendant(of: sut.view))
    }

}
