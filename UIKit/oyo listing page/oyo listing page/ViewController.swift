//
//  ViewController.swift
//  oyo listing page
//
//  Created by Pragyaratan on 19/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hotelImageView: UIImageView!
    
    @IBOutlet weak var likeIcon: UIImageView!
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        hotelImageView.image = UIImage(named: "hotel1")
        hotelImageView.contentMode = .scaleAspectFill
        hotelImageView.layer.cornerRadius = 10
//        likeIcon.contentMode = .scaleAspectFill
//        likeIcon.image = UIImage(named: "Heart")
//        likeIcon.image = UIImage(named: "Like")
        likeIcon.alpha = 2
        likeIcon.layer.cornerRadius = 50
        textLabel.backgroundColor = .white
        textLabel.textColor = .black
        textLabel.layer.cornerRadius = 100
        textLabel.textAlignment = .center
    }


}

