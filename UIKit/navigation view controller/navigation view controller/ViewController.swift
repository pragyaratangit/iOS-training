//
//  ViewController.swift
//  navigation view controller
//
//  Created by Pragyaratan on 22/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabChangeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
        
        // first way
        // by creating a class of view controller
        // then present it on click of button
        
        
        // second way
        // create separate file for viewcontroller
    }

    @IBAction func tabChangeButtonTap(_ sender: Any) {
//        present(MyViewController(), animated: true) // first way
        
        guard let vc = storyboard?.instantiateViewController(identifier: "green_vc") as? MyUIViewController else{
            return
        }
        
        present(vc, animated: true)
    }
    

}


class MyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

}
