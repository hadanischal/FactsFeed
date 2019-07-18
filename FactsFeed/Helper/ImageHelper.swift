//
//  ImageHelper.swift
//  FactsFeed
//
//  Created by Nischal Hada on 5/31/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class ImageHelper: ImageHelperProtocol {
    private let kLazyLoadCellImageViewTag = 1
    private let kLazyLoadPlaceholderImage = UIImage(named: "placeholder")!
    private let imageManager: ImageManager!

    init(withImagemanager imageManager: ImageManager = ImageManager()) {
        self.imageManager = imageManager
    }

    func updateImageForTableViewCell(_ cell: UITableViewCell, inTableView tableView: UITableView, imageURL: String, atIndexPath indexPath: IndexPath) {
        let imageView = cell.viewWithTag(kLazyLoadCellImageViewTag) as? UIImageView
        imageView?.image = kLazyLoadPlaceholderImage
        imageManager.downloadImageFromURL(imageURL) { (success, image) -> Void in
            if success && image != nil {
                if (tableView.indexPath(for: cell) as NSIndexPath?)?.row == (indexPath as NSIndexPath).row {
                    imageView?.image = image
                }
            }
        }
    }

    func updateImageForTableViewCell(_ cell: UITableViewCell, inTableView tableView: UITableView, imageURL: String, atIndexPath indexPath: IndexPath, completion: ((_ success: Bool, _ image: UIImage?) -> Void)?) {
        let imageView = cell.viewWithTag(kLazyLoadCellImageViewTag) as? UIImageView
        imageView?.image = kLazyLoadPlaceholderImage
        imageManager.downloadImageFromURL(imageURL) { (success, image) -> Void in
            if success && image != nil {
                if (tableView.indexPath(for: cell) as NSIndexPath?)?.row == (indexPath as NSIndexPath).row {
                    imageView?.image = image
                }
            }
            DispatchQueue.main.async(execute: { completion?(true, image) })
        }
    }
}
