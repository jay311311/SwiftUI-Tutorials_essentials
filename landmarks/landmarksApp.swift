//
//  landmarksApp.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/03/31.
//

import SwiftUI

@main
struct landmarksApp: App {
// 앱의 life time동안 한번 주어진 property를 초기화 하기위함
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
