//
//  ViewController.swift
//  first iOS app
//
//  Created by Pragyaratan on 13/02/24.
//

import UIKit

class ViewController: UIViewController {

    var didTap = false
    @IBOutlet weak var helloWorld: UILabel!
    
    @IBOutlet weak var toggleButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.black
        decorateLabel()
    }

    func decorateLabel(){
        helloWorld.text = "Hello World!"
        helloWorld.textColor = UIColor.blue
        helloWorld.backgroundColor = UIColor.gray
        toggleButton.backgroundColor = UIColor.blue
        toggleButton.tintColor = UIColor.black
//        toggleButton.textColor = UIColor.black
    }
    
    
    @IBAction func toggleTextColor(){
        if didTap {
            helloWorld.text = "Hello World!"
            helloWorld.textColor = UIColor.blue
            helloWorld.backgroundColor = UIColor.gray
            didTap = false
        }
        else {
            helloWorld.text = "Button clicked"
            helloWorld.textColor = UIColor.red
            helloWorld.backgroundColor = UIColor.gray
            didTap = true
        }
    }
}
