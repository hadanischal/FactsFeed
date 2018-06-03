//
//  Result.swift
//  TableviewWithRESTService
//
//  Created by Nischal Hada on 5/31/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}
