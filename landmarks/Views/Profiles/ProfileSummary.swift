//
//  ProfileSummary.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/04/02.
//

import SwiftUI
// 상위뷰 phrileHost가 상태 값을 관리할것이기때문데 바인딩이아닌 Profile의 값을 가져와야한다
struct ProfileSummary: View {
    var profile : Profile
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text("\(profile.username)")
                    .bold()
                    .font(.title)
                Text("Notifications: \(profile.preferNotifications ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date : ")+Text(profile.goalData,style: .date)
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Completed Badges")
                        .font(.headline)
                    ScrollView(.horizontal){
                        HStack{
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                         HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: ModelData().hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
