//
//  ViewController.swift
//  user defaults custom object
//
//  Created by Pragyaratan on 14/03/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var ageTextField: UITextField!
    
    
    @IBOutlet weak var contactTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func saveData(_ sender: Any) {
        
        
        var userDetail = UserDetail()
        userDetail.name = nameTextField?.text!
        userDetail.age = Int(ageTextField?.text! ?? "0")
        userDetail.contact = contactTextField?.text!
        userDetail.city = cityTextField?.text!
        
        let defaults = UserDefaults.standard
        
        defaults.setValue( try? PropertyListEncoder().encode(userDetail) , forKey: "userDetail")
        
        updateValue(userDetail: UserDetail())
        
    }
    
    
    @IBAction func retrieveData(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        var userDetail = UserDetail()
        if let userData = defaults.value(forKey: "userDetail") as? Data {
            userDetail =  try! PropertyListDecoder().decode(UserDetail.self
                                                      , from: userData)
        }
        
        updateValue(userDetail: userDetail)
    }
    func updateValue(userDetail: UserDetail){
        nameTextField.text = userDetail.name!
        ageTextField.text = String(userDetail.age!)
        contactTextField.text = userDetail.contact!
        cityTextField.text = userDetail.city!
    }
}



