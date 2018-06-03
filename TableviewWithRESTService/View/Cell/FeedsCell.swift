//
//  FeedsCell.swift
//  TableviewWithRESTService
//
//  Created by Nischal Hada on 6/3/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class FeedsCell: UITableViewCell {
    @IBOutlet var thumbnailImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var feedsValue : ListModel? {
        didSet {
            guard let feeds = feedsValue else {
                return
            }
            titleLabel?.text = feeds.title
            descriptionLabel?.text = feeds.description
            if feeds.imageRef == ""  && feeds.imageRef == "N/A"{
                self.thumbnailImage.isHidden = true
                self.leadingConstraint.constant = 0
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.thumbnailImage.contentMode =   UIViewContentMode.scaleAspectFit
    }
}
