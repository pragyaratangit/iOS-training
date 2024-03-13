//
//  ViewController.swift
//  signup page
//
//  Created by Pragyaratan on 13/03/24.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var headingView: HeaderFooterView!
    
    @IBOutlet weak var firstName: InputView!
    @IBOutlet weak var lastName: InputView!
    @IBOutlet weak var email: InputView!
    @IBOutlet weak var mobileNumber: InputView!
    @IBOutlet weak var houseNumber: InputView!
    @IBOutlet weak var locality: InputView!
    @IBOutlet weak var pincode: InputView!
    @IBOutlet weak var state: InputView!
    @IBOutlet weak var country: InputView!
    @IBOutlet weak var occupation: InputView!
    @IBOutlet weak var username: InputView!
    @IBOutlet weak var password: InputView!
    @IBOutlet weak var confirmPassword: InputView!
    
    @IBOutlet weak var submitButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        headingView.configView(with: "Sign Up Page")
        firstName.configView(with: "First Name")
        lastName.configView(with: "Last Name")
        email.configView(with: "Email")
        mobileNumber.configView(with: "Contact")
        houseNumber.configView(with: "House No.")
        locality.configView(with: "Locality")
        pincode.configView(with: "Pincode")
        state.configView(with: "State")
        country.configView(with: "Country")
        occupation.configView(with: "Occupation")
        username.configView(with: "Username")
        password.configView(with: "Password")
        confirmPassword.configView(with: "Confirm Password")
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = .systemGreen
        submitButton.layer.cornerRadius = 10
    }


    @IBAction func submitForm(_ sender: Any) {
        print("form submitted")
    }
    
}

