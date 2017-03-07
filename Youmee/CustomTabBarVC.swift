//
//  CustomTabBarVC.swift
//  Youmee
//
//  Created by Wolfy on 01/02/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit



class CustomTabBarVC: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        //self.tabBarItem.image = UIImage(named: )
        self.tabBar.barTintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor.darkGray
        self.selectedIndex = 1
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
