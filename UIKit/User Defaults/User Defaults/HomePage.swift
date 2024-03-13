//
//  HomePage.swift
//  User Defaults
//
//  Created by Pragyaratan on 12/03/24.
//

import UIKit

class HomePage: UIViewController {

    
    @IBOutlet weak var loginDataDisplay: UILabel!
    
    var loginDetails:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginDataDisplay.text = loginDetails
    }
   
}
