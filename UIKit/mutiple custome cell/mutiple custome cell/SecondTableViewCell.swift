//
//  SecondTableViewCell.swift
//  mutiple custome cell
//
//  Created by Pragyaratan on 26/02/24.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    
    static let identifier = "SecondTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "SecondTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundColor = .red
    }

   
    
}
