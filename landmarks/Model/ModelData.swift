//
//  ModelData.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/03/31.
//

import Foundation
import Combine

final class ModelData : ObservableObject{
    // - @Published : 관찰가능한 객체(ObservableObject)는 데이터에대한 변경사항이 있다면 published 해야함, 기여자가 데이터의 변경사항을 선택할수 있도록
    @Published var landmarks : [Landmark] = load("landmarkData.json")
    var hikes :[Hike] = load("hikeData.json")
}



func load <T : Decodable>(_ filename : String) -> T {
    let data : Data
    
    guard let file =  Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        data =  try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
        
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
