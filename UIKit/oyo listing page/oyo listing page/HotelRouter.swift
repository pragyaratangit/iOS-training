//
//  HotelRouter.swift
//  oyo listing page
//
//  Created by Pragyaratan on 21/02/24.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController


protocol AnyRouter{
    // a view which conform AnyView and UIViewController protocols
    var entry: EntryPoint? {get set}
    
    static func start() -> AnyRouter
}


class HotelRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = HotelRouter()
        
        
        let view = HotelView()
        let interactor = HotelInteractor()
        let presenter = HotelPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        
//        router.entry = view
        
        return router
    }
}
