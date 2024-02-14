//
//  ViewController.swift
//  segment controller
//
//  Created by Pragyaratan on 14/02/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentChange(_ sender: Any) {
        
        
        switch segmentController.selectedSegmentIndex {
        case 0:
            outputLabel.text = "segment 1 is selected"
            outputLabel.backgroundColor = UIColor.red
        case 1:
            outputLabel.text = "segment 2 is selected"
            outputLabel.backgroundColor = UIColor.green
        case 2:
            outputLabel.text = "segment 3 is selected"
            outputLabel.backgroundColor = UIColor.blue
        default: break
        }
    }
    
}

