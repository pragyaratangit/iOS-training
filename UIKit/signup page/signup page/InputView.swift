//
//  InputView.swift
//  signup page
//
//  Created by Pragyaratan on 13/03/24.
//

import UIKit
@IBDesignable
class InputView: UIView {

    var inputLabel: String = ""
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func config(with labelName: String){
        textField.text = labelName
    }
    
    
}



extension UIView{
    
}
