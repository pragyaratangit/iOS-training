//
//  HotelPresenter.swift
//  oyo listing page
//
//  Created by Pragyaratan on 21/02/24.
//

import Foundation


protocol AnyPresenter{
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    
    func interactorDidFetchHotel(with result: Result<[Hotel], Error>)
}

class HotelPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
    func interactorDidFetchHotel(with result: Result<[Hotel], Error>){
        
    }
    
}
