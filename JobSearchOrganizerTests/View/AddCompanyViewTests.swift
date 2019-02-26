//
//  AddCompanyViewTests.swift
//  JobSearchOrganizerTests
//
//  Created by Vanessa Flores on 2/17/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import JobSearchOrganizer

class AddCompanyViewTests: XCTestCase {
    
    var sut: AddCompanyView!

    override func setUp() {
        sut = AddCompanyView()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_CompanyNameTextField_WhenViewInitialized_IsNotNil() {
        XCTAssertNotNil(sut.companyNameTextField)
    }
    
    func test_CompanyNameTextField_IsDescendantOfView() {
        XCTAssertTrue(sut.companyNameTextField.isDescendant(of: sut))
    }
    
    func test_AddCompanyButton_WhenViewInitialized_IsNotNil() {
        XCTAssertNotNil(sut.addCompanyButton)
    }

    func test_AddButton_WhenViewInitialized_IsIsDescendantOfView() {
        XCTAssertTrue(sut.addCompanyButton.isDescendant(of: sut))
    }
    
    
}
