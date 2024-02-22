//
//  DemoTableViewCell.swift
//  Table View
//
//  Created by Pragyaratan on 22/02/24.
//

import UIKit

class DemoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var myLabel: UILabel!
    
    
    @IBOutlet weak var myImage: UIImageView!
    
    static let identifier = "DemoTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DemoTableViewCell", bundle: nil)
    }
    
    public func setImageLabel(with title: String, image: String){
        myImage.image = UIImage(systemName: image)
        myLabel.text = title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
