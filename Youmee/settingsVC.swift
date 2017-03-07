//
//  settingsVC.swift
//  Youmee
//
//  Created by Wolfy on 15/02/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit

class settingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var profilPicture: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextArea: UITextView!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    @IBOutlet weak var mySettingsTableView: UITableView!
    var name = String()
    var descrip = String()
    var profilImage = UIImage()
    var pseudoList: [String] = [""]
    var hobbiesList: [String] = [""]
    var barImageList: [String] = [""]
    var socialMediaImageList: [String] = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(barImageList)
        print(pseudoList)
        print(socialMediaImageList)
        descriptionTextArea.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextArea.layer.borderWidth = 1

        mySettingsTableView.separatorColor = UIColor.clear
        nameTextField.text = name
        descriptionTextArea.text = descrip
        profilPicture.image = profilImage
        profilPicture.layer.cornerRadius = profilPicture.frame.size.height/2
        profilPicture.layer.masksToBounds = true
        
        myDatePicker.addTarget(self, action: Selector(("date_picker_change_action")), for: UIControlEvents.valueChanged)
    }
    
    @IBAction func date_picker_change_action(sender: UIDatePicker)
    {
    
    }
    
    @IBAction func switchSettingsAction(_ sender: Any) {
        mySettingsTableView.reloadData()
    }
    
    
    // MARK ************** Fonction pour le protocol UITableViewDataSource ****************
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {

        return pseudoList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! settingsCell
        myCell.selectionStyle = .none
        
            if (myCell.privatePublicSwitch.isOn == true)
            {
                myCell.statusLabel.text = "Public"
                myCell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                myCell.statusLabel.textColor = UIColor(red: 0.000, green: 0.898, blue: 0.239, alpha: 1.00)
            } else
            {
                myCell.statusLabel.text = "Privé"
                myCell.statusLabel.textColor = UIColor(red: 0.976, green: 0.212, blue: 0.263, alpha: 1.0)
                //myCell.backgroundColor = UIColor(red: 0.976, green: 0.212, blue: 0.263, alpha: 0.2)
            }
            myCell.socialTextField.text = pseudoList[indexPath.row]
            // Design de l'image des barres du coté (taille, position...)
            myCell.barImage?.image = UIImage(named: barImageList[indexPath.row])
            
            // Design de l'image des réseaux sociaux (taille, position...)
            myCell.socialMediaImage?.image = UIImage(named: socialMediaImageList[indexPath.row])
        
        return myCell
    }

}
