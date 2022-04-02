//
//  CategoryHome.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/04/01.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData : ModelData
    @State private var showingProfile =  false
    var body: some View {
        // -  NavigationView : 다른 카테고리들을 호스팅 하기위함
        NavigationView{
            List{
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height:200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id : \.self ){
                    key in CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("user Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
        
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
