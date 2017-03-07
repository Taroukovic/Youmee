//
//  myTrendingTableViewCell.swift
//  Youmee
//
//  Created by Wolfy on 07/02/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit

class myTrendingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileUserImage: UIImageView!
    @IBOutlet weak var demandeLabel: UILabel!
    @IBOutlet weak var socialImage: UIImageView!
    @IBOutlet weak var addButtonLabel: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
