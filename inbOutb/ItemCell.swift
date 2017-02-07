//
//  ItemCell.swift
//  inbOutb
//
//  Created by October Hammer on 2/7/17.
//  Copyright © 2017 Ocotober Hammer. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

	@IBOutlet weak var lblDeepLink: UILabel!
	@IBOutlet weak var lblPrice: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
