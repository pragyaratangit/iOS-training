//
//  ViewController.swift
//  custom view component
//
//  Created by Pragyaratan on 13/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: CustomView!
    
    
    @IBOutlet weak var secondView: CustomView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView.configText(with: "First View")
        secondView.configText(with: "Second View")
    }


}

