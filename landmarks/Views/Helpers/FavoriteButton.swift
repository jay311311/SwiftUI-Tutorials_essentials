//
//  FavoriteButton.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/03/31.
//

import SwiftUI

struct FavoriteButton: View {
    //바인딩을 사용하기때문에 해당뷰의 변경사항은 데이터소스로 전달된다
    @Binding var isSet : Bool
    
    var body: some View {
        Button{
            isSet.toggle()
        } label: {
            // .iconOnly는 voiveOver일때는 접근성을 향상시킨다
            Label("toggle Favorite", systemImage: isSet ? "star.fill" :"star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
