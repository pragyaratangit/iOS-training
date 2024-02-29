//
//  MyCollectionReusableHeader.swift
//  header and footer in collection view
//
//  Created by Pragyaratan on 29/02/24.
//

import UIKit

class MyCollectionReusableHeader: UICollectionReusableView {
    static let indentifier = "MyCollectionReusableHeader"
    
    private var label: UILabel = {
        let label = UILabel()
        
        label.text = "Header"
        label.backgroundColor = .systemGreen
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    public func configure() {
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}


class MyCollectionReusableFooter: UICollectionReusableView {
    static let indentifier = "MyCollectionReusableFooter"
    
    private var label: UILabel = {
        let label = UILabel()
        
        label.text = "Footer"
        label.backgroundColor = .systemBlue
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    public func configure() {
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
