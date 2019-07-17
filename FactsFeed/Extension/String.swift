//
//  String.swift
//  FactsFeed
//
//  Created by Nischal Hada on 6/3/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

extension String {
    var trimWhitespaces: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
