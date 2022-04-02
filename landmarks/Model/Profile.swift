//
//  Profile.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/04/02.
//

import Foundation

struct Profile {
    var username: String
    var preferNotifications = true
    var seasonalPhoto =  Season.winter
    var goalData = Date()
    
    static let `default` =  Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable{
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id : String{rawValue}
    }
}
