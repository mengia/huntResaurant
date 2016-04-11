//
//  RestuarantTableViewcCell.swift
//  HuntRestaurant
//
//  Created by Mengistayehu Mamo on 4/9/16.
//  Copyright © 2016 Mengistayehu Mamo. All rights reserved.
//

import UIKit

class RestuarantTableViewcCell: UITableViewCell {

    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageShow: UIImageView!


    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
