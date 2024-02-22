
//  HotelView.swift
//  oyo listing page
//
//  Created by Pragyaratan on 21/02/24.
////
//
import Foundation
import UIKit

protocol AnyView{
    var presenter: AnyPresenter? {get set}
    
    func update(with Hotels: [Hotel])
    func update(with error: String)
}


class HotelView: UIView, AnyView{

    
    var presenter: AnyPresenter?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    func update(with Hotels: [Hotel]){
        
    }
    func update(with error: String){
        
    }
}



