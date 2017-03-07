//
//  FirstTutoVC.swift
//  Youmee
//
//  Created by Wolfy on 29/01/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit

class FirstTutoVC: UIViewController {
    @IBOutlet weak var picLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picLabel.image = UIImage(named: self.imageFile)
        self.titleLabel.text = self.titleText
        self.titleLabel.font = UIFont(name: "Avenir-Light", size: 20)
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
