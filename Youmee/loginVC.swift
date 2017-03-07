//
//  ViewController.swift
//  Youmee
//
//  Created by Wolfy on 27/01/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit


class loginVC: UIViewController, UIPageViewControllerDataSource {

    var pageVC : UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    
    @IBAction func LoginButton(_ sender: Any) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        // Demande de permission pour avoir accés à l'email
        fbLoginManager.logIn(withReadPermissions: ["public_profile","email", "user_actions.music", "user_actions.fitness"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email") && fbloginresult.grantedPermissions.contains("public_profile"))
                    {
                        
                        // On se dirige vers le VC d'accueil (soit le VC de la Map)
                        self.performSegue(withIdentifier: "goToMap", sender: self)
                        
                        
                        // GRAPH REQUEST POUR RECUPERER LES DONNEES FB DE L'UTILISATEUR
                        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, first_name, last_name, email, picture, sports, movies, music"]).start(completionHandler: { (connection, result, error) -> Void in
                            if (error == nil){
                                //Convertion du dictionnaire de données en format JSON
                                do {
                                    let fbData = result as! NSDictionary
                                    let jsonData = try JSONSerialization.data(withJSONObject: fbData, options: .prettyPrinted)
                                    let jsonString: String! = String(data: jsonData, encoding: String.Encoding.utf8)
                                    //self.createUser(userData: jsonData)
                                    print("/**** STRING JSON --> *******")
                                    let accesst = FBSDKAccessToken.current()
                                    let id = FBSDKAccessToken.current().userID
                                    print(" ***** ACCESS TOKEN ***** --> \(accesst)")
                                    print(" ***** ID TOKEN ***** --> \(id)")

                                    print(jsonString)
                                } catch {
                                    print("/****ERROR --> *******" + error.localizedDescription)
                                }
                            }
                        })
                    }
                }
            }
        }

    }
    @IBAction func controllerNoFBtoLogin(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.pageTitles = NSArray(objects: "Bienvenue sur Youmee \n Découvre les gens autour de toi en temps réel !", "Jettez un coup d'oeil aux personnes qui vous interessent et prenez contact avec elles !", "Tuto n°3")
        self.pageImages = NSArray(objects: "tuto1", "tuto2", "tuto3")

        self.pageVC = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! UIPageViewController
        self.pageVC.dataSource = self
        let startVC = self.viewControllerAtIndex(index: 0) as FirstTutoVC
        let viewControllers = NSArray(object: startVC)
        self.pageVC.setViewControllers(viewControllers as! [FirstTutoVC], direction: .forward, animated: true, completion: nil)
        self.pageVC.view.frame = CGRect(x: 0,y: 30,width: self.view.frame.width,height: self.view.frame.height - 200)
        self.addChildViewController(self.pageVC)
        self.view.addSubview(self.pageVC.view)
        self.pageVC.didMove(toParentViewController: self)
    }
    
    func viewControllerAtIndex(index: Int) ->  FirstTutoVC
    {
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count))
        {
            return FirstTutoVC()
        }
        let vc: FirstTutoVC = self.storyboard?.instantiateViewController(withIdentifier: "FirstTutoVC") as! FirstTutoVC
        vc.imageFile = self.pageImages[index] as! String
        vc.titleText = self.pageTitles[index] as! String
        vc.pageIndex = index
        
        return vc
    }
    
    
    
    // PAGE VIEW CONTROLLER DATA SOURCE
    
    
    // Si on va au VC d'avant, on fait index--
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! FirstTutoVC
        var index = vc.pageIndex as Int
        
        if (index == 0 || index == NSNotFound)
        {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index: index)

    }
    
    // Si on va au VC d'apres, on fait index++
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            let vc = viewController as! FirstTutoVC
            var index = vc.pageIndex as Int
            
            if (index == NSNotFound)
            {
                return nil
            }
            
            index += 1
            
            if (index == self.pageTitles.count)
            {
                return nil
            }
        
            return self.viewControllerAtIndex(index: index)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

