//
//  CustomTableViewCell.swift
//  OYO listing table view
//
//  Created by Pragyaratan on 08/03/24.
//

import UIKit



class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    
    @IBOutlet weak var hotelImage: UIImageView!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var ratingCount: UILabel!
    @IBOutlet weak var paymentMode: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var shortAddress: UILabel!
    @IBOutlet weak var service1: UILabel!
    @IBOutlet weak var service2: UILabel!
    @IBOutlet weak var originalPrice: UILabel!
    @IBOutlet weak var slasherPrice: UILabel!
    @IBOutlet weak var discountPercentage: UILabel!
    @IBOutlet weak var taxTxn: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    public func configure(with hotel: Hotel){
        
        
       
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = try? Data(contentsOf: URL(string: hotel.image)!){
                DispatchQueue.main.async{
                    self.hotelImage.image = UIImage(data: data)
                }
                
            }
        }
        
        self.rating.text = String(hotel.rating)
        self.ratingCount.text = String(hotel.rating_count)
        self.paymentMode.text = hotel.payment_mode
        self.name.text = hotel.name
        self.shortAddress.text = hotel.short_address
        self.service1.text = hotel.services[0]
        self.service2.text = hotel.services[1]
        self.originalPrice.text = "₹" + String(hotel.final_price)
        self.slasherPrice.text = "₹" + String(hotel.slasher_price)
        self.discountPercentage.text = String(hotel.discount_percentage) + "% off"
        self.taxTxn.text = hotel.tax_txt
        
        initialStyling()
        
    }
    func initialStyling() {
        hotelImage.layer.cornerRadius = 10
        hotelImage.contentMode = .scaleToFill
        ratingCount.textColor = UIColor.gray
        shortAddress.textColor = UIColor.gray
        service1.textColor = .purple
        originalPrice.font = .boldSystemFont(ofSize: 30)
        discountPercentage.textColor = .systemGreen
        paymentMode.textColor = .systemGreen
        taxTxn.textColor = .gray
        
        
        // making text Strike through by a line
        let attributedString = NSMutableAttributedString(string: slasherPrice.text ?? "")

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
        
        slasherPrice.attributedText = attributedString
    }
}
