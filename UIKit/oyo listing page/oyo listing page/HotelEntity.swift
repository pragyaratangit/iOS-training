//
//  HotelDataModel.swift
//  oyo listing page
//
//  Created by Pragyaratan on 21/02/24.
//

import Foundation

class Hotel {
    var hotelName: String?
    var hotelAddress: String?
    var hotelQuality: [String]?
    var hotelRating: Double?
    var ratingCount: Int?
    var payingMode: String?
    var hotelTag: String?
    var currentRoomPrice: Int?
    var originalRoomPrice: Int?
    var dicountPercentage: Int?
    var extraCharges: Int?
    
    init(hotelName: String, hotelAddress: String, hotelQuality: [String], hotelRating: Double, ratingCount: Int, payingMode: String, hotelTag: String, currentRoomPrice: Int, originalRoomPrice: Int, dicountPercentage: Int, extraCharges: Int) {
        self.hotelName = hotelName
        self.hotelAddress = hotelAddress
        self.hotelQuality = hotelQuality
        self.hotelRating = hotelRating
        self.ratingCount = ratingCount
        self.payingMode = payingMode
        self.hotelTag = hotelTag
        self.currentRoomPrice = currentRoomPrice
        self.originalRoomPrice = originalRoomPrice
        self.dicountPercentage = dicountPercentage
        self.extraCharges = extraCharges
    }
    
    
    
}
