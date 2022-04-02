//
//  ProfileHost.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/04/02.
//

import SwiftUI

struct ProfileHost: View {
    // - @Environment(\.editMode) : editMode 값을 읽고 쓰고 수정할수 있게 해준다
    // -  SwiftUI가 제공하는 스토리지
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData : ModelData
    @State private var draftProfile  =  Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                if editMode?.wrappedValue == .active{
                    // - 취소 버튼은 실제 profile 데이터 수정 x. <-> EditButton()
                    Button("Cancle", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                // -  EditButton() : editMode의 값을 제어합니다.
                EditButton()
            }
             
            if editMode?.wrappedValue == .inactive{
                ProfileSummary(profile: modelData.profile)
            }else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        // -  사용자가 완료버튼 누를때 업데이트 되게끔
                        // - 그렇지 않으면 이전값이 활성화되어 나타남
                        modelData.profile =  draftProfile
                    }
                
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
        // 자식뷰 ProfileSummary 가  @EnvironmentObject을 이용하기때문에 -> 없으면 프리뷰 실패
    }
}
