//
//  Badge.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/04/01.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols : some View{
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    var body: some View {
        // - ZStack: 배경처럼 뒤에 놓기
        ZStack {
            BadgeBackground()
            // - GeometryReader : 뱃지의 크기 수정
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
        
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
