//
//  ViewController.swift
//  oyo listing page with api
//
//  Created by Pragyaratan on 06/03/24.
/*
{"hotelData": [{
"id": 230282,
            "name": "OYO Indian Residency",
            "address": "No. 232, Near Adams Academy 1st Cross, Patalamma Layout, Kadugodi, Bangalore",
            "alternate_name": "Indian Residency",
            "city": "Bangalore",
            "country_name": "India",
            "short_address": "Kadugodi, Bangalore",
"slasher_price": 3093.0,
                    "final_price": 499.0,
                    "discount_percentage": 75,
                        "tax_txt": "+ ₹100 taxes & fees"}]}
*/

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

   
    override func viewDidLoad() {
        super.viewDidLoad()
        getHotelDetails()
        // Do any additional setup after loading the view.
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

