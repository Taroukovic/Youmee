//
//  myProfileTableViewCell.swift
//  Youmee
//
//  Created by Wolfy on 06/02/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit

class myProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var pseudoLabel: UILabel!
    @IBOutlet weak var barImage: UIImageView!
    @IBOutlet weak var socialMediaImage: UIImageView!
    @IBOutlet weak var privatePublicSwitch: UISwitch!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
