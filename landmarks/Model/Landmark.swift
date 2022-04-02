//
//  Landmark.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/03/31.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark:Codable, Hashable, Identifiable{
    var id : Int
    var name : String
    var park :  String
    var state : String
    var description : String
    var isFavorite : Bool
    var isFeatured : Bool
    
    var category : Category
    
    enum Category : String, Codable, CaseIterable {
        case lakes = "Lakes"
        case rivers =  "Rivers"
        case mountains = "Mountains"
    }
    
    // - private1 : 사용자가 보여질 이미지 자체에만 신경쓰기때문에 private사용함
    private var imageName : String
    var image : Image {
        Image(imageName)
    }
    
    // - private2 : 계산된 property를 만드는데에만 사용될것이기 때문에 private 사용함
    private var coordinates : Coordinates
    var locationCoordinate : CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates : Codable, Hashable{
        var latitude : Double
        var longitude : Double
    }

}
