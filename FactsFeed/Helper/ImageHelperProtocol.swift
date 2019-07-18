//
//  ImageHelperProtocol.swift
//  FactsFeed
//
//  Created by Nischal Hada on 7/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit

protocol ImageHelperProtocol {
    func updateImageForTableViewCell(_ cell: UITableViewCell, inTableView tableView: UITableView, imageURL: String, atIndexPath indexPath: IndexPath)
    func updateImageForTableViewCell(_ cell: UITableViewCell, inTableView tableView: UITableView, imageURL: String, atIndexPath indexPath: IndexPath, completion: ((_ success: Bool, _ image: UIImage?) -> Void)?)
}
