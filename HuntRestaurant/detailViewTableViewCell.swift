//
//  detailViewTableViewCell.swift
//  HuntRestaurant
//
//  Created by Mengistayehu Mamo on 4/10/16.
//  Copyright © 2016 Mengistayehu Mamo. All rights reserved.
//

import UIKit

class detailViewTableViewCell: UITableViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
