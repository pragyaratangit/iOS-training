//
//  ViewController.swift
//  toast notifications
//
//  Created by Pragyaratan on 11/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toastBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func buttonTap(_ sender: Any) {
        
        showToastMessage(message: "Button clicked")
        
        
    }
    
    
    func showToastMessage(message: String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
           toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
           toastLabel.textColor = UIColor.white
        toastLabel.font = .systemFont(ofSize: 12)
           toastLabel.textAlignment = .center;
           toastLabel.text = message
           toastLabel.alpha = 1.0
           toastLabel.layer.cornerRadius = 10;
           toastLabel.clipsToBounds  =  true
        view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 3.0, delay: 0.1, animations: {
            toastLabel.alpha = 0
        }, completion: {
            (isComplete) in
            toastLabel.removeFromSuperview()
        })
    }
}

