//
//  ViewController.swift
//  User Defaults
//
//  Created by Pragyaratan on 12/03/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if UserDefaults.standard.value(forKey: "userName") != nil {
            userNameTextField.text = UserDefaults.standard.value(forKey: "userName") as! String
            passwordTextField.text = UserDefaults.standard.value(forKey: "password") as! String
            
            
        }
    }


    
    @IBAction func loginButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Save login details", message: "For Later", preferredStyle: .alert)
        
        
        let yesButton = UIAlertAction(title: "Yes", style: .default){
            action in
            let userdefault = UserDefaults.standard
            
            userdefault.setValue(self.userNameTextField.text!, forKey: "userName")
            userdefault.setValue(self.passwordTextField.text!, forKey: "password")
            
            self.performSegue(withIdentifier: "mySegue", sender: self)
            
        }
        
        let noButton = UIAlertAction(title: "No", style: .default){
            action in
            
            let userdefault = UserDefaults.standard
            
            userdefault.setValue("", forKey: "userName")
            userdefault.setValue("", forKey: "password")
            
            
            self.performSegue(withIdentifier: "mySegue", sender: self)
        }
        
        alertController.addAction(yesButton)
        alertController.addAction(noButton)
        
        
        present(alertController, animated: true)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            
            let vc = segue.destination as! HomePage
            vc.loginDetails = "hello \(userNameTextField.text!)"
        }
        
       
        
    }
    
    
}

