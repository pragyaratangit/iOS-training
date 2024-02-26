//
//  MyTableViewCell.swift
//  button in table
//
//  Created by Pragyaratan on 26/02/24.
//

import UIKit

protocol MyTableViewCellDelegate: AnyObject {
    func didTap(with title: String)
}


class MyTableViewCell: UITableViewCell {

    
    static func nib() -> UINib{
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    static let identifier = "MyTableViewCell"
    // capturing value of title
    private var title: String = ""
    // using delegate to handle action 
    weak var delegate: MyTableViewCellDelegate?
    
    
    @IBOutlet weak var MyButton: UIButton!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with title: String){
        self.title = title
        MyButton.setTitle(title, for: .normal)
    }
    
    
    @IBAction func buttonTap(_ sender: UIButton) {
        
        delegate?.didTap(with: title)
//        print("button tap")
    }
    
}
