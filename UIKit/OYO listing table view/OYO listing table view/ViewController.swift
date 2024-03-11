//
//  ViewController.swift
//  OYO listing table view
//
//  Created by Pragyaratan on 08/03/24.
//

import UIKit



struct Hotels: Decodable{
    let hotelData: [Hotel]
}

struct Hotel: Decodable {
    let image: String
    let rating: Double
    let rating_count: Int
    let payment_mode: String
    let name: String
    let short_address: String
    let services: [String]
    let final_price: Double
    let slasher_price: Double
    let discount_percentage: Int
    let tax_txt: String
}
/*
 {
 "image": "https://images.oyoroomscdn.com/uploads/hotel_image/230282/cuqswngvdihe.jpg",
 "rating": 4.7,
 "rating_count": 63,
 "payment_mode": "Pay at hotel",
 "name": "OYO Indian Residency",
 "short_address": "Kadugodi, Bangalore",
 "services": ["Couples are welcome", "Managed by OYO"],
 "final_price": 499.0,
 "slasher_price": 3093.0,
 "discount_percentage": 75,
 "tax_txt": "+ ₹100 taxes & fees"
 }
 
 */

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var hotels: Hotels = Hotels(hotelData: [])
    
    @IBOutlet weak var listingTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewSetup()
        getHotelData(url: "https://oyolistingapi.free.beeceptor.com/getHotelData") {
            data in
            self.hotels = data
            DispatchQueue.main.async {
                self.listingTable.reloadData()
            }
        }
        
    }
    
    func tableViewSetup() {
        listingTable.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        listingTable.dataSource = self
        listingTable.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(hotels.hotelData.count)
        return hotels.hotelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listingTable.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
        cell.configure(with: hotels.hotelData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
   
    
    func getHotelData(url: String, completionHandler: @escaping (Hotels) -> Void) {
        
        
        URLSession.shared.dataTask(with: URL(string: url)!){
            
            (responseData, httpResponseStatus, error) in
            
            if error == nil && responseData != nil && responseData?.count != 0 {
                
                let decoder = JSONDecoder()
                
                do{
                    let data = try decoder.decode(Hotels.self, from: responseData!)
                    
                    completionHandler(data)
                }
                catch let error {
                    print("error in decoding \(error)")
                }
            }
        }.resume()
    }
}
