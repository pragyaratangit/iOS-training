//
//  FirstTableViewCell.swift
//  mutiple custome cell
//
//  Created by Pragyaratan on 26/02/24.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    
    static let identifier = "FirstTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FirstTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        backgroundColor = .blue
    }

    
}
