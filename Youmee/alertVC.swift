//
//  alertVC.swift
//  Youmee
//
//  Created by Wolfy on 03/03/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit

class alertVC: UIViewController {

    
    var pseudo = String()
    var socialMediaImage = String()
    
    @IBOutlet weak var imageAlert: UIImageView!
    @IBOutlet weak var pseudoAlert: UILabel!
    @IBOutlet weak var alertView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        alertView.layer.cornerRadius = 50
        alertView.layer.masksToBounds = true
        pseudoAlert.text = pseudo
        imageAlert.image = UIImage(named: socialMediaImage)
    }

    
    @IBAction func copyButtonAction(_ sender: Any) {
        print("Ajout ordonné :) !")
        if socialMediaImage == "snapchatLogo"
        {
            if let url = NSURL(string: "https://www.snapchat.com/add/\(pseudo)") {
                UIApplication.shared.open(url as URL, options: [:])
            }
        } else if socialMediaImage == "facebookLogo"
        {
            let pseudoAttache = pseudo.replacingOccurrences(of: " ", with: "")
            print(pseudoAttache)
            if let url = NSURL(string: "https://www.facebook.com/\(pseudoAttache)") {
                UIApplication.shared.open(url as URL, options: [:])
            }
        } else if socialMediaImage == "instagramLogo"
        {
            if let url = NSURL(string: "https://www.instagram.com/\(pseudo)") {
                UIApplication.shared.open(url as URL, options: [:])
            }
        } else if socialMediaImage == "twitterLogo"
        {
            if let url = NSURL(string: "https://twitter.com/\(pseudo)") {
                UIApplication.shared.open(url as URL, options: [:])
            }
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.dismiss(animated: true, completion: nil)
    }

}
