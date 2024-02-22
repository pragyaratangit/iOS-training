//
//  HotelInteractor.swift
//  oyo listing page
//
//  Created by Pragyaratan on 21/02/24.
//

import Foundation


protocol AnyInteractor{
    var presenter: AnyPresenter? {get set}
    
    func getHotel()
}

class HotelInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getHotel(){
        
    }
}
