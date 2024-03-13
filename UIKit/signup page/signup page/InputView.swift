//
//  InputView.swift
//  signup page
//
//  Created by Pragyaratan on 13/03/24.
//

import UIKit


 class InputView: UIView {
     
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
//        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureView(){
        guard let view = self.loadViewFromNib(nibName: "InputView") else {return}
        view.frame = self.bounds
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .opaqueSeparator
        
        
        self.addSubview(view)
    
    }
    
    public func configView(with labelName: String){
        textLabel.text = labelName
        textLabel.font = UIFont.systemFont(ofSize: 20)
    }
    
}



//extension UIView{
//     func loadViewFromNib(nibName: String) -> UIView? {
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: nibName, bundle: bundle)
//        
//        return nib.instantiate(withOwner: self, options: nil).first as? UIView
//       
//    }
//}
