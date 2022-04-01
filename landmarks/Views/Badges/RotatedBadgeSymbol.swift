//
//  RotatedBadgeSymbol.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/04/01.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
        
        var body: some View {
            BadgeSymbol()
                .padding(-60)
                .rotationEffect(angle, anchor: .bottom)
        }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))    }
}
