//
//  FeedsServiceProtocol.swift
//  FactsFeed
//
//  Created by Nischal Hada on 7/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

protocol FeedsServiceProtocol {
    func fetchFeeds(_ completion: @escaping ((Result<FeedsModel, ErrorResult>) -> Void))
}
