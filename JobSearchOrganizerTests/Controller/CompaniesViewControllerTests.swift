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
    
    func test_CompaniesTableView_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.companiesTableView)
    }
    
    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertTrue(sut.companiesTableView.dataSource is CompaniesViewController)
    }

}

extension CompaniesViewControllerTests {
    class MockTableView: UITableView {
        var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String,
                                          for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
        class func mockTableView(withDataSource dataSource: UITableViewDataSource) -> MockTableView {
            let mockTableView = MockTableView(
                frame: CGRect(x: 0, y: 0, width: 1125, height: 2436),
                style: .plain)
            
            mockTableView.dataSource = dataSource
            mockTableView.register(MockItemCell.self, forCellReuseIdentifier: "CompaniesTableViewCell")
            
            return mockTableView
        }
    }
    
    class MockItemCell: CompaniesTableViewCell {
        var catchedItem: Company?
        
        override func populate(company: Company) {
            catchedItem = company
        }
    }
}
