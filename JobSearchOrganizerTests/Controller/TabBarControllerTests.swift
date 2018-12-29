//
//  TabBarControllerTests.swift
//  JobSearchOrganizerTests
//
//  Created by Vanessa Flores on 12/28/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
//

import XCTest
@testable import JobSearchOrganizer

class TabBarControllerTests: XCTestCase {
    
    var sut: TabBarController!

    override func setUp() {
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let tabBarCntr = storyboard.instantiateViewController(withIdentifier: "TabBarController")
//        sut = (tabBarCntr as! TabBarController)
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
        
        XCTAssertEqual(viewControllersCount, 4)
    }
    
    func test_FirstTabTitle_AfterViewDidLoad_IsCompanies() {
        let viewController = sut.viewControllers?.first
        let title = viewController?.tabBarItem.title
        
        XCTAssertEqual(title, "Companies")
    }
    
//    func test_NavigationTitle_ForCompaniesTab_IsCompanies() {
//        let viewController = sut.viewControllers?.first as! UINavigationController
//        let title = viewController.viewControllers.first?.navigationItem.title
//
//        XCTAssertEqual(title, "Companies")
//    }

    func test_SecondTabTitle_AfterViewDidLoad_IsInformationals() {
        let viewController = sut.viewControllers?[1]
        let title = viewController?.tabBarItem.title
        
        XCTAssertEqual(title, "Informationals")
    }
    
//    func test_NavigationTitle_ForInformationalsTab_IsInformationalInterviews() {
//
//    }
    
    func test_ThirdTabTitle_AfterViewDidLoad_IsApplications() {
        let viewController = sut.viewControllers?[2]
        let title = viewController?.tabBarItem.title
        
        XCTAssertEqual(title, "Applications")
    }
    
//    func test_NavigationTitle_ForApplicationsTab_IsApplicationsSubmitted() {
//
//    }
    
    func test_FourthTabTitle_AfterViewDidLoad_IsInterviews() {
        let viewController = sut.viewControllers?[3]
        let title = viewController?.tabBarItem.title
        
        XCTAssertEqual(title, "Interviews")
    }
    
//    func test_NavigationTitle_ForInterviewsTab_IsInterviewsScheduled() {
//
//    }
}
