//
//  DetailTableViewCell.swift
//  Register ShowCityPlist
//
//  Created by admin on 3/30/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak var lbCodeCiti: UILabel!
    @IBOutlet weak var lbCodeDisTricts: UILabel!
    @IBOutlet weak var lbName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
