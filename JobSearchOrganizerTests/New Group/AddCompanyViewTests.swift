//
//  AddCompanyViewTests.swift
//  JobSearchOrganizerTests
//
//  Created by Vanessa Flores on 12/31/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
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

    func test_AddCompanyTextField_IsNotNil() {
        XCTAssertNotNil(sut.addCompanyTextField)
    }
    
    func test_AddCompanyButton_IsNotNil() {
        XCTAssertNotNil(sut.addCompanyButton)
    }

}
