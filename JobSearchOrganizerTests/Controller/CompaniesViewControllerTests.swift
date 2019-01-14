//
//  CompaniesViewControllerTests.swift
//  JobSearchOrganizerTests
//
//  Created by Vanessa Flores on 12/29/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
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
    
    func test_NavigationController_LeftBarButton_IsSearchButton() {
        XCTAssertEqual(sut.searchButton, sut.navigationItem.leftBarButtonItem)
    }
    
    func test_NavigationController_RightBarButtonItems_AreSortAndMoreButtons() {
        var rightBarButtons: [UIBarButtonItem]!
        rightBarButtons = [sut.moreButton, sut.sortButton]
        
        XCTAssertEqual(sut.navigationItem.rightBarButtonItems, rightBarButtons)
    }
    
    func test_AddCompanyView_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.addCompanyView)
    }
    
    func test_AddCompanyTextField_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.addCompanyView.addCompanyTextField)
    }


}
