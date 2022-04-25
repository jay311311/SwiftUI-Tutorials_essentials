//
//  PageView.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/04/25.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 1


    var body: some View {
        //순서 표시하는 땡땡떙 레이아웃을 위해 ZStack사용
        ZStack(alignment: .bottomTrailing){
            // $ 사용하여 저장된 값의 바인딩한것이다
                PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                            .frame(width: CGFloat(pages.count * 18))
                            .padding(.trailing)
            }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
                  .aspectRatio(3 / 2, contentMode: .fit)
    }
    
    
}
