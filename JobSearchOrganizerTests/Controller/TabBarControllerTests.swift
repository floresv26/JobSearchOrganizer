//
//  TabBarControllerTests.swift
//  JobSearchOrganizerTests
//
//  Created by Vanessa Flores on 2/16/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import JobSearchOrganizer

class TabBarControllerTests: XCTestCase {
    
    var sut: TabBarController!

    override func setUp() {
        sut = TabBarController()
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_TabBarController_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut)
    }
    
    func test_TabBarController_ViewControllers_IsNotEmpty() {
        let viewControllers = sut.viewControllers
        let viewControllersCount = viewControllers?.count
        
        XCTAssertEqual(viewControllersCount, 1)
    }
    
    func test_FirstTabTitle_AfterViewDidLoad_IsCompanies() {
        let viewController = sut.viewControllers?.first
        let title = viewController?.tabBarItem.title
        
        XCTAssertEqual(title, "Companies")
    }

}
