//
//  CircleImage.swift
//  landmarks
//
//  Created by Jooeun Kim on 2022/03/31.
//

import SwiftUI

struct CircleImage: View {
    var image : Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.blue, lineWidth: 4.0)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
