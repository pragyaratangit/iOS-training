//
//  ViewController.swift
//  input fields
//
//  Created by Pragyaratan on 14/02/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var hiddenView: UIView!
    
    
    @IBOutlet weak var backButton: UILabel!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var headingLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameInput: UITextField!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var emailInput: UITextField!
    
    
    @IBOutlet weak var mobileLabel: UILabel!
    
    @IBOutlet weak var mobileInput: UITextField!
    
    
    
    @IBOutlet weak var submitButton: UIButton!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        delegateSetting()
        settingPositions()
        
        
        backButton.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(backFunction(sender: )))
        backButton.addGestureRecognizer(tap)
        
    }

    @objc func backFunction(sender: UITapGestureRecognizer){
        if !hiddenView.isHidden {
            hiddenView.isHidden = true
        }
    }

    func delegateSetting() {
        nameInput.becomeFirstResponder()
        
        nameInput.delegate = self
        mobileInput.delegate = self
        emailInput.delegate = self
    }
    
    func settingPositions(){
        hiddenView.isHidden  = true
        headingLabel.text = "Login"
        nameLabel.text = "Name"
        emailLabel.text = "Email"
        mobileLabel.text = "Mobile"
        submitButton.setTitle("Submit", for: .normal)
        submitButton.tintColor = UIColor.black
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        
        nameInput.placeholder = "Enter name"
        emailInput.placeholder = "Enter email"
        mobileInput.placeholder = "Enter mobile"
        mobileInput.keyboardType = .numberPad
                
        
        submitButton.layer.borderWidth = 1
        submitButton.backgroundColor = UIColor.init(red: 0, green: 0, blue: 150, alpha: 1)
        
        view.backgroundColor = UIColor.green
    }
    
    
    @IBAction func handleSubmit(_ sender: Any) {
        
        
        
        // check if all inputs are filled
        if ( (nameInput.text?.isEmpty ?? false) || (emailInput.text?.isEmpty ?? false) || (mobileInput.text?.isEmpty ?? false) ) {
            
            
            let alert = UIAlertController(title: "fill", message: "Please fill all the details", preferredStyle: .alert)
//            let action = UIAlertAction(title: "OK", style: .default) { (action) in
//                           self.dismiss(animated: true, completion: nil)
//                       }
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        else if mobileInput.text?.count != 10  {
            let alert = UIAlertController(title: "Wrong", message: "Please fill 10 digits in mobile", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            present(alert, animated: true, completion: nil)
        }
        else{
            hiddenView.isHidden = false
            outputLabel.text = "Welcome " + (nameInput.text ?? "")
        }
            
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Allow only digits
        
        if textField == mobileInput {
            let allowedCharacters = CharacterSet(charactersIn: "0123456789")
            let characterSet = CharacterSet(charactersIn: string)

            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }

    
    
}

