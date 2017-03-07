//
//  signupVC.swift
//  Youmee
//
//  Created by Wolfy on 05/02/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit

class signupVC: UIViewController {

    
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBAction func signUpButton(_ sender: Any) {
        if let url = NSURL(string: "https://m.facebook.com/reg/?cid=103&refid=8")
        { UIApplication.shared.open(url as URL, options: [:], completionHandler: nil) }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backItem?.title = "<"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
