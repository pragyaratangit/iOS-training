//
//  CollectionViewCell.swift
//  collection view in table cell
//
//  Created by Pragyaratan on 29/02/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var label: UILabel!
    
    static let identifier = "MyCollectionViewCell"
    
    static  func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    public func configure(with model: Model){
        self.label.text = model.description
        label.textColor = .orange
        self.imageView.image = UIImage(named: model.imageName)
        imageView.contentMode = .scaleToFill
    }
    
    
}
