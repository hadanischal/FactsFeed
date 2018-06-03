//
//  ListModel.swift
//  TableviewWithRESTService
//
//  Created by Nischal Hada on 5/31/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

var util: Util { return Util() }

struct ListModel {
    let title: String!
    let description: String!
    let imageRef: String!
    
    init(dictionary: [String: Any]) {
        self.title = (util.filterNil(dictionary["title"] as AnyObject) as! String).trimWhitespaces
        self.description = (util.filterNil(dictionary["description"] as AnyObject) as! String).trimWhitespaces
        self.imageRef = (util.filterNil(dictionary["imageHref"] as AnyObject) as! String).trimWhitespaces
    }
}
