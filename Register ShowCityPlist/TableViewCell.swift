//
//  TableViewCell.swift
//  Register ShowCityPlist
//
//  Created by admin on 3/29/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lbNameCity: UILabel!
    @IBOutlet weak var blCodeCity: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
