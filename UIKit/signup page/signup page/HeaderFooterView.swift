//
//  HeaderFooterView.swift
//  signup page
//
//  Created by Pragyaratan on 13/03/24.
//

import UIKit

class HeaderFooterView: UIView {

    
    
    @IBOutlet weak var headingLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "HeaderFooterView") else {return}
        
        
        view.frame = self.bounds
        self.addSubview(view)
        
    }
    
    
    func configView(with title: String){
        headingLabel.text = title
    }
    
}
