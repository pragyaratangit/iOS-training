//
//  ViewController.swift
//  api and web service
//
//  Created by Pragyaratan on 06/03/24.
//

import UIKit

class ViewController: UIViewController {

    let taskText = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 50))
    var dataInDict: Dictionary<String, Any> = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(taskText)
//        getData()
        
        postAPIExample()
        
        
    }


    
    func getData() {
        
        let session = URLSession.shared
        // get api
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else { return }
       
      
        let task = session.dataTask(with: url) {[weak self] (data, response, error) in
            if error == nil {
                let httpResponse = response as! HTTPURLResponse
                
                if httpResponse.statusCode == 200 {
                    let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    
                    
                    
                    self?.dataInDict = jsonData as! Dictionary<String, Any>
                    print("title = \(String(describing: self?.dataInDict["title"]!))")
                      print(jsonData!)
                    
                }
                
                
            }
            else {
                print("error \(error!) " )
            }
          
        }
        task.resume()
        
    }
    
    
    func postAPIExample() {
//        var urlRequest = URLRequest(url: URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/User/RegisterUser")!)
        var urlRequest = URLRequest(url: URL(string: "https://bff.oyorooms.com/v1/searchHotels")!)
        
        urlRequest.httpMethod = "get"
        
        let dataToPost = ["name":"Pragyaratan" , "email" : "pragyaratan@gmail.com" , "password":"abcd"]
        
        let requestBody = try? JSONSerialization.data(withJSONObject: dataToPost, options: .prettyPrinted)
        
        
//        urlRequest.httpBody = requestBody
//        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        
        URLSession.shared.dataTask(with: urlRequest){
            (data, response, error) in
            if data != nil && data?.count != 0 {
                let dataString = String(data: data!, encoding: .utf8)
                print(dataString!)
            }
        }.resume()
        
    }
    
    
}

