//
//  FeedsServiceTests.swift
//  TableviewWithRESTServiceTests
//
//  Created by Nischal Hada on 6/3/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import XCTest
@testable import TableviewWithRESTService

class FeedsServiceTests: XCTestCase {
    
    func testCancelRequest() {
        let service : FeedsService! = FeedsService()
        service.fetchConverter{ (_) in
        }
        service.cancelFetchCurrencies()
        XCTAssertNil(service.task, "Expected task nil")
    }
}
