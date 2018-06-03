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
    @IBOutlet weak var imageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.thumbnailImage.contentMode =   UIViewContentMode.scaleAspectFit
    }
}
