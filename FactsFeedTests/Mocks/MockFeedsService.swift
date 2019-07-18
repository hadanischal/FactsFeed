//
//  MockFeedsService.swift
//  FactsFeedTests
//
//  Created by Nischal Hada on 7/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation
@testable import FactsFeed

class MockFeedsService: FeedsServiceProtocol {
    var feedsData: FeedsModel?
    func fetchFeeds(_ completion: @escaping ((Result<FeedsModel, ErrorResult>) -> Void)) {
        if let data = feedsData {
            completion(Result.success(data))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No converter")))
        }
    }
}
