//
//  ProfileVC.swift
//  Youmee
//
//  Created by Wolfy on 03/03/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var myCustomSC: profileCustomSC!
    @IBOutlet weak var myCollectionV: UICollectionView!
    @IBOutlet weak var profilePicture: UIImageView!
    
    let pseudoList: [String] = ["Tomas Lo Pinto","ropsten","0649696937","wolfyiy", "@FallerRomain"]
    let socialMediaImageList: [String] = ["facebookLogo","snapchatLogo","watsappLogo","instagramLogo","twitterLogo"]
    let hobbiesList: [String] = ["BasketBall","Battlefield 1","Cinéma"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func segmentedAction(_ sender: Any) {
        myCollectionV.reloadData()
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
    }
    
    @IBAction func messageButtonAction(_ sender: Any) {
    }
    
    
    // MARK - ****** Méthodes pour la collectionView
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        var returnValue = 0
        switch (myCustomSC.selectedIndex) {
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
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let myCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionCell", for: indexPath) as! myCustomCollectionCell

        switch (myCustomSC.selectedIndex) {
        case 0:
            myCollectionCell.socialMediaLabel.text = pseudoList[indexPath.row]
            myCollectionCell.socialMediaPicture.image = UIImage(named: socialMediaImageList[indexPath.row])
            break
        case 1:
            myCollectionCell.socialMediaPicture.image = UIImage(named: "hobbiesPicture")
            myCollectionCell.socialMediaLabel.text = hobbiesList[indexPath.row]
            break
        default:
            break
        }
        return myCollectionCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        switch (myCustomSC.selectedIndex) {
        case 0:
            print("cell \(indexPath.row) selected")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myAlert: alertVC = storyboard.instantiateViewController(withIdentifier: "alert") as! alertVC
            myAlert.pseudo = pseudoList[indexPath.row]
            myAlert.socialMediaImage = socialMediaImageList[indexPath.row]
            myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(myAlert, animated: true, completion: nil)
            break
        case 1:
            print("cell \(indexPath.row) selected")
            break
        default:
            break
        }
    }
}
