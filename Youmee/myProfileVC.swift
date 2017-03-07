//
//  profileVC.swift
//  Youmee
//
//  Created by Wolfy on 06/02/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class myProfileVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var profilPicture: UIImageView!
    @IBOutlet weak var coverPicture: UIImageView!
    @IBOutlet weak var mySegControl: profileCustomSC!
    @IBOutlet weak var socialsTableView: UITableView!
    let pseudoList: [String] = ["Romain Fllr","rorotvaror8","0649696937","wolfyiy", "@FallerRomain"]
    let hobbiesList: [String] = ["BasketBall","Battlefield 1","Cinéma"]
    let barImageList: [String] = ["navyBar","yellowBar","greenBar","redBar","blueBar"]
    let socialMediaImageList: [String] = ["facebookLogo","snapchatLogo","watsappLogo","instagramLogo","twitterLogo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        socialsTableView.separatorColor = UIColor.clear
        profilPicture.layer.cornerRadius = (profilPicture.frame.size.height)/2
        profilPicture.layer.masksToBounds = true
    }
    
    @IBAction func settingsCancel(segue: UIStoryboardSegue) {
    }
    
    @IBAction func switchAction(_ sender: Any) {
    socialsTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // status bar en blanc
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func SegmentedControlChanged(_ sender: Any) {
    socialsTableView.reloadData()
    }
    
    @IBAction func logOutButton(_ sender: Any) {
    print("******Log out ******")
    FBSDKLoginManager().logOut()
    self.performSegue(withIdentifier: "logOutToLogin", sender: self)
    }
    
    @IBAction func editProfilButton(_ sender: Any) {
    }

    // Méthode pour garder les informations du profil dans le VC des settings
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let settingVC: settingsVC = segue.destination as! settingsVC
            settingVC.descrip = descriptionLabel.text!
            settingVC.name = nameLabel.text!
            settingVC.profilImage = profilPicture.image!
            for i in 0...barImageList.count-1
            {
            settingVC.barImageList.insert(barImageList[i], at: i)
            }
            for i in 0...socialMediaImageList.count-1
            {
            settingVC.socialMediaImageList.insert(socialMediaImageList[i], at: i)
            }
            for i in 0...pseudoList.count-1
            {
            settingVC.pseudoList.insert(pseudoList[i], at: i)
            }
        settingVC.barImageList.remove(at: barImageList.count)
        settingVC.socialMediaImageList.remove(at: socialMediaImageList.count)
        settingVC.pseudoList.remove(at: pseudoList.count)

    }
    
    // MARK ************** Fonction pour le protocol UITableViewDataSource ****************
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var returnValue = 0
        switch (mySegControl.selectedIndex) {
        case 0:
            returnValue = pseudoList.count
            break
        case 1:
            returnValue = hobbiesList.count
            break
        default:
            break
        }
        return returnValue
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myProfileCell", for: indexPath) as! myProfileTableViewCell
        myCell.selectionStyle = .none
        switch (mySegControl.selectedIndex) {
        case 0:
            
            myCell.privatePublicSwitch.isHidden = false
            myCell.statusLabel.isHidden = false

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
        
            // Design du label du pseudo (polices...)
            myCell.pseudoLabel?.text = pseudoList[indexPath.row]
            myCell.pseudoLabel?.font = UIFont(name: "AvenirNext-Bold", size: 15)
            myCell.pseudoLabel?.textColor = UIColor(red: 0.000, green: 0.576, blue: 0.918, alpha: 1.0)
            
            // Design de l'image des barres du coté (taille, position...)
            myCell.barImage?.image = UIImage(named: barImageList[indexPath.row])
            
            // Design de l'image des réseaux sociaux (taille, position...)
            myCell.socialMediaImage?.image = UIImage(named: socialMediaImageList[indexPath.row])
            break
        case 1:
            myCell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            myCell.pseudoLabel?.text = hobbiesList[indexPath.row]
            myCell.barImage?.image = UIImage(named: "")
            myCell.socialMediaImage?.image = UIImage(named: "")
            myCell.privatePublicSwitch.isHidden = true
            myCell.statusLabel.isHidden = true
            break
        default:
            break
        }
        
        return myCell
    }

}
