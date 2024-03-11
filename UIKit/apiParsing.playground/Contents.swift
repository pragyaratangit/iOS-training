import UIKit
import PlaygroundSupport

var greeting = "Hello, playground"


PlaygroundPage.current.needsIndefiniteExecution = true




struct Hotel: Decodable {
    let address: String
}


struct HotelData {
    
    func getHotelDetails() {
//        var urlRequest = URLRequest(url: URL(string: "https://oyohotel.free.beeceptor.com/getHotel")!)
//
//        print("url is hitting")
//        urlRequest.httpMethod = "get"
        
        
        URLSession.shared.dataTask(with: URL(string: "https://oyohotel.free.beeceptor.com/getHotel")!){
            (data, respons, error) in
            
            if error != nil {
                print("error in api \(String(describing: error?.localizedDescription))")
            }
            
            if data != nil && data?.count != 0 {
                print("data is not nill")
                let decoder = JSONDecoder()
                
                do{
                    let hotelData = try JSONDecoder().decode(Hotel.self, from: data!)
                    
//                    let hotelData = try JSONSerialization.jsonObject(with: data!)
//                    let hotel = hotelData as! Dictionary<String, Any>
//                    let dataString = String(data: data!, encoding: .utf8)
//                    print(dataString!)
                    print(hotelData)
                }
                catch let error {
                    print("error while decoding \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}

let hotelDataObj = HotelData()

hotelDataObj.getHotelDetails()
