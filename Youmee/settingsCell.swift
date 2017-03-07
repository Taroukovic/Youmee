//
//  settingsCell.swift
//  Youmee
//
//  Created by Wolfy on 27/02/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit

class settingsCell: UITableViewCell {

    @IBOutlet weak var barImage: UIImageView!
    @IBOutlet weak var socialMediaImage: UIImageView!
    @IBOutlet weak var socialTextField: UITextField!

    @IBOutlet weak var privatePublicSwitch: UISwitch!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
