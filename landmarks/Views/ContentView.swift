//
//  ContentView.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/03/31.
//

import SwiftUI

struct ContentView: View {
    @State private var selection : Tab = .Featured
    
    enum Tab{
        case Featured
        case List
    }
    
    var body: some View {
        TabView(selection: $selection){
            // -  tag : selection속성
            CategoryHome()
                .tabItem({
                    Label("List",systemImage: "star")
                })
                .tag(Tab.Featured)
            LandmarkList()
                .tabItem({
                    Label("List",systemImage: "list.bullet")
                })
                .tag(Tab.List)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // 모든 하위 뷰에서 ModelData를 사용하기위해 추가
        // 미리보기에서는 environmentObject(_:) 가 없으면 미리보기 실패.
        ContentView()
            .environmentObject(ModelData())
    }
}
