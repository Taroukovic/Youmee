//
//  trendingVC.swift
//  Youmee
//
//  Created by Wolfy on 07/02/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit

class trendingVC: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var trendingTableView: UITableView!
    @IBOutlet weak var trendingSegementedControl: trendingCustomSC!
    
    let demandesList: [String] = ["Romain Fllr", "Julia Calzolari"]
    let timelineList: [String] = ["News 1", "News 2"]
    let userImagesList: [String] = ["defaultProfilePicture","defaultProfilePicture"]
    let socialImagesList: [String] = ["facebookLogo", "instagramLogo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func timelineDemandesSC(_ sender: Any) {
        trendingTableView.reloadData()
    }
    
    
    
    @IBAction func testAction(_ sender: Any) {
        print("Test**********")
    }
    
    
    
    
    // MARK ************** Fonction pour le protocol UITableViewDataSource ****************
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var returnValue = 0
        switch (trendingSegementedControl.selectedIndex) {
        case 0:
            returnValue = demandesList.count
            break
        case 1:
            returnValue = timelineList.count
            break
        default:
            break
        }
        return returnValue
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myTrendingCell", for: indexPath) as! myTrendingTableViewCell
        switch (trendingSegementedControl.selectedIndex) {
        case 0:
            myCell.addButtonLabel.isHidden = false
            myCell.profileUserImage.image = UIImage(named: userImagesList[indexPath.row])
            myCell.socialImage.image = UIImage(named: socialImagesList[indexPath.row])
            myCell.socialImage.layer.borderColor = UIColor.white.cgColor
            myCell.socialImage.layer.borderWidth = 0
            myCell.socialImage.layer.masksToBounds = false
            myCell.socialImage.layer.cornerRadius = myCell.socialImage.frame.height/2
            myCell.socialImage.clipsToBounds = true
            myCell.demandeLabel.text = demandesList[indexPath.row] + " vous demande votre compte Instagrame"
            
            break
        case 1:
            myCell.socialImage.image = UIImage(named: "")
            myCell.profileUserImage.image = UIImage(named: "")
            myCell.addButtonLabel.isHidden = true
            myCell.demandeLabel.text = timelineList[indexPath.row]
            break
        default:
            break
        }
        
        return myCell
    }

}
