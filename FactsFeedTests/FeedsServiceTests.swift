//
//  FeedsServiceTests.swift
//  FactsFeedTests
//
//  Created by Nischal Hada on 6/3/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import XCTest
@testable import FactsFeed

class FeedsServiceTests: XCTestCase {

    func testCancelRequest() {
        let service: FeedsService! = FeedsService()
        service.fetchFeeds { (_) in
        }
        service.cancelFetchFeeds()
        XCTAssertNil(service.task, "Expected task nil")
    }
}
