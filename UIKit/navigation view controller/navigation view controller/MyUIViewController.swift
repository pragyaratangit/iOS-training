//
//  MyUIViewController.swift
//  navigation view controller
//
//  Created by Pragyaratan on 22/02/24.
//

import UIKit

class MyUIViewController: UIViewController {

    @IBOutlet weak var myVCButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }
    

    @IBAction func myVCButtonTap(_ sender: Any) {
        
//        present(MyViewController(), animated:true)
        //
        dismiss(animated: true)
    }
    
}
