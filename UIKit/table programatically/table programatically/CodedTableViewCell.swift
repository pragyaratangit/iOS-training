//
//  CodedTableViewCell.swift
//  table programatically
//
//  Created by Pragyaratan on 23/02/24.
//

import UIKit

class CodedTableViewCell: UITableViewCell {

    static let indetifier = "CodedTableViewCell"
    
    private let myLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let myImageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
     
    public func configure(with title: String, imageName: String){
        
        
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
        
        myLabel.text = title
        myLabel.textColor = .red
        myImageView.image = UIImage(named: imageName)
//        myImageView.contentMode =
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 310, y: 5
                               , width: contentView.frame.size.width -  104, height: 100)
        myImageView.frame = CGRect(x: 0, y: 5
                                   , width: 300, height: 90)
        
        myImageView.contentMode = .scaleAspectFit
        
        myImageView.layer.masksToBounds = true
        myImageView.layer.cornerRadius = 20
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
