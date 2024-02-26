//
//  MyTabBarController.swift
//  Likeable table cell project
//
//  Created by Pragyaratan on 26/02/24.
//

import UIKit

class MyTabBarController: UITabBarController {

    
//    @IBOutlet weak var tabBar: UITabBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if viewControllers?[0] is ViewController{
            print("first")
            }

        if viewControllers?[1]  is FavouriteTab{
            print("second")
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
