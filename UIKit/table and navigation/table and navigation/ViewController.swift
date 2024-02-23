//
//  ViewController.swift
//  table and navigation
//
//  Created by Pragyaratan on 23/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func buttonOneTap(_ sender: Any) {
        let vc = MyTableViewController()
        
        vc.model = [("First", {
            print("first")
        }),
                    ("second", {
                        print("second")
                    }),
                    ("Third", {
                        print("Third")
                    }),
                    ("Fourth", {
                        print("Fourth")
                    })]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func buttonTwoTap(_ sender: Any) {
        let vc = MyTableViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

