//
//  FeedsDataSource.swift
//  iOSProgressiveExercise
//
//  Created by Nischal Hada on 5/29/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
    fileprivate let tableReuseIdentifier = "FeedsCell"
}

class FeedsDataSource : GenericDataSource<ListModel>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableReuseIdentifier, for: indexPath) as! FeedsCell
        let feedsValue = self.data.value[indexPath.row]
        cell.feedsValue = feedsValue
        if feedsValue.imageRef != ""  && feedsValue.imageRef != "N/A"{
            ImageHelper().updateImageForTableViewCell(cell, inTableView: tableView, imageURL: feedsValue.imageRef, atIndexPath: indexPath, completion: { (success, image) in
                if success && image != nil {
                    cell.thumbnailImage.isHidden = false
                    cell.leadingConstraint.constant = 68
                }else{
                    cell.thumbnailImage.isHidden = true
                    cell.leadingConstraint.constant = 0
                }
            })
        }else{
            cell.thumbnailImage.isHidden = true
            cell.leadingConstraint.constant = 0
        }
        return cell
    }
}
