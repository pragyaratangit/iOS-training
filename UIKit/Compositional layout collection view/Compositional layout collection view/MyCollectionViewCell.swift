//
//  MyCollectionViewCell.swift
//  Compositional layout collection view
//
//  Created by Pragyaratan on 01/03/24.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyCollectionViewCell"
    
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        
        return imageView
        
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        let images: [UIImage] = [
            UIImage(named: "Image1"),
            UIImage(named: "Image2"),
            UIImage(named: "Image3"),
            UIImage(named: "Image4"),
            UIImage(named: "Image5")].compactMap({$0})
        contentView.clipsToBounds = true
        imageView.image = images.randomElement()
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = contentView.bounds
    }
}
