//
//  ViewController.swift
//  oyo listing page
//
//  Created by Pragyaratan on 19/02/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var hotelImage: UIImageView!
    
    @IBOutlet weak var hotelRating: UILabel!
    
    @IBOutlet weak var ratingCount: UILabel!
    
    
    @IBOutlet weak var paymentMode: UILabel!
    
    
    @IBOutlet weak var hotelName: UILabel!
    
    @IBOutlet weak var hotelLocation: UILabel!
    
    
    @IBOutlet weak var hotelQuality1: UILabel!
    
    @IBOutlet weak var hotelQuality2: UILabel!
    
    
    
    
    @IBOutlet weak var priceOfferPercentage: UILabel!

    
    @IBOutlet weak var extraCharges: UILabel!
    
    
    @IBOutlet weak var hotelRoomPrice: UILabel!
    
    
    @IBOutlet weak var roomOriginalPrice: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        initialStyling()
        
    }

    
    
    func initialStyling() {
        hotelImage.layer.cornerRadius = 10
        ratingCount.textColor = UIColor.gray
        hotelLocation.textColor = UIColor.gray
        hotelQuality1.textColor = .purple
        hotelRoomPrice.font = .boldSystemFont(ofSize: 30)
        priceOfferPercentage.textColor = .systemGreen
        paymentMode.textColor = .systemGreen
        extraCharges.textColor = .gray
        
        
        // making text Strike through by a line
        let attributedString = NSMutableAttributedString(string: roomOriginalPrice.text ?? "")

        // Applying the strikethrough style
        attributedString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: attributedString.length))

        // Optional: Applying strikethrough color
        attributedString.addAttribute(
            NSAttributedString.Key.strikethroughColor,
            value: UIColor.black,
            range: NSRange(location: 0, length: attributedString.length))
        
        roomOriginalPrice.attributedText = attributedString
    }
}

//
