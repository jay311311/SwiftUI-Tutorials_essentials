//
//  Hike.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/04/01.
//

import Foundation

struct Hike : Codable , Hashable, Identifiable{
    var name : String
    var id : Int
    var distance :  Double
    var difficulty : Int
    var observations : [Observation]
    
    static var formatter =  LengthFormatter()
    
    var distanceText :  String {
        Hike.formatter.string(fromValue: distance, unit: .kilometer)
    }
    
    
    struct Observation : Codable, Hashable{
       var elevation: Range<Double>
        var pace : Range<Double>
        var heartRate : Range<Double>
        var distanceFromStart : Double
    }
}
