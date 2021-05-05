//
//  TestForSmallPDFTests.swift
//  TestForSmallPDFTests
//
//  Created by Danijel Vasov on 4/28/21.
//  Copyright © 2021 Danijel Vasov. All rights reserved.
//

import XCTest
@testable import TestForSmallPDF

class TestForSmallPDFTests: XCTestCase {

    var currentPage = 1
    var usersUrl: String!
    
    override func setUp() {
        currentPage = 1
        usersUrl = "https://randomuser.me/api?page=\(currentPage)&results=20"
    }

    override func tearDown() {
        currentPage = 1
        usersUrl = "https://randomuser.me/api?page=\(currentPage)&results=20"
    }

    func test_is_link_page_update_correct() {
        XCTAssertEqual(usersUrl, "https://randomuser.me/api?page=1&results=20")
        //----
        currentPage += 1
        usersUrl = "https://randomuser.me/api?page=\(currentPage)&results=20"
        XCTAssertEqual(usersUrl, "https://randomuser.me/api?page=2&results=20")
        
        //----
        currentPage += 1
        usersUrl = "https://randomuser.me/api?page=\(currentPage)&results=20"
        XCTAssertEqual(usersUrl, "https://randomuser.me/api?page=3&results=20")
        
    }
    


}
