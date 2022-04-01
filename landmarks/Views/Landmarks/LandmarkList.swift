//
//  LandmarkList.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/03/31.
//

import SwiftUI

struct LandmarkList: View {
    // modelData는 environmentObject(_:)의해 자동으로 값을 얻고,부모에게도 값이 적용된다.
    @EnvironmentObject var modelData : ModelData
    // -  private 3 : 뷰와 하위뷰에 관련된 상태속성은 항상 상태를 비공개(private) 처리
    @State private var showFavoriteOnly =  false
    
    var filteredLandmarks: [Landmark]{
        modelData.landmarks.filter { landmark in
            ( !showFavoriteOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            // -  foreach : 정적뷰 + 동적뷰 또는 동적뷰 + 동적뷰 결함하기위해 foreach사용
            List{
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label : {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
