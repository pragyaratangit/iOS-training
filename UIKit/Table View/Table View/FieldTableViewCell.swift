//
//  FieldTableViewCell.swift
//  Table View
//
//  Created by Pragyaratan on 22/02/24.
//

import UIKit

class FieldTableViewCell: UITableViewCell, UITextFieldDelegate {

    
    
    
    @IBOutlet weak var myInputField: UITextField!
    
    static let identifier = "FieldTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FieldTableViewCell", bundle: nil)
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        myInputField.delegate = self
        myInputField.placeholder = "Enter text data "
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myInputField.resignFirstResponder()
        print("\(myInputField.text ?? "")")
        return true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
