//
//  ContentView.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/03/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       LandmarkList()
    
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
