//
//  ViewController.swift
//  oyo listing page
//
//  Created by Pragyaratan on 19/02/24.
//

import UIKit


struct Hotels: Decodable{
    let hotelData: [Hotel]
}

struct Hotel: Decodable {
    let id: Int
    let name: String
    let address: String
    let alternate_name: String
    let city:String
    let country_name:String
    let short_address: String
//    let services: [String]
    let slasher_price: Double
    let final_price: Double
    let discount_percentage: Int
    let tax_txt: String
    
//    let best_image: String
}



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
        getHotelDetails()
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
    
    
    
    
    func getHotelDetails() {

        
        URLSession.shared.dataTask(with: URL(string: "https://oyolisting.free.beeceptor.com/getHotelData")!){
            (data, respons, error) in
            
            if error != nil {
                print("error in api \(String(describing: error?.localizedDescription))")
            }
            
            if data != nil && data?.count != 0 {
                print("data is not nill")
                let decoder = JSONDecoder()
                
                do{
                    
                    let hotelData = try decoder.decode(Hotels.self, from: data!)
                   
//                    let hotelData = try JSONSerialization.jsonObject(with: data!)
//                    let hotel = hotelData as! Dictionary<String, Any>
//                    let dataString = String(data: data!, encoding: .utf8)
//                    print(dataString!)
                    for hotel in hotelData.hotelData {
                        print(hotel)
                    }
                }
                catch let error {
                    print("error while decoding \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

//
