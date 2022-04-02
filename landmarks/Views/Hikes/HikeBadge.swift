//
//  HikeBadge.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/04/02.
//

import SwiftUI

struct HikeBadge: View {
    var name : String
    var body: some View {
        VStack(alignment: .center){
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            //뱃지는 프레임의 크기에 따라 결과를 생성합니다. 원하는 모양을 위해, 300 x 300 포인트의 프레임으로 렌더링후, 렌더링된 결과를 조정하고 비교적 작은 프레임에 놓으세요.
            Text(name)
                .font(.caption)
                .accessibilityLabel("badge for \(name)")
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
