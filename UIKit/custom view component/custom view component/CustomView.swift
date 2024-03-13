//
//  CustomView.swift
//  custom view component
//
//  Created by Pragyaratan on 13/03/24.
//

import UIKit

class CustomView: UIView {

    
    @IBOutlet weak var textLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configView()
    }
    
    
    private func configView() {
        
        
        guard let view = self.loadViewFromNIb(nibName: "CustomView") else {return}
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func configText(with text: String){
        textLabel.text = text
    }
}
