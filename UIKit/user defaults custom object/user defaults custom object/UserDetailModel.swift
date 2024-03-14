//
//  UserDetailModel.swift
//  user defaults custom object
//
//  Created by Pragyaratan on 14/03/24.
//

import Foundation


struct UserDetail: Codable{
    
    var name: String?
    var age: Int?
    var contact: String?
    var city: String?
    
    
    init(){
        name = ""
        age = 0
        contact = ""
        city = ""
    }
}
