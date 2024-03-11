//
//  ViewController.swift
//  post api example
//
//  Created by Pragyaratan on 11/03/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        postData()
        // Do any additional setup after loading the view.
    }

    
    func postData() {
        var urlReq = URLRequest(url: URL(string: "https://api.restful-api.dev/objects")!)
        
        
        urlReq.httpMethod = "post"
        let data: Dictionary<String, Any> = ["name":"aman", "data":["year": 2019,"price": 1849.99,"CPU model": "Intel Core i9","Hard disk size": "1 TB"], ]
        
        
        
        do {
            let reqBody = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            
            
            urlReq.httpBody = reqBody
            
            urlReq.addValue("application/json", forHTTPHeaderField: "content-type")
        }
        catch let error {
            print(error)
        }
        
        
        URLSession.shared.dataTask(with: urlReq) {
            (response, httpRes, error) in
            if response != nil && response?.count != 0 {
                print("here")
                let data = String(data: response!, encoding: .utf8)
                
                print(data!)
            }
            if error != nil {
                print( error ?? "error found")
            }
        }.resume()
        
        
    }

}

