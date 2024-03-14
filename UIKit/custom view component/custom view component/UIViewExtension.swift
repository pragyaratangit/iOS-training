//
//  UIViewExtension.swift
//  custom view component
//
//  Created by Pragyaratan on 13/03/24.
//

import Foundation
import UIKit


extension UIView{
    
    func loadViewFromNIb( nibName: String) -> UIView? {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        return nib.instantiate(withOwner: self).first as? UIView
        
        
    }
}
