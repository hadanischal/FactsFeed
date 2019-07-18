//
//  FeedsViewModelProtocol.swift
//  FactsFeed
//
//  Created by Nischal Hada on 7/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

protocol FeedsViewModelProtocol {
    func fetchServiceCall(_ completion: ((Result<Bool, ErrorResult>) -> Void)?)
    var title: String? { get set }
}
